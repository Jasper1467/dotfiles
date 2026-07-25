import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Services.SystemTray

import "." as Components
import ".." as Style

RowLayout {
    id: tray

    property var barWindow

    spacing: Style.Theme.spacing

    Repeater {
        model: SystemTray.items

        delegate: Components.TrayItem {
            trayItem: modelData
            barWindow: tray.barWindow
        }
    }
}
