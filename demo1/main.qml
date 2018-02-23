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
    //  this handler indicates whether the mainwindow is closed or not
    onClosing: {
        //  this is the second approach, thus i comment it out for now
        //  this calls the chat block destructor function once the window is closed
//        quitChat()
    }

    //  Prompt a dialog window for user name registration
    Component.onCompleted: mydialog.open()

    //  dialog window setup
    Dialog {
        id: mydialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        parent: ApplicationWindow.overlay
        width: parent.width / 1.8
        height: parent.height / 2.5
        modal: true
        focus: true
        title: qsTr("Username Registration")
        closePolicy: mydialog.CloseOnEscape | mydialog.CloseOnPressOutsideParent

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
                topMargin: 30
                horizontalCenter: parent.horizontalCenter
            }

            text: qsTr("Enter chat room")
            onClicked: checkUser()  //  call the JS function for user name validation
        }
    }

    //  initialize ChatServer component
    ChatServer {
        id: chatserver
    }

//    ScrollView {
//        id: myscroll
//        anchors.fill: parent
//        clip: false

//        //  the model class for handling the data
////        ListModel {
////            id: chatModel

////            ListElement {
////                username: ''
////            }
////        }

//        ListView {
//            delegate: Component {
//                Loader {
//                    sourceComponent: {

//                        return Qt.createQmlObject('import QtQuick 2.0; Rectangle {color: "red"; width: 20; height: 20}',
//                                                  parentItem,
//                                                  "dynamicSnippet1");
//                    }
//                }
//            }
//        }
//    }

    //  customized function for handling username empty check and make usernames are not duplicated
    function checkUser() {
        if(username1.text.length == 0) {
            warning1.text = "Username empty"
            console.log("Username2 is empty")
        } else {
            warning1.text = ""
            console.log("username1 : " + username1.text)
        }

        if(username2.text.length == 0) {
            warning2.text = "Username empty"
            console.log("Username2 is empty")
        } else {
            warning2.text = ""
            console.log("username2 : " + username2.text)
        }

        if((username1.text == username2.text) && (username1.text.length != 0)) {
            warning1.text = "Name duplicated"
            warning2.text = "Name duplicated"
            console.log("please enter a different name")
        }

        if((username1.text != username2.text) && (username1.text.length != 0) && (username2.text.length != 0)){
            mydialog.close()   //  close the dialog if the username satifies the above conditions
            console.log("users register successful")

            //  if the dialog exits successfully then call the chatblockcreator class to initailize two basic chat blocks
            chatBlockCreator(username1.text, 0, 0);
            console.log("chat block 1 created successful")
            //  this creates the second chat block
            chatBlockCreator(username2.text, 0, mainWindow.height * 0.5);
            console.log("chat block 2 created successful")
        }
    }

    //  this is the chat block initialization function, it takes a username and the position x and y
    function chatBlockCreator(username, x, y) {
        var component = Qt.createComponent("chatBlock.qml")
        if(component.status == Component.Ready) {
            var chatBlock = component.createObject(mainWindow, {"x": x, "y": y})

            chatBlock.name = username
            chatserver.setRegister(chatBlock)
        } else
            console.error(component.errorString())
    }

    //  NOTE: this is my second approach, which it calles the built-in destroy function from individual component and it acts as a destructor.
    //        However, i am using the destructor from chatserver class to handle all component destructions.

    //  customized chat block destructor
    function quitChat() {
        console.log("the main window is closed")

        var size = chatserver.getSize()

        //  using a for loop loop through all messages from all users.
        for(var i = 0; i < size; i++) {
            //  get the stored QOject at index i
            var object = chatserver.getRegister(i)
            //  destroy the corresponding chat block
            object.destroy()
        }
    }
}
