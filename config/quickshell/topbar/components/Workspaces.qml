import Quickshell.Hyprland
import QtQuick

import ".." as Style

Row {
    spacing: 8

    Repeater {
        model: 9

        Text {
            property var ws:
                Hyprland.workspaces.values.find(
                    w => w.id === index + 1
                )

            property bool isActive:
                Hyprland.focusedWorkspace?.id === index + 1

            text: index + 1

            color:
                isActive
                ? Style.Theme.workspaceActive
                : ws
                    ? Style.Theme.workspaceOccupied
                    : Style.Theme.workspaceInactive

            font {
                family: Style.Theme.fontFamily
                pixelSize: Style.Theme.fontSize
                bold: true
            }

            MouseArea {
                anchors.fill: parent

                onClicked:
                    Hyprland.dispatch(
                        "workspace " + (index + 1)
                    )
            }
        }
    }
}
