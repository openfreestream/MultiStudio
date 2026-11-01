import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import MultiStudio
import MultiStudio.Theme as AppTheme

ApplicationWindow {
    id: window

    width: 1280
    height: 800
    minimumWidth: 960
    minimumHeight: 600

    visible: true
    title: qsTr("MultiStudio")

    color: AppTheme.Theme.background

    property string currentPage: "dashboard"
    readonly property var pageContent: ({
        dashboard: {
            title: qsTr("Welcome to MultiStudio"),
            description: qsTr("Your streaming workspace is ready to set up.")
        },
        studio: {
            title: qsTr("Studio"),
            description: qsTr("Manage your live production.")
        },
        destinations: {
            title: qsTr("Destinations"),
            description: qsTr("Configure your streaming platforms.")
        },
        "audio-mixer": {
            title: qsTr("Audio Mixer"),
            description: qsTr("Control your audio sources.")
        },
        soundboard: {
            title: qsTr("Soundboard"),
            description: qsTr("Manage your sound effects.")
        },
        plugins: {
            title: qsTr("Plugins"),
            description: qsTr("Extend MultiStudio with plugins.")
        },
        analytics: {
            title: qsTr("Analytics"),
            description: qsTr("Explore your streaming statistics.")
        },
        settings: {
            title: qsTr("Settings"),
            description: qsTr("Configure MultiStudio.")
        }
    })

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Sidebar {
            id: sidebar

            Layout.fillHeight: true
            Layout.preferredWidth: AppTheme.Theme.sidebarWidth

            currentPage: window.currentPage
            onPageSelected: function(page) {
                window.currentPage = page
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.centerIn: parent
                spacing: AppTheme.Theme.spacingMedium

                Rectangle {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: 64
                    Layout.preferredHeight: 64
                    radius: AppTheme.Theme.radiusLarge
                    color: AppTheme.Theme.surface
                    border.color: AppTheme.Theme.border

                    Label {
                        anchors.centerIn: parent
                        text: "M"
                        color: AppTheme.Theme.primary
                        font.pixelSize: 32
                        font.weight: Font.Bold
                    }
                }

                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: window.pageContent[window.currentPage].title
                    color: AppTheme.Theme.textPrimary
                    font.pixelSize: 28
                    font.weight: Font.DemiBold
                    horizontalAlignment: Text.AlignHCenter
                }

                Label {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.maximumWidth: 480
                    text: window.pageContent[window.currentPage].description
                    color: AppTheme.Theme.textSecondary
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                }
            }
        }
    }
}
