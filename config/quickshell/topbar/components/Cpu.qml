import QtQuick

import ".." as Style

Text {
    property int usage: 0

    text: "CPU: " + usage + "%"

    color: Style.Theme.cpuColor

    font {
        family: Style.Theme.fontFamily
        pixelSize: Style.Theme.fontSize
        bold: true
    }
}
