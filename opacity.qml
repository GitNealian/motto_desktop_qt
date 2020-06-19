import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Window 2.15
import QtQuick.Layouts 1.11
import QtQuick.Controls.Styles 1.4

Window {
    title: '透明度'
    visible: true
    width: pane.width
    height:pane.height

    Pane {
        id: pane
        padding: 40
        Row {
            id: rowLayout
            Slider {
                id: slider
                padding: 10
                width: 400
                value: 0.5
                onValueChanged: {
                    textNumber.text = Math.floor(slider.value * 100) + '%'
                }
            }

            Text {
                id: textNumber
                text: qsTr("50%")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 18
                width: 30
            }

        }
    }

}


