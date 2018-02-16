import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.3

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    color: "#161212"
    //  this set up the window title for the application
    title: qsTr("Coding Challenge Chat Tool")

    //  this Rectangle is the top rectangle component of the UI
    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: mainWindow.width
        height: mainWindow.height * 0.49
        border.color: "#020202"
        opacity: 1

        MouseArea {
            anchors.fill: parent
            onClicked: {
                rectangle1.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
            }

            Text {
                id: text1
                x: 8
                y: 8
                width: 62
                height: 39
                color: "steelblue"
                text: qsTr("Ian")
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            id: rectangle3
            x: 77
            y: 8
            width: 430
            height: 40
            border.color: "#020202"
            opacity: 1

            TextInput {
                id: textInput1
                x: 8
                y: 8
                width: 427
                height: 37
                text: qsTr("")
                font.pixelSize: 12
            }
        }

        Button {
            id: button1
            x: 513
            y: 8
            width: 100
            height: 40
            text: "Send"

            MouseArea {
                anchors.rightMargin: -51
                anchors.bottomMargin: 0
                anchors.leftMargin: 51
                anchors.topMargin: 0
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
        x: 0
        y: mainWindow.height * 0.5
        width: mainWindow.width
        height: mainWindow.height * 0.49
        opacity: 1
        border.color: "#020202"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                rectangle2.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
            }

           Text {
               id: text2
               x: 8
               y: 8
               width: 62
               height: 39
               color: "steelblue"
               text: qsTr("Lei")
               font.pixelSize: 24
               horizontalAlignment: Text.AlignHCenter
               verticalAlignment: Text.AlignVCenter
           }
        }

        Rectangle {
            id: rectangle4
            x: 77
            y: 8
            width: 430
            height: 40
            border.color: "#020202"
            opacity: 1

            TextInput {
                id: textInput2
                x: 8
                y: 8
                width: 428
                height: 37
                text: qsTr("")
                font.pixelSize: 12
            }
        }

        Button {
            id: button2
            x: 513
            y: 8
            width: 100
            height: 40
            text: "Send"
        }
    }
}
