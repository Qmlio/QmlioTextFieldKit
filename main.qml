import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        width: col.width
        height: col.height
        anchors.centerIn: parent
        Column {
            id: col
            spacing: 48

            LineInput {
                id: lineInput
                width: 250
                placeholderText: "Name"
                Material.accent: "blue"
                hasHelper: true
                helperColor: "gray"
                helperText: "Enter name"
            }
            LineInput {
                id: lineInputa
                width: 250
                placeholderText: "Disabled"
                Material.accent: "blue"
                hasHelper: true
                enabled: false
                value: "Qt Developer"
                helperColor: "gray"
                helperText: "Post"
            }

            OutLineInput {
                id: outLineInput
                width: 250
                visible: false
                placeholderText: "Post"
                Material.accent: "blue"
                hasHelper: true
                helperColor: "gray"
                value: "Manager"
                helperText: "Change your post"
            }

            LineInput {
                opacity: 0
                visible: false
                id: outLisneInput
                width: 250
                placeholderText: "Name"
                Material.accent: "blue"
                hasHelper: true
                helperColor: "gray"
                helperText: "Enter name"

                onTextEdited: {
                    if (text == "invalid") {
                        isError = true
                    } else {

                        isError = false
                    }
                }
            }
            OutLineInput {
                id: oustLineInput
                width: 250
                opacity: 1

                placeholderText: "Name"
                Material.accent: "blue"
                hasHelper: true
                helperColor: "gray"
                helperText: "Enter name"
                onTextEdited: {
                    if (text == "invalid") {
                        isError = true
                    } else {

                        //state = "active"
                        isError = false
                    }
                }
            }

            OutLineInput {
                id: wa
                width: 250
                opacity: 0
                placeholderText: "Disabled"
                enabled: false
                value: "Qt Developer"
                Material.accent: "blue"
                hasHelper: true
                helperText: "Post"
            }
        }
    }
    function dp(val) {
        return val
    }
    function sp(val) {
        return val
    }
}
