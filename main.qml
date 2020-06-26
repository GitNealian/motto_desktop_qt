import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15

Window {
    id: window
    visible: true
    flags: Qt.ToolTip
    width: layout.width
    height: layout.height
    color:  "transparent"

    property bool adjustment: false
    property int posX: 0
    property int posY: 0

    function exit(){
        Qt.quit()
    }

    Component.onCompleted: {
        window.posX = window.x
        window.posY = window.y
    }

    Button {
        visible: false
        id: closeButton
        width: 30
        height: 30
        contentItem:
            Text {
            color: "green"
            text: "✔"
            font.pixelSize: 20
        }

        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        background: Rectangle{
            color: "white"
            radius: 15
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
            window.color = "#0F001100"
            closeButton.visible = true
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
        Label {
            text: "静"
            Layout.fillWidth: true
            verticalAlignment: Text.AlignTop
            renderType: Text.QtRendering
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 120
            color: "black"
        }
        Label {
            text: "涵养精神"
            font.pixelSize: 45
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
    D{i:1;anchors_y:0}
}
##^##*/
