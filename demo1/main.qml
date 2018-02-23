import QtQuick.Window 2.2
import QtQuick 2.8
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

import ChatServer 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640 * 1.3
    height: 480 * 1.3
    color: "#161212"
    //  this set up the window title for the application
    title: qsTr("Coding Challenge Chat Tool")

    //  Prompt a pop window for user name registration
    Component.onCompleted: popup.open()

    // popup window setup
    Dialog {
        id: popup
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        parent: ApplicationWindow.overlay
        width: parent.width / 2
        height: parent.height / 2
        modal: true
        focus: true
        title: qsTr("Username Registration")

        Text {
            id: usertext1
            color: "steelblue"
            text: qsTr("User 1")
            font.pixelSize: 17
            //  align the text to the center
            anchors {
                right: username1.left
                verticalCenter: username1.verticalCenter
                rightMargin: 10
            }
        }
        //  Username1 input field
        TextField {
            id: username1
            width: parent.width * 0.5
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            placeholderText: qsTr("Enter username...")
            font.pixelSize: 13
            focus: true
        }
        //  warning message field
        Text {
            id: warning1
            color: "red"
            font.pixelSize: 12
            //  align the text to the center
            anchors {
                left: username1.right
                verticalCenter: username1.verticalCenter
                leftMargin: 10
            }
        }

        Text {
            id: usertext2
            color: "steelblue"
            text: qsTr("User 2")
            font.pixelSize: 17
            //  align the text to the center
            anchors {
                right: username2.left
                verticalCenter: username2.verticalCenter
                rightMargin: 10
            }
            horizontalAlignment: Text.AlignHCenter
        }
        //  Username2 input field
        TextField {
            id: username2
            width: parent.width * 0.5
            anchors {
                top: username1.bottom
                topMargin: 40
                horizontalCenter: parent.horizontalCenter
            }
            placeholderText: qsTr("Enter username...")
            font.pixelSize: 13
            focus: false
        }
        //  warning message for user 2
        Text {
            id: warning2
            color: "red"
            font.pixelSize: 12
            //  align the text to the center
            anchors {
                left: username2.right
                verticalCenter: username2.verticalCenter
                leftMargin: 10
            }
        }
        //  Button for registration confirmation
        Button {
            anchors {
                top: username2.bottom
                topMargin: 80
                horizontalCenter: parent.horizontalCenter
            }

            text: qsTr("Enter chat room")
            onClicked: checkUser()  //  call the JS function for user name validation
        }
    }

    //  customized function for handling username empty check and make usernames are not duplicated
    function checkUser() {
        if(username1.text.length == 0) {
            warning1.text = "Username empty"
            console.log("Username2 is empty")
        } else {
            warning1.text = ""
        }

        if(username2.text.length == 0) {
            warning2.text = "Username empty"
            console.log("Username2 is empty")
        } else {
            warning2.text = ""
        }

        if((username1.text == username2.text) && (username1.text.length != 0)) {
            warning1.text = "Name duplicated"
            warning2.text = "Name duplicated"
            console.log("please enter a different name")
        }

        if((username1.text != username2.text) && (username1.text.length != 0) && (username2.text.length != 0)){
            popup.close()   //  close the popup if the username satifies the above conditions
            console.log("users register successful")
        }
    }

    //  initialize ChatServer component
    ChatServer {
        id: chatserver
    }

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
            text: username1.text
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
            placeholderText: qsTr("Enter message...")
            font.pixelSize: 15
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
                id: mouseArea1
                anchors.fill: parent
                onPressedChanged: {
                    if(pressed || EnterKey.onClicked) {
                        console.log("Sending: ", input1.text)
                        if(input1.text.length != 0) {
                            chatserver.sendMessage(input1.text, text1.text)
                            userOneMessageText.text = chatserver.update()
                            userTwoMessageText.text = chatserver.update()
                        }
                        input1.clear()
                    }
                }
            }
        }

        ScrollView {
            id: view1
            anchors {
                top: input1.bottom
                bottom: parent.bottom
                left: input1.left
                right: input1.right
                margins: 4
            }
            clip: true

            TextEdit {
                id: userOneMessageText
                readOnly: true
                textFormat: Text.RichText // enables HTML formatting
                font.family: "Helvetica"
                font.pointSize: 18
                color: "blue"
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
            text: username2.text
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
            placeholderText: qsTr("Enter message...")
            font.pixelSize: 15
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
                anchors.fill: parent
                onPressedChanged: {
                    if(pressed) {
                        console.log("Sending: ", input2.text)
                        if(input2.text.length != 0) {
                            chatserver.sendMessage(input2.text, text2.text)
                            userOneMessageText.text = chatserver.update()
                            userTwoMessageText.text = chatserver.update()
                        }
                        input2.clear()
                    }
                }
            }
        }

        ScrollView {
            id: view2
            anchors {
                top: input2.bottom
                bottom: parent.bottom
                left: input2.left
                right: input2.right
                margins: 4
            }
            clip: true

            TextEdit {
                id: userTwoMessageText
                readOnly: true
                textFormat: Text.RichText // enables HTML formatting
                font.family: "Helvetica"
                font.pointSize: 18
                color: "blue"
            }
        }
    }
}
