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
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 640
    height: 580
    title: qsTr("Qmlio Controls")
    TabBar {
        id: tabs
        z: 1
        width: parent.width
        currentIndex: swipe.currentIndex
        Repeater {
            model: ListModel {
                Component.onCompleted: {
                    append({
                               name: "OutlineInput"
                           })
                    append({
                               name: "LineInput"
                           })
                }
            }
            delegate: TabButton {
                text: model.name
            }
        }
    }
    SwipeView {
        id: swipe
        anchors.fill: parent
        currentIndex: tabs.currentIndex
        OutlineInputPage {
        }

        LineInputPage {
        }
    }

    function dp(val) {
        if (Qt.platform.os == "android") {


            /* FIX ME */
        }

        return val
    }

    function sp(val) {
        if (Qt.platform.os == "android") {


            /* FIX ME */
        }
        return val
    }
}
