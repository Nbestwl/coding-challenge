import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3

Window {
    visible: true
    width: 640
    height: 480
    color: "#161212"
    title: qsTr("Coding Challenge Chat Tool")

    Rectangle {
        id: rectangle1
        x: 10
        y: 10
        width: 621
        height: 223
        border.color: "#020202"
        opacity: 1

        MouseArea {
           anchors.fill: parent
           onClicked: {
               rectangle1.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
           }
        }

        Rectangle {
            id: rectangle3
            x: 8
            y: 8
            width: 430
            height: 40
            border.color: "#020202"
            opacity: 1

            TextInput {
                id: textInput1
                x: 8
                y: 8
                width: 424
                height: 37
                text: qsTr("")
                font.pixelSize: 12
            }
        }

        Button {
            id: button1
            x: 440
            y: 8
            width: 100
            height: 40
            text: "Send"

            MouseArea {
                anchors.fill: parent
                onPressedChanged: {
                    if(pressed) {
                        console.log("Mouse area is pressed")
                    }
                }
            }
        }
    }

    Rectangle {
        id: rectangle2
        x: 10
        y: 244
        width: 621
        height: 223
        opacity: 1
        border.color: "#020202"

        MouseArea {
           anchors.fill: parent
           onClicked: {
               rectangle2.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
           }
        }

        Rectangle {
            id: rectangle4
            x: 8
            y: 8
            width: 430
            height: 40
            border.color: "#020202"
            opacity: 1

            TextInput {
                id: textInput2
                x: 8
                y: 8
                width: 424
                height: 37
                text: qsTr("")
                font.pixelSize: 12
            }
        }

        Button {
            id: button2
            x: 440
            y: 8
            width: 100
            height: 40
            text: "Send"
        }
    }
}
