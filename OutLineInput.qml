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
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2


/*!
   \qmltype OutLineInput
   \brief A customized TextField control

   OutLineInput extends standard \l {http://doc.qt.io/qt-5/}
   {TextField} by adding the new Material design look. Its mainly driven by changing of states  to achieve an desired look and design.

\div {class="flow-row"}

  \div {class=" row-child screen-shot-Example"}
\image outlinegiff.gif
 \enddiv

\enddiv



\section1 Example Usage
   \qml
import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Qmlio Controls")

            OutLineInput {
                id: outLineInput
                width: 250
                placeholderText: "Name"
                Material.accent: "blue"
                hasHelper: true
                helperColor: "gray"
                helperText: "Enter your full names"

            }
        }

   \endqml

 \section1 Control States
   OutLineInput contains mainly five states.


    \div {class="more-list-container"}

   \list

     \li \div {class="list-section"}

     \section2 Empty state
     Thi is the default state of the control.

\div {class="flow-row"}
  \div {class=" row-child image-Example"}
\image default.png
 \enddiv
\enddiv

 \enddiv


     \li \div {class="list-section"}

     \section2 Active state
     This state is triggered when the control is clicked / tapped (on Mobile) ie when focus is true and when the \l {http://doc.qt.io/qt-5/}
   {TextField::enabled} property is set to true.
\div {class="flow-row"}
  \div {class=" row-child image-Example"}
\image active.png
 \enddiv
\enddiv

 \enddiv


     \li \div {class="list-section"}

     \section2 Passive
     This state is triggered when the control  focus is false  and when \l {http://doc.qt.io/qt-5/}
   {TextField::enabled} property  is set to false.

\div {class="flow-row"}

  \div {class=" row-child image-Example"}
\image passive.png
 \enddiv
\enddiv

 \enddiv

     \li \div {class="list-section"}

     \section2 Error state
     This state is triggered when the control input is invalid.This is set manually by setting OutLineInput::isError property to true.

\div {class="flow-row"}
  \div {class=" row-child image-Example"}
\image error.png
 \enddiv
\enddiv

   \qml
            OutLineInput {
                id: outLineInput
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
            \endqml

 \enddiv


     \li \div {class="list-section"}

     \section2 PassiveError state
     This state is a combination of \b Error \b State and \b Passive \b state and is triggered when the input is invalid and focus is false .

\div {class="flow-row"}
  \div {class=" row-child image-Example"}
\image passiveError.png
 \enddiv
\enddiv

 \enddiv



\endlist
 \enddiv




  \div {class="divider"}

 \enddiv


*/
TextField {
    id: field
    /*!

    This property holds the color of the control in the passive state.
    */
    property color passiveColor: "#bdbdbd"
    /*!

    This property holds the color of the helperText of the control in the error state.
    */
    property color errorColor: "red"
    /*!
    This property holds the text to be displayed as an error .
    */
    property string errorText: "Error!"

    /*!
    This property holds whether the input is an invalid and will trigger the error state automatically.
    */
    property bool isError: false

    /*!
    This property holds the text to be displayed as helper text for the control.

  \div {class="image-Example"}
\image outlinewithHelp.png
 \enddiv

   \qml
            OutLineInput {
                id: outLineInput
                width: 250
                placeholderText: "Name"
                Material.accent: "blue"
                helperColor: "green"
                hasHelper: true
                helperText: "Enter your full names"

            }

   \endqml

    */
    property string helperText: ""

    /*!
    This property holds whether the input is contains only numeric values .
    */
    property bool isNumber: false

    /*!
    This property holds the color of the helperText of the control in the active state. In the passive state, the helper text will take up the OutLineInput::passiveColor.
    The default color is green
    */
    property color helperColor: "green"

    /*!
    This property holds the internal \l {http://doc.qt.io/qt-5/}
   {Text Item} for  displaying  an error icon of the control.
    */
    property alias errorIconText: errorIcon

    /*!
    This property holds whether the control has helper text. The default value is false.
    */
    property bool hasHelper: false
    /*!
    This property holds the current state of the control.
    */
    readonly property string currentControlState: field.state

    /*!
    This property holds whether the input is an email .
    */
    property bool isEmail: true

    /*!
    This property holds whether the input is a password.
    */
    property bool isPassword: false

    /*!
    This property holds the  initial text to be displayed of the control.


  \div {class="image-Example"}
\image outlinewithValue.png
 \enddiv


\qml
            OutLineInput {
                id: outLineInput
                width: 250
                placeholderText: "Post"
                Material.accent: "blue"
                hasHelper: true
                helperColor: "gray"
                value: "Manager"
                helperText: "Change your post"

            }

   \endqml
    */
    property string value: field.text

    /*!
    This property holds internal \l {http://doc.qt.io/qt-5/}
   {TextField} of the control .
    */
    property alias textfield: field

    width: dp(150)
    height: dp(56)
    echoMode: isPassword == true ? TextInput.Password : TextInput.Normal
    onTextEdited: {

        if (text.length > 0 && !isError)

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
    onValueChanged: {
        field.text = value
        if (value.length == 0) {

            field.state = ""
        } else {

            if (!isError)
                field.state = "active"
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

    onIsErrorChanged: {
        if (isError)
            state = "error"
        else
            state = "active"
    }

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

    font.family: "arial"
    font.pixelSize: sp(18)
    placeholderText: ""
    onPlaceholderTextChanged: {

        var t = placeholderText
        placeholderText = ""
        placeholdertext.text = t
    }
    Rectangle {
        id: placeholderRec
        width: placeholdertext.implicitWidth
        height: placeholdertext.implicitHeight
        y: parent.height / 2 - height / 2
        x: parent.rightPadding
        color: "transparent"
        Rectangle {
            id: placeholderRecChild
            width: parent.width
            height: parent.height

            Text {
                id: placeholdertext
                maximumLineCount: 1
                font.letterSpacing: 0.15
                text: "Label"
                color: passiveColor
                font.pixelSize: field.font.pixelSize
                padding: dp(4)
            }
        }
    }
    background: Rectangle {
        id: bg
        width: parent.width
        height: dp(56)
        border.width: dp(2)
        border.color: passiveColor
        radius: dp(4)
        Rectangle {
            id: errorRec
            width: parent.width
            height: field.hasHelper ? Math.max(dp(16),
                                               mErrorText.implicitHeight) : 0
            opacity: field.hasHelper ? 1 : 0
            y: parent.height
            Text {
                id: mErrorText
                color: field.hasHelper ? helperColor : errorColor
                text: field.hasHelper ? helperText : errorText
                width: parent.width
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                anchors.verticalCenter: parent.verticalCenter
                leftPadding: field.leftPadding
                maximumLineCount: 2
                padding: dp(4)
                elide: Text.ElideRight
                font.pixelSize: sp(12)
            }
        }
    }
    leftPadding: dp(14)
    rightPadding: dp(14)
    topPadding: dp(16)
    bottomPadding: dp(16)

    Rectangle {
        id: iconContainer
        width: height
        height: dp(24)
        radius: width / 2
        scale: 0.85
        opacity: 0
        visible: false
        onOpacityChanged: {
            if (opacity > 0.1)
                visible = true
            else
                visible = false
        }
        x: parent.width - (width + parent.rightPadding)
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
        }
    }
    onStateChanged: {

        if (state == "active") {
            smoother.easing.type = Easing.OutExpo
            cSmoother.easing.type = Easing.OutExpo
        } else if (state == "passive") {
            smoother1.easing.type = Easing.OutExpo
            cSmoother1.easing.type = Easing.OutExpo
        } else if (state == "error") {
            smoother2.easing.type = Easing.OutExpo
            cSmoother2.easing.type = Easing.OutExpo
            smoother3.easing.type = Easing.OutExpo
            cSmoother3.easing.type = Easing.OutExpo
        } else {
            smoother.easing.type = Easing.InExpo
            cSmoother.easing.type = Easing.InExpo
            smoother1.easing.type = Easing.InExpo
            cSmoother1.easing.type = Easing.InExpo
            smoother2.easing.type = Easing.InExpo
            cSmoother2.easing.type = Easing.InExpo
            smoother3.easing.type = Easing.InExpo
            cSmoother3.easing.type = Easing.InExpo
        }
    }
    states: [

        State {

            name: "active"
            PropertyChanges {
                target: bg
                border.color: Material.accent
            }
            PropertyChanges {
                target: placeholdertext
                color: Material.accent
                font.letterSpacing: sp(1)
            }
            PropertyChanges {
                target: placeholderRec
                y: -height / 2
            }
            PropertyChanges {
                target: placeholderRecChild
                x: -(width / 6)
                y: placeholderRec / 2 - placeholderRecChild / 2
                color: "#fff"

                scale: 0.75
            }
        },
        State {

            name: "passive"
            PropertyChanges {
                target: bg
                border.color: passiveColor
            }
            PropertyChanges {
                target: placeholdertext
                color: passiveColor
                font.letterSpacing: sp(1)
            }

            PropertyChanges {
                target: placeholderRec

                y: -height / 2
            }
            PropertyChanges {
                target: placeholderRecChild
                x: -(width / 6)
                y: placeholderRec / 2 - placeholderRecChild / 2
                color: "#fff"

                scale: 0.75
            }
        },
        State {

            name: "error"
            PropertyChanges {
                target: mErrorText
                color: errorColor
            }
            PropertyChanges {
                target: bg
                border.color: errorColor
            }
            PropertyChanges {
                target: placeholdertext
                color: errorColor
                font.letterSpacing: sp(1)
            }

            PropertyChanges {
                target: placeholderRec

                y: -height / 2
            }
            PropertyChanges {
                target: placeholderRecChild
                x: -(width / 6)
                y: placeholderRec / 2 - placeholderRecChild / 2
                color: "#fff"

                scale: 0.75
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
                color: "#fff"
            }
        },
        State {

            name: "passiveError"
            PropertyChanges {
                target: bg
                border.color: passiveColor
            }
            PropertyChanges {
                target: placeholdertext
                color: passiveColor
                font.letterSpacing: sp(1)
            }
            PropertyChanges {
                target: placeholderRec

                y: -height / 2
            }
            PropertyChanges {
                target: placeholderRecChild
                x: -(width / 6)
                y: placeholderRec / 2 - placeholderRecChild / 2
                color: "#fff"

                scale: 0.75
            }
            PropertyChanges {
                target: errorRec
                opacity: 1
                height: Math.max(dp(16), mErrorText.implicitHeight)
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
                color: "#fff"
            }
        }
    ]
    transitions: [
        Transition {
            from: ""
            to: "active"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    id: smoother
                    duration: 250
                    easing.type: Easing.OutExpo
                    properties: "x,y,scale,font.letterSpacing"
                }
                ColorAnimation {
                    id: cSmoother
                    duration: 250
                    easing.type: Easing.OutExpo
                }
            }
        },
        Transition {
            from: "active"
            to: "passive"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    id: smoother1
                    duration: 250
                    easing.type: Easing.OutExpo
                    properties: "x,y,scale,font.letterSpacing"
                }
                ColorAnimation {
                    id: cSmoother1
                    duration: 250
                    easing.type: Easing.OutExpo
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
                    properties: "x,y,height,opacity,scale,font.letterSpacing"
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
                    properties: "x,y,height,opacity,scale,font.letterSpacing"
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
                    properties: "x,y,height,opacity,scale,font.letterSpacing"
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
                    properties: "x,y,height,opacity,scale,font.letterSpacing"
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
