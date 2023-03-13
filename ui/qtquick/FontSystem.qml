// Copyright (C) 2023 The Genyleap.
// Copyright (C) 2023 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick

Item {

    property var getAwesomeRegular: fontAwesomeRegular
    property var getAwesomeSolid: fontAwesomeSolid
    property var getContentFont: contentFontRegular
    property var getContentFontLight: contentFontLight
    property var getContentFontBold: contentFontBold

    readonly property int       h1 : 32
    readonly property int       h2 : 24
    readonly property double    h3 : 18.72
    readonly property int       h4 : 16
    readonly property double    h5 : 13.28
    readonly property double    h6 : 10.72

    readonly property int content : 14

    FontLoader {
        id: fontAwesomeRegular
        source: "qrc:/ui/resources/Font Awesome 5 Free-Regular-400.otf"
    }

    FontLoader {
        id: fontAwesomeSolid
        source: "qrc:/ui/resources/Font Awesome 5 Free-Solid-900.otf"
    }

    FontLoader {
        id: contentFontLight
        source: "qrc:/ui/resources/Vazirmatn-Light.ttf"
    }

    FontLoader {
        id: contentFontBold
        source: "qrc:/ui/resources/Vazirmatn-Bold.ttf"
    }

    FontLoader {
        id: contentFontRegular
        source: "qrc:/ui/resources/Vazirmatn-Regular.ttf"
    }

}
