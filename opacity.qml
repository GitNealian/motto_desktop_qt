import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Window 2.15

Window {
    title: '透明度'
    visible: true
    width: pane.width
    height:pane.height
    Component.onCompleted: {
        setX(Screen.width / 2 - width / 2);
        setY(Screen.height / 3 - height / 2);
    }
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
                background: Rectangle {
                    x: slider.leftPadding
                    y: slider.topPadding + slider.availableHeight / 2 - height / 2
                    implicitWidth: 200
                    implicitHeight: 6
                    width: slider.availableWidth
                    height: implicitHeight
                    radius: 2
                    color: "#bdbebf"

                    Rectangle {
                        width: slider.visualPosition * parent.width
                        height: parent.height
                        color: "black"
                        radius: 2
                    }
                }
                handle: Rectangle {
                    x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
                    y: slider.topPadding + slider.availableHeight / 2 - height / 2
                    implicitWidth: 13
                    implicitHeight: 26
                    radius: 3
                    color: "black"
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


