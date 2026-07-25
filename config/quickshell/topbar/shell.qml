//@ pragma UseQApplication

import Quickshell
import QtQuick

import "." as Topbar

ShellRoot {
    Variants {
        model: Quickshell.screens

        delegate: Component {
            Topbar.Bar {
                required property var modelData

                targetScreen: modelData
            }
        }
    }
}
