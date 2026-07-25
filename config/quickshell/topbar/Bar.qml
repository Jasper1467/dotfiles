import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

import "." as Style
import "components" as Components

PanelWindow {
    id: root

    required property var targetScreen
    screen: targetScreen

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: Style.Theme.barHeight
    color: Style.Theme.barBg


    // Left + Right modules
    RowLayout {
        anchors.fill: parent
        anchors.margins: Style.Theme.margin

        // Left (Waybar modules-left)
        RowLayout {
            spacing: Style.Theme.spacing

            Components.Workspaces {}
        }


        Item {
            Layout.fillWidth: true
        }


        // Right (Waybar modules-right)
        RowLayout {
            spacing: Style.Theme.spacing

            Components.Cpu {
                usage: root.cpuUsage
            }

            Components.Separator {}

            Components.Memory {
                usage: root.memUsage
            }

            Components.Separator {}

            Components.Tray {}
        }
    }


    // Center (Waybar modules-center)
    Rectangle {
        anchors.centerIn: parent

        color: "transparent"

        implicitWidth: clock.width
        implicitHeight: clock.height

        Components.Clock {
            id: clock
        }
    }
}
