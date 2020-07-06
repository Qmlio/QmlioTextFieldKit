/* Copyright (c) 2020 Qmlio
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
*/
import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

TextField {
    id: field

    property string errorText: "Error!"

    property bool hasHelper: false

    readonly property string currentControlState: field.state

    property alias errorIconText: errorIcon

    property string helperText: ""

    property color helperColor: "green"

    property color errorColor: "red"

    property bool isNumber: false

    property bool isEmail: true

    property bool isPassword: false

    property alias textfield: field

    property string value: field.text

    property color passiveColor: "#bdbdbd"

    property bool isError: false

    width: implicitWidth
    height: dp(56)
    clip: false
    echoMode: isPassword == true ? TextInput.Password : TextInput.Normal
    onValueChanged: {

        field.text = value
        if (field.text.length == 0) {

            field.state = ""
        } else {

            if (!isError)
                field.state = "active"
        }
    }
    onIsErrorChanged: {
        if (isError)
            state = "error"
        else
            state = "active"
    }

    onEnabledChanged: {

        if (!enabled) {
            helperColor = passiveColor
            state = "passive"
        } else {
            state = ""
        }
    }
    inputMethodHints: {
        if (isNumber == true) {
            return Qt.ImhDialableCharactersOnly
        } else if (isEmail == true) {
            return Qt.ImhEmailCharactersOnly | Qt.ImhLowercaseOnly
        } else {
            return Qt.ImhNoAutoUppercase | Qt.ImhPreferLowercase
                    | Qt.ImhSensitiveData | Qt.ImhNoPredictiveText
        }
    }
    font.family: "arial"
    placeholderText: "Label"
    onFocusChanged: {
        if (focus) {
            if (state == "passiveError")
                state = "error"
            else
                state = "active"
        } else {
            if (text.length > 0) {
                if (state == "error")
                    state = "passiveError"
                else
                    state = "passive"
            } else
                state = ""
        }
    }

    Material.accent: Material.Purple
    bottomPadding: dp(0)
    leftPadding: dp(14)
    rightPadding: dp(14)
    font.pixelSize: sp(18)

    Rectangle {
        id: iconContainer
        width: height
        height: dp(24)
        radius: width / 2
        scale: 0.85
        opacity: 0
        color: errorColor
        z: 2
        visible: false
        onOpacityChanged: {
            if (opacity > 0.1)
                visible = true
            else
                visible = false
        }

        x: parent.width - (width + field.rightPadding)
        y: parent.height / 2 - height / 2
        MouseArea {
            anchors.fill: parent
            onClicked: {
                field.clear()
                field.state = "active"
            }
        }
        Text {
            id: errorIcon

            anchors.centerIn: parent
            font.pixelSize: sp(18)
            color: "#fff"
        }
    }

    onPlaceholderTextChanged: {
        var g = placeholderText
        placeholderText = ""
        pl.text = g
    }
    background: Item {
        anchors.fill: parent
        clip: true

        Rectangle {
            width: parent.width
            height: parent.height + radius
            color: "#f5f5f5"
            radius: dp(6)
            z: -1

            Item {
                id: placeHolderRec
                width: pl.implicitWidth
                height: pl.implicitHeight
                x: field.leftPadding
                y: field.height / 2 - height / 2

                Text {

                    property real size: 1
                    scale: size
                    id: pl
                    x: 0
                    text: "Label"
                    color: passiveColor
                    font.family: field.font.family
                    font.letterSpacing: 0.45
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: field.font.pixelSize
                    padding: 0
                }
            }
            Rectangle {
                id: bottomBorder
                width: parent.width
                height: dp(2)

                color: pl.color
                y: parent.height - (height + parent.radius)
            }
        }
    }
    Item {
        id: errorRec
        width: parent.width
        height: field.hasHelper ? Math.max(dp(16),
                                           mErrorText.implicitHeight) : 0

        opacity: field.hasHelper ? 1 : 0
        visible: true
        y: parent.height

        Text {
            id: mErrorText
            color: field.hasHelper ? helperColor : errorColor
            text: field.hasHelper ? helperText : errorText
            width: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            anchors.verticalCenter: parent.verticalCenter
            leftPadding: field.leftPadding - dp(2)
            maximumLineCount: 2
            padding: dp(4)
            elide: Text.ElideRight
            font.pixelSize: sp(12)
        }
    }

    states: [
        State {
            name: "active"
            PropertyChanges {
                target: placeHolderRec
                y: dp(4)
            }

            PropertyChanges {
                target: field
                bottomPadding: -dp(4)
            }
            PropertyChanges {
                target: pl
                color: Material.accent

                padding: -dp(2)
                size: 0.7
                x: -(width / 6)
            }
        },

        State {
            name: "passive"
            PropertyChanges {
                target: placeHolderRec
                y: dp(4)
            }
            PropertyChanges {
                target: field
                bottomPadding: -dp(4)
            }

            PropertyChanges {
                target: pl

                color: passiveColor

                size: 0.7
                padding: -dp(2)
                x: -(width / 6)
            }
        },
        State {

            name: "error"

            PropertyChanges {
                target: placeHolderRec
                y: dp(4)
            }
            PropertyChanges {
                target: field
                bottomPadding: -dp(4)
            }
            PropertyChanges {
                target: pl
                color: errorColor
                padding: -dp(2)
                size: 0.7
                x: -(width / 6)
            }

            PropertyChanges {
                target: errorRec
                opacity: 1
                height: Math.max(dp(16), mErrorText.implicitHeight)
            }
            PropertyChanges {
                target: iconContainer
                opacity: 1
                color: errorColor
                scale: 1
            }
            PropertyChanges {
                target: errorIcon
                color: "black"
            }
            PropertyChanges {
                target: mErrorText
                color: errorColor
            }
        },
        State {

            name: "passiveError"

            PropertyChanges {
                target: pl
                color: passiveColor
            }
            PropertyChanges {
                target: pl
                color: passiveColor
                padding: -dp(2)
                size: 0.7
                x: -(width / 6)
            }

            PropertyChanges {
                target: errorRec
                opacity: 1
                height: Math.max(dp(16), mErrorText.implicitHeight)
            }
            PropertyChanges {
                target: placeHolderRec
                y: dp(4)
            }
            PropertyChanges {
                target: iconContainer
                opacity: 1
                color: passiveColor
                scale: 1
            }
            PropertyChanges {
                target: mErrorText
                color: passiveColor
            }
            PropertyChanges {
                target: errorIcon
                color: "black"
            }
        }
    ]
    onStateChanged: {

        if (state == "active") {
            smoother.easing.type = Easing.OutExpo
        } else {
            smoother.easing.type = Easing.InExpo
        }
    }
    transitions: [
        Transition {
            from: ""
            to: "active"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    id: smoother
                    properties: "y,x,size,scale,padding,opacity,color,bottomPadding,"
                    duration: 300
                    easing.type: Easing.OutExpo
                }
                ColorAnimation {
                    duration: 100
                }
            }
        },
        Transition {
            from: "active"
            to: "passive"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y,x,size,opacity,color,bottomPadding"
                    duration: 300
                    easing.type: Easing.OutExpo
                }
                ColorAnimation {
                    duration: 100
                }
            }
        },
        Transition {
            from: "active"
            to: "error"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    id: smoother2
                    duration: 250
                    easing.type: Easing.OutExpo
                    properties: "x,y,height,opacity,scale"
                }
                ColorAnimation {
                    id: cSmoother2
                    duration: 250
                    easing.type: Easing.OutExpo
                }
            }
        },
        Transition {
            from: "passive"
            to: "error"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    id: smoother3
                    duration: 250
                    easing.type: Easing.OutExpo
                    properties: "x,y,height,opacity,scale"
                }
                ColorAnimation {
                    id: cSmoother3
                    duration: 250
                    easing.type: Easing.OutExpo
                }
            }
        },
        Transition {
            from: "active"
            to: "passiveError"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    id: smoother4
                    duration: 250
                    easing.type: Easing.OutExpo
                    properties: "x,y,height,opacity,scale"
                }
                ColorAnimation {
                    id: cSmoother4
                    duration: 250
                    easing.type: Easing.OutExpo
                }
            }
        },
        Transition {
            from: "error"
            to: "passive"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    id: smoother5
                    duration: 250
                    easing.type: Easing.OutExpo
                    properties: "x,y,height,opacity,scale"
                }
                ColorAnimation {
                    id: cSmoother5
                    duration: 250
                    easing.type: Easing.OutExpo
                }
            }
        }
    ]
}
