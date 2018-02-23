//*****************************************************
//****This is the customized chat block class that can
//****be claled in main.qml. Allow it be more flexible
//*****************************************************

import QtQuick.Window 2.2
import QtQuick 2.8
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

import ChatServer 1.0

Rectangle {
    //  component property initialization
    property alias name : username.text
    property alias message: userOutput.text

    //  emits a signal when the chat block class destructor is being called
    //  prompt a message in console to make sure the object is deleted
    Component.onDestruction: console.log("the user " + username.text + " is being destroyed!")

    id: blockframe
    //  inherite window sizes from the main window to resize component proportionally
    width: parent.width
    height: parent.height * 0.49
    border.color: "#020202"
    opacity: 1

    //  this is the name of the user
    Text {
        id: username
        width: 62
        height: 39
        color: "steelblue"
        font.pixelSize: 24
        //  align the text to the center
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    //  this is the user input field and it resize according to its parent's window size
    TextField {
        id: messageInput
        x: parent.width * 0.1
        y: parent.height * 0.03
        width: parent.width * 0.6
        placeholderText: qsTr("Enter message...")
        font.pixelSize: 15
        focus: true
    }

    //  send button component, also inherite the size from its parent
    Button {
        id: myButton
        x: parent.width * 0.1 + messageInput.width + 10
        y: parent.height * 0.03
        width: parent.width * 0.15
        height: messageInput.height
        text: "Send"

        //  signal handler for button on clicking
        MouseArea {
            id: myMouseArea
            anchors.fill: parent
            onPressedChanged: {
                if(pressed || EnterKey.onClicked) {
                    console.log("Sending: ", messageInput.text)
                    if(messageInput.text.length != 0) {
                        //  update the message append the username if the message is sent successfully
                        chatserver.sendMessage(messageInput.text, username.text)
                        //  call the JS function to render all existing messages
                        updateAll()
                    }
                    messageInput.clear()
                }
            }
        }
    }

    //  this function append the updated message to the scrollview every time when the button is pressed.
    function updateAll() {
        var size = chatserver.getSize()

        //  using a for loop loop through all messages from all users.
        for(var i = 0; i < size; i++) {
            //  get the stored QOject at index i
            var object = chatserver.getRegister(i)
            object.message = chatserver.update()
        }
    }

    ScrollView {
        id: myscrollView
        anchors {
            top: messageInput.bottom
            bottom: parent.bottom
            left: messageInput.left
            right: messageInput.right
            margins: 4
        }
        clip: true

        TextEdit {
            id: userOutput
            readOnly: true
            textFormat: Text.RichText // enables HTML formatting
            font.family: "Helvetica"
            font.pointSize: 18
            color: "blue"
        }
    }
}
