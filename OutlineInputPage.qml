
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
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

Page {

    Rectangle {
        width: col.width
        height: col.height
        anchors.centerIn: parent
        Column {
            id: col
            spacing: 48

            // default
            OutLineInput {
                id: outLineInput1
                width: 250
                placeholderText: "Name"
                Material.accent: "blue"
            }

            // set value as Manager
            OutLineInput {
                id: outLineInput2
                width: 250
                placeholderText: "Post"
                Material.accent: "blue"
                hasHelper: true
                helperColor: "gray"
                value: "Manager"
                helperText: "Change your post"
            }

            // testing error state
            OutLineInput {
                id: outLineInput3
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

            // disabled
            OutLineInput {
                id: wa
                width: 250
                placeholderText: "Disabled"
                enabled: false
                value: "This is disabled"
                Material.accent: "blue"
            }
        }
    }
}
