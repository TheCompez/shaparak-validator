// Copyright (C) 2023 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Window
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import Utils 1.0 // Import utils!

ApplicationWindow {
    id: appRoot
    width: 1080
    height: 1080
    visible: true
    title: qsTr("Shaparak Validator")
    color: "#ffffff"

    QtObject {
        id: appObject
        property string getwayString :"";
        property string longLink :"";
        property string finalLink :"";
        property string linkTitle :"";
        property bool isSecured :false
        property bool isGetwayValid: false

    }

    FontSystem { id: fontSystem; }

    Utils { id: utils; }

    contentData: MainContainer {}

    Rectangle {
        id: finalRect
        anchors.centerIn: parent
        color: "#3c359c"
        width: 500
        height: 500
        radius: width
        visible: false
        Text {
            anchors.centerIn: parent
            font.family: fontSystem.getContentFont.name
            font.pixelSize: 32
            font.bold: false
            color: "#fff"
            text: qsTr("Copied!")
        }
        NumberAnimation {
            id: finalAnim
            target: finalRect
            property: "scale"
            from: 3.0
            to: 0.0
            duration: 100
            easing.type: Easing.InExpo
        }
    }

}
