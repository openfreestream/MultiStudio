pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

Rectangle {
    id: sidebar

    color: "#111827"

    property string currentPage: "dashboard"

    signal pageSelected(string page)

    readonly property var navigationItems: [
        {
            id: "dashboard",
            label: qsTr("Dashboard"),
            icon: "layout-dashboard"
        },
        {
            id: "studio",
            label: qsTr("Studio"),
            icon: "monitor-play"
        },
        {
            id: "destinations",
            label: qsTr("Destinations"),
            icon: "radio"
        },
        {
            id: "audio-mixer",
            label: qsTr("Audio Mixer"),
            icon: "sliders-vertical"
        },
        {
            id: "soundboard",
            label: qsTr("Soundboard"),
            icon: "audio-waveform"
        },
        {
            id: "plugins",
            label: qsTr("Plugins"),
            icon: "puzzle"
        },
        {
            id: "analytics",
            label: qsTr("Analytics"),
            icon: "chart-no-axes-combined"
        }
    ]

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 8

        // Application branding
        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 64
            spacing: 12

            Rectangle {
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40
                radius: 12
                color: "#7C3AED"

                Text {
                    anchors.centerIn: parent
                    text: "M"
                    color: "#FFFFFF"
                    font.pixelSize: 22
                    font.bold: true
                }
            }

            ColumnLayout {
                spacing: 2

                Text {
                    text: qsTr("MultiStudio")
                    color: "#F9FAFB"
                    font.pixelSize: 19
                    font.bold: true
                }

                Text {
                    text: qsTr("CREATOR WORKSPACE")
                    color: "#94A3B8"
                    font.pixelSize: 9
                    font.letterSpacing: 1
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: "#293244"
        }

        Text {
            text: qsTr("WORKSPACE")
            color: "#64748B"
            font.pixelSize: 11
            font.bold: true
            font.letterSpacing: 1.2
            Layout.topMargin: 20
            Layout.bottomMargin: 8
        }

        // Navigation
        Repeater {
            model: sidebar.navigationItems

            delegate: NavigationButton {
                required property var modelData

                pageId: modelData.id
                label: modelData.label
                iconName: modelData.icon
                active: sidebar.currentPage === pageId
                onSelected: function(pageId) {
                    sidebar.pageSelected(pageId)
                }
            }
        }

        // Flexible empty space
        Item {
            Layout.fillHeight: true
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: "#293244"
        }

        NavigationButton {
            pageId: "settings"
            label: qsTr("Settings")
            iconName: "settings"
            active: sidebar.currentPage === pageId
            onSelected: function(pageId) {
                sidebar.pageSelected(pageId)
            }
        }

        Text {
            text: qsTr("MultiStudio v%1").arg("0.1.0")
            color: "#64748B"
            font.pixelSize: 11
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 12
        }
    }
}