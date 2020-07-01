import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15

Window {
    id: window
    visible: true
    flags: Qt.ToolTip
    color:  "transparent"

    property bool adjustment: false
    property int posX: 0
    property int posY: 0

    function exit(){
        Qt.quit()
    }

    function onWindowSizeChange(){
        console.log(window.width)
        layout.width = window.width
        layout.height = window.height
    }

    Component.onCompleted: {
        window.posX = window.x
        window.posY = window.y
    }
    Rectangle {
        id: windowBackgroud
        visible: false
        anchors.fill: parent
        color: "#1F000000"
        radius: 10
    }

    Button {
        visible: false
        id: closeButton
        width: 25
        height: 25
        contentItem:
            Text {
            color: "white"
            text: "✔"
            font.pixelSize: 14
        }

        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5
        background: Rectangle{
            color: "#44000000"
            radius: 12.5
        }
        onHoveredChanged: {
            if(hovered){
                background.color ="#66000000"
            }else{
                background.color = "#44000000"
            }

        }

        onClicked: {
            window.posX = window.x
            window.posY = window.y
            mouseArea.visible = true
            closeButton.visible = false
            adjustment = false
            window.color = "transparent"
            window.close()
            window.flags = Qt.ToolTip
            window.show()
            windowBackgroud.visible = false
        }
    }

    Connections {
        target: menu
        function onExit() {
            Qt.quit()
        }

        function onColor(color){
            console.log(color)
        }

        function onAdjust(){
            window.adjustment = true
            window.close()
            window.flags = Qt.Window | Qt.FramelessWindowHint
            window.setX(window.posX)
            window.setY(window.posY)
            window.show()
            mouseArea.visible = false
            closeButton.visible = true
            windowBackgroud.visible = true
        }

        function onSettings(){
            settingsWindow.show()
        }
    }

    Timer {
        id: timer
        interval: 300;
        running: false
        repeat: true
        onTriggered: {
            window.opacity = 1
            window.flags = window.flags & ~Qt.WindowTransparentForInput
            timer.stop()
        }
    }
    MouseArea{
        id: mouseArea
        width: layout.width
        height: layout.height
        onEntered: {
            if( !window.adjustment){
                window.opacity = 0.1
                window.flags = window.flags | Qt.WindowTransparentForInput
                timer.start()
            }
        }
        hoverEnabled: true
    }

    ColumnLayout {
        spacing: 0
        id: layout
        anchors.fill: parent
        Label {
            text: "人生就像騎腳踏車，想保持平衡就得往前走。"
            rightPadding: 20
            wrapMode: Text.WrapAnywhere
            padding: 10
            Layout.fillWidth: true
            verticalAlignment: Text.AlignTop
            renderType: Text.QtRendering
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 28
            color: "black"
        }
        Label {
            text: "—— 愛因斯坦"
            wrapMode: Text.WordWrap
            padding: 5
            topPadding: -5
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 24
            color: "black"
        }
    }

    Opacity {
        id: opacityWindow
        visible: false
        onOpacityChanged: {
            window.opacity = value
        }
    }

    Settings {
        id: settingsWindow
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_y:0}
}
##^##*/
