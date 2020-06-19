import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12

Window {
    id: window
    visible: true
    flags: Qt.ToolTip | Qt.WindowStaysOnTopHint
    width: layout.width
    height: layout.height
    color:  "transparent"
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
        width: layout.width
        height: layout.height
        onEntered: {
            window.opacity = 0.1
            window.flags = window.flags | Qt.WindowTransparentForInput
            timer.start()
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
}
