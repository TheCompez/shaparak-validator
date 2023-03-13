import QtQuick
import QtQuick.Window
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Pane {
    anchors.fill: parent
    background: appRoot.background

    function dataRequest(type)
    {
        utils.url = linkUrl.text;

        appObject.getwayString = utils.getway;
        appObject.isSecured = utils.isSecured;
        appObject.isGetwayValid = utils.getwayValid

        busyIndicator.running = false;
        mainItem.implicitHeight = 172
        finalResultRow.visible = true
    }

    ColumnLayout {
        width: parent.width
        Layout.fillWidth: true
        anchors.centerIn: parent

        spacing: 16

        Text {
            font.family: fontSystem.getContentFontBold.name
            font.pixelSize: fontSystem.h1
            font.bold: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("اعتبارسنجی درگاه پرداخت")
            color: "#2b2d42"
        }

        Text {
            font.family: fontSystem.getContentFont.name
            font.pixelSize: fontSystem.h5
            font.bold: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("ارزیابی اصالت و اعتبار درگاه‌های بانکی ایران")
            color: "#85878d"
        }

        Item {
            id: mainItem
            width: 640
            implicitHeight: 120
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Behavior on implicitHeight {
                NumberAnimation { duration: 200; }
            }

            RectangularGlow {
                id: effect
                anchors.fill: mainBorder
                glowRadius: 32
                spread: 0.1
                color: "#f2f1fb"
                cornerRadius: mainBorder.radius + glowRadius
            }

            Rectangle {
                id: mainBorder
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                anchors.fill: parent
                color: "#ffffff"
                border.width: 1
                border.color: "#f6f5fc"
                radius: 15
            }

            ColumnLayout {
                width: parent.width
                Layout.fillWidth: true
                Item { height: 20; }

                Rectangle {
                    width: parent.width / 1.2
                    height: 64
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    color: "#f6f5fc"
                    radius: 10
                    ColumnLayout {
                        anchors.fill: parent
                        Item { width: 10; }
                        RowLayout {
                            width: parent.width
                            Layout.fillWidth: true
                            layoutDirection: Qt.RightToLeft
                            Item { width: 15; }

                            Text {
                                font.family: fontSystem.getAwesomeSolid.name
                                font.styleName: "Solid"
                                text: "\uf0c1"
                                color: "#b0b0b0"
                            }

                            TextField {
                                id: linkUrl
                                font.family: fontSystem.getContentFont.name
                                font.pixelSize: fontSystem.h5
                                width: parent.width
                                Layout.fillWidth: true
                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                                height: 32
                                placeholderText: "آدرس مستقیم درگاه بانکی را وارد کنید..."
                                placeholderTextColor: "#c6c6cb"
                                background: Rectangle {
                                    height: parent.height
                                    border.width: 0
                                    radius: 0
                                    color: "#f6f5fc"
                                    Behavior on border.color {
                                        ColorAnimation {
                                            duration: 200
                                        }
                                    }
                                }
                            }

                            BusyIndicator {
                                id: busyIndicator
                                width: 48
                                height: 48
                                running: false
                                contentItem: Item {
                                    implicitWidth: 16
                                    implicitHeight: 16

                                    Item {
                                        id: itemProgress
                                        x: parent.width / 2 - 16
                                        y: parent.height / 2 - 16
                                        width: 32
                                        height: 32
                                        opacity: busyIndicator.running ? 1 : 0

                                        Behavior on opacity {
                                            OpacityAnimator {
                                                duration: 250
                                            }
                                        }

                                        RotationAnimator {
                                            target: itemProgress
                                            running: busyIndicator.visible && busyIndicator.running
                                            from: 0
                                            to: 360
                                            loops: Animation.Infinite
                                            duration: 1250
                                        }

                                        Repeater {
                                            id: repeater
                                            model: 3

                                            Rectangle {
                                                x: itemProgress.width / 2 - width / 2
                                                y: itemProgress.height / 2 - height / 2
                                                implicitWidth: 5
                                                implicitHeight: 5
                                                radius: 2.5
                                                color: "#2b2d42"
                                                transform: [
                                                    Translate {
                                                        y: -Math.min(itemProgress.width, itemProgress.height) * 0.5 + 7
                                                    },
                                                    Rotation {
                                                        angle: index / repeater.count * 360
                                                        origin.x: 2.5
                                                        origin.y: 2.5
                                                    }
                                                ]
                                            }
                                        }
                                    }
                                }
                            }

                            Button {
                                id: shortButton
                                implicitWidth: 72
                                implicitHeight: 38
                                font.family: fontSystem.getContentFont.name
                                font.pixelSize: fontSystem.h5
                                text: "بررسی"

                                layer.enabled: true
                                layer.effect: DropShadow {
                                    transparentBorder: true
                                    horizontalOffset: 0
                                    verticalOffset: 3
                                    color: "#c8c5f1"
                                    radius: 16
                                    samples: 32
                                    spread: 0.0

                                }

                                background: Rectangle {
                                    id: shortButtonBack
                                    anchors.fill: parent
                                    color: "#2b2d42"
                                    radius: 4
                                    z: 2
                                }
                                contentItem: Text {
                                    text: shortButton.text
                                    font.bold: false
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    opacity: enabled ? 1.0 : 0.3
                                    color: "#fff"
                                    anchors.fill: parent
                                    elide: Text.ElideRight
                                    scale: shortButton.down ? 0.9 : 1.0
                                    z: 3
                                    Behavior on scale {
                                        NumberAnimation {duration: 70;}
                                    }
                                }

                                onClicked: {
                                    if(linkUrl.text !== "") {
                                        busyIndicator.running = true;
                                        dataRequest();
                                    }
                                }

                            }

                            Item { width: 5; }
                        }
                        Item { width: 10; }
                    }

                }

                Item { height: 20; }

                RowLayout {
                    id: finalResultRow
                    width: parent.width
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    visible: false
                    Text {
                        font.family: fontSystem.getContentFont.name
                        font.pixelSize: 14
                        font.bold: false
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        text: {
                            if(appObject.isGetwayValid)
                            {
                                if(appObject.isSecured)
                                {
                                    "درگاه مورد نظر امن و متعلق <strong>«" + appObject.getwayString + "»</strong> می‌باشد."
                                } else {
                                    "درگاه مورد نظر متعلق <strong>«" + appObject.getwayString + "»</strong> و فاقد گواهی امنیتی می‌باشد."
                                }
                            } else {
                                "درگاه مورد نظر معتبر نیست!"
                            }

                        }
                        color: "#85878d"
                    }
                    Text {
                        font.family: fontSystem.getAwesomeSolid.name
                        font.styleName: "Solid"
                        text: appObject.isGetwayValid && appObject.isSecured ? "\uf3ed" : "\uf05e"
                        font.pixelSize: 16
                        color: {
                            if(appObject.isGetwayValid){
                                appObject.isSecured ? "green" : "red"
                            } else {
                                "red"
                            }
                        }
                        scale: copyArea.containsPress ? 0.7 : 1.0
                        Behavior on scale {
                            NumberAnimation { duration: 200;}
                        }

                        MouseArea {
                            id: copyArea
                            anchors.fill: parent
                            onClicked: {
                                finalRect.visible = true
                                finalAnim.start()
                            }
                        }
                    }
                }
            }
            Item {}
        }
        Text {
            font.family: fontSystem.getContentFont.name
            font.pixelSize: fontSystem.h6
            font.bold: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("نتیجهٔ بررسی بر اساس مراجع رسمی شاپرک اعلام می‌شود.")
            color: "#85878d"
        }
        Text {
            font.family: fontSystem.getContentFont.name
            font.pixelSize: 10
            font.bold: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            onLinkActivated: Qt.openUrlExternally(link)
            text: '<html><style type="text/css"></style>ساخته شده توسط <strong><a href="https://github.com/KambizAsadzadeh">کامبیز اسدزاده</a></strong>، بر پایهٔ سی‌پلاس‌پلاس و فناوری کیوت کوئیک.</html>'
            color: "#85878d"
        }
        Text {
            font.family: fontSystem.getContentFont.name
            font.pixelSize: 10
            font.bold: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            onLinkActivated: Qt.openUrlExternally(link)
            text: 'نسخهٔ ۱.۰'
            color: "#85878d"
        }
    }
}
