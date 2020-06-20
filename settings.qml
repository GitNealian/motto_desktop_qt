import QtQuick 2.0
import QtQuick.Window 2.14
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11

Window {
    id: window
    width: 800
    height: 400
    maximumWidth: width
    maximumHeight: height
    minimumHeight: height
    minimumWidth: width
    title: '设置'
    visible: true
    Pane {
        id: pane
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
                    anchors.verticalCenter: parent.verticalCenter
                }

                ComboBox {
                    id: comboBox
                    Layout.fillWidth: true
                    font.pointSize: 14
                    currentIndex: -1
                }

                SpinBox {
                    id: spinBox
                    font.pointSize: 14
                }
            }

        }

        ColumnLayout {
            id: columnLayout1
            x: -4
            y: 204
            width: 380
            anchors.rightMargin: 0
            anchors.right: columnLayout.right
            anchors.left: columnLayout.left
            anchors.leftMargin: 0
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
                    anchors.verticalCenter: parent.verticalCenter
                }

                ComboBox {
                    id: comboBox1
                    Layout.fillWidth: true
                    font.pointSize: 14
                    currentIndex: -1
                }

                SpinBox {
                    id: spinBox1
                    scale: 1
                    font.pointSize: 14
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

            Image {
                id: image
                x: 411
                y: 38
                anchors.fill: parent
                fillMode: Image.Stretch
                source: "qrc:/qtquickplugin/images/template_image.png"
            }
        }

        RowLayout {
            id: rowLayout4
            x: 423
            y: 296
            width: 353
            height: 60
            anchors.right: parent.right
            spacing: 12
            anchors.bottom: columnLayout1.bottom
            anchors.left: image.left
            Button {
                id: button
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                text: qsTr("Button")
                display: AbstractButton.IconOnly
            }

            Button {
                id: button1
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                text: qsTr("Button")
                display: AbstractButton.IconOnly
            }

            Button {
                id: button2
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                text: qsTr("Button")
                display: AbstractButton.IconOnly
            }

            Button {
                id: button3
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                text: qsTr("Button")
                display: AbstractButton.IconOnly
            }

            Button {
                id: button4
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                text: qsTr("Button")
                display: AbstractButton.IconOnly
            }
        }

        Label {
            id: label6
            x: 423
            y: 0
            text: qsTr("预览")
            anchors.top: parent.top
            anchors.left: image.left
            font.bold: false
            font.pointSize: 16
        }


    }





}


