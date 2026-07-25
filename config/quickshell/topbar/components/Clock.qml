import QtQuick
import QtQuick.Controls

import ".." as Style

Row {
    spacing: 6

    Text {
        text: "󰥔"
        color: Style.Theme.clockColor

        font {
            family: Style.Theme.fontFamily
            pixelSize: Style.Theme.fontSize
        }
    }

    Text {
        id: clock

        property date now: new Date()

        text: Qt.formatDateTime(now, "ddd, MMM dd - HH:mm")

        color: Style.Theme.clockColor

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: clock.now = new Date()
        }

        font {
            family: Style.Theme.fontFamily
            pixelSize: Style.Theme.fontSize
            bold: true
        }
    }
}
