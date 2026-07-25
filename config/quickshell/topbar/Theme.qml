pragma Singleton

import QtQuick

QtObject {
    id: theme

    // Tokyo Night Purple palette
    readonly property color bg: "#1a1b26"
    readonly property color bgAlt: "#16161e"
    readonly property color fg: "#c0caf5"

    readonly property color muted: "#565f89"

    // Accents
    readonly property color purple: "#bb9af7"
    readonly property color violet: "#9d7cd8"
    readonly property color blue: "#7aa2f7"
    readonly property color cyan: "#7dcfff"
    readonly property color pink: "#ff75a0"

    readonly property color yellow: "#e0af68"
    readonly property color orange: "#ff9e64"
    readonly property color red: "#f7768e"
    readonly property color green: "#9ece6a"

    // Bar colors
    readonly property color barBg: "#1f2335"
    readonly property color borderColor: "#3b4261"

    // Typography
    readonly property string fontFamily: "JetBrainsMono Nerd Font"
    readonly property int fontSize: 14
    readonly property int fontSmall: 12
    readonly property int fontLarge: 16

    // Layout
    readonly property int barHeight: 30
    readonly property int radius: 6
    readonly property int spacing: 8
    readonly property int margin: 8

    // Borders
    readonly property int borderWidth: 1

    // Workspace colors
    readonly property color workspaceActive: pink
    readonly property color workspaceOccupied: violet
    readonly property color workspaceInactive: muted

    // Module colors
    readonly property color cpuColor: pink
    readonly property color memoryColor: cyan
    readonly property color clockColor: purple
}
