import QtQuick 2.0
import QtQuick.Window 2.14
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.11
import PreviewImage 1.0

Window {
    id: window
    width: 800
    height: 400
    maximumWidth: width
    maximumHeight: height
    minimumHeight: height
    minimumWidth: width

    Component.onCompleted: {
        setX(Screen.width / 2 - width / 2);
        setY(Screen.height / 3 - height / 2);
    }
    title: '设置'

    visible: false
    Pane {
        id: pane
        x: 0
        y: 0
        width: 800
        height: 400
        ColumnLayout {
            id: columnLayout
            width: 380
            spacing: 20

            Label {
                id: label
                text: qsTr("主内容框")
                font.bold: false
                font.pointSize: 16
            }

            RowLayout {
                id: rowLayout
                spacing: 10

                Label {
                    id: label1
                    text: qsTr("内容")
                    font.pointSize: 14
                }

                TextField {
                    id: textField
                    Layout.fillWidth: true
                    font.pointSize: 14
                    background: Rectangle{
                        radius: 5
                        border.width: textField.focus ? 2:1
                        border.color: "gray"
                    }
                }
            }

            RowLayout {
                id: rowLayout1
                width: 380
                spacing: 10

                Label {
                    id: label2
                    text: qsTr("字体")
                    font.pointSize: 14
                }

                ComboBox {
                    id: comboBox
                    Layout.preferredWidth: 200
                    font.pointSize: 14
                }

                SpinBox {
                    id: spinBox
                    from: 10
                    to: 500
                    Layout.fillWidth: true
                    font.pointSize: 14
                    editable: true
                }
            }
        }

        ColumnLayout {
            id: columnLayout1
            y: 204
            width: 380
            Label {
                id: label3
                text: qsTr("副内容框")
                font.bold: false
                font.pointSize: 16
            }

            RowLayout {
                id: rowLayout2
                Label {
                    id: label4
                    text: qsTr("内容")
                    font.pointSize: 14
                }

                TextField {
                    id: textField1
                    Layout.fillWidth: true
                    font.pointSize: 14
                    background: Rectangle{
                        radius: 5
                        border.width: textField1.focus ? 2:1
                        border.color: "gray"
                    }
                }
                spacing: 10
            }

            RowLayout {
                id: rowLayout3
                width: 380
                Label {
                    id: label5
                    text: qsTr("字体")
                    font.pointSize: 14
                }

                ComboBox {
                    id: comboBox1
                    Layout.preferredWidth: 200
                    font.pointSize: 14
                    currentIndex: -1
                }
                SpinBox {
                    id: spinBox1
                    from: 10
                    to: 500
                    font.pointSize: 14
                    editable: true
                    Layout.fillWidth: true
                }
                spacing: 10
            }
            spacing: 20
        }

        Rectangle {
            id: rectangle
            x: 423
            y: 38
            height: 230
            width: 353
            color: "#ffffff"
            anchors.right: parent.right
            border.width: 1
            anchors.bottom: rowLayout4.top
            anchors.bottomMargin: 15
            anchors.top: label6.bottom
            anchors.topMargin: 19

            PreviewImage {
                id: image
                x: 411
                y: 38
                anchors.fill: parent
            }
        }

        RowLayout {
            property int activeIndex: 0
            id: rowLayout4
            x: 423
            y: 296
            width: 353
            height: 60
            spacing: 12
            Button {
                id: button
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                display: AbstractButton.IconOnly
                onClicked: {
                    image.changeColor("orange")
                    rowLayout4.activeIndex = 0
                }
                background: Image {
                    width: button.width
                    height: button.height
                    source: rowLayout4.activeIndex == 0 ? "images/style_1_active.png" :  "images/style_1.png"
                }
            }

            Button {
                id: button1
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                display: AbstractButton.IconOnly
                onClicked: {
                    rowLayout4.activeIndex = 1
                }
                background: Image {
                    width: button.width
                    height: button.height
                    source: rowLayout4.activeIndex == 1 ? "images/style_2_active.png" :  "images/style_2.png"
                }
            }

            Button {
                id: button2
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                display: AbstractButton.IconOnly
                onClicked: {
                    rowLayout4.activeIndex = 2
                }
                background: Image {
                    width: button.width
                    height: button.height
                    source: rowLayout4.activeIndex == 2 ? "images/style_3_active.png" :  "images/style_3.png"
                }
            }

            Button {
                id: button3
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                display: AbstractButton.IconOnly
                onClicked: {
                    rowLayout4.activeIndex = 3
                }
                background: Image {
                    width: button.width
                    height: button.height
                    source: rowLayout4.activeIndex == 3 ? "images/style_4_active.png" :  "images/style_4.png"
                }
            }

            Button {
                id: button4
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                display: AbstractButton.IconOnly
                onClicked: {
                    rowLayout4.activeIndex = 4
                }
                background: Image {
                    width: button.width
                    height: button.height
                    source: rowLayout4.activeIndex == 4 ? "images/style_5_active.png" :  "images/style_5.png"
                }
            }
        }

        Label {
            id: label6
            x: 423
            y: 0
            text: qsTr("预览")
            font.bold: false
            font.pointSize: 16
        }

        Button {
            id: button5
            x: 696
            y: -5
            width: 80
            text: qsTr("应用")
            font.pointSize: 14
        }


    }





}


