import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.3

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640 * 1.3
    height: 480 * 1.3
    color: "#161212"
    //  this set up the window title for the application
    title: qsTr("Coding Challenge Chat Tool")

    //  this Rectangle is the top rectangle component of the UI
    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        //  inherite window sizes from the main window to resize component proportionally
        width: parent.width
        height: parent.height * 0.49
        border.color: "#020202"
        opacity: 1

        //  this is the name of the user
        Text {
            id: text1
            x: 8
            y: 8
            width: 62
            height: 39
            color: "steelblue"
            text: qsTr("Ian")
            font.pixelSize: 24
            //  align the text to the center
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        //  this is the first user input field and it resize according to its parent's window size
        TextField {
            id: input1
            x: parent.width * 0.1
            y: parent.height * 0.03
            width: parent.width * 0.6
            validator: IntValidator {bottom: 11; top: 31;}
            focus: true
        }

        //  send button component, also inherite the size from its parent
        Button {
            id: button1
            x: parent.width * 0.1 + input1.width + 10
            y: parent.height * 0.03
            width: parent.width * 0.15
            height: input1.height
            text: "Send"

            //  signal handler for button on clicking
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

    //  this is the second rectangle at the bottom of the UI
    Rectangle {
        id: rectangle2
        x: 0
        y: parent.height * 0.5
        width: parent.width
        height: parent.height * 0.49
        opacity: 1
        border.color: "#020202"

        //  this is the second user name
        Text {
            id: text2
            x: 8
            y: 8
            width: 62
            height: 39
            color: "steelblue"
            text: qsTr("Lei")
            font.pixelSize: 24
            //  align the text to the center
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        //  this is the first user input field and it resize according to its parent's window size
        TextField {
            id: input2
            x: parent.width * 0.1
            y: parent.height * 0.03
            width: parent.width * 0.6
            validator: IntValidator {bottom: 11; top: 31;}
            focus: false
        }

        //  send button component, also inherite the size from its parent
        Button {
            id: button2
            x: parent.width * 0.1 + input2.width + 10
            y: parent.height * 0.03
            width: parent.width * 0.15
            height: input2.height
            text: "Send"

            //  signal handler for button on clicking
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
}
