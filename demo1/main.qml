import QtQuick 2.9
import QtQuick.Window 2.2

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

        TextInput {
            id: textInput1
            x: 8
            y: 8
            width: 424
            height: 37
            text: qsTr("Text Input")
            clip: false
            opacity: 1
            font.pixelSize: 12
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

        TextInput {
            id: textInput2
            x: 8
            y: 8
            width: 424
            height: 37
            text: qsTr("Text Input")
            font.pixelSize: 12
        }
    }
}
