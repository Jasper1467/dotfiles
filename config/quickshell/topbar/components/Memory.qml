import QtQuick

import ".." as Style

Text {
    property int usage: 0

    text: "Mem: " + usage + "%"

    color: Style.Theme.memoryColor

    font {
        family: Style.Theme.fontFamily
        pixelSize: Style.Theme.fontSize
        bold: true
    }
}
