import QtQuick
import QtQuick.Controls

import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import ".." as Style

Item {
    id: root

    property var trayItem
    property var barWindow

    implicitWidth: 20
    implicitHeight: 20


    IconImage {
        id: icon

        width: 18
        height: 18

        anchors.centerIn: parent

        source:
            root.trayItem
                ? root.trayItem.icon
                : ""

        smooth: true
    }


    MouseArea {
        id: mouse

        anchors.fill: parent

        hoverEnabled: true

        acceptedButtons:
            Qt.LeftButton |
            Qt.RightButton


        onClicked: function(event) {
            if (!root.trayItem)
                return

            if (event.button === Qt.LeftButton) {
                root.trayItem.activate()
            }

            if (event.button === Qt.RightButton && root.trayItem.hasMenu) {
                menuAnchor.open()
            }
        }
    }


    QsMenuAnchor {
        id: menuAnchor

        anchor.item: icon

        menu: root.trayItem ? root.trayItem.menu : null
    }
}
