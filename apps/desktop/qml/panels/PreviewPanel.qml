import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import MultiStudio.Theme as AppTheme

Rectangle {
    id: root

    default property alias previewContent: previewSurface.data

    property string previewTitle: qsTr("Preview")
    property string resolution: "1920 × 1080"
    property int frameRate: 60
    property bool previewAvailable: false

    color: AppTheme.Theme.surface
    radius: AppTheme.Theme.radiusMedium
    border.width: 1
    border.color: AppTheme.Theme.border

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: AppTheme.Theme.spacingMedium
        spacing: AppTheme.Theme.spacingSmall

        RowLayout {
            Layout.fillWidth: true
            spacing: AppTheme.Theme.spacingSmall

            Label {
                Layout.fillWidth: true
                text: root.previewTitle
                color: AppTheme.Theme.textPrimary
                font.pixelSize: 16
                font.weight: Font.DemiBold
                elide: Text.ElideRight
            }

            Rectangle {
                Layout.preferredWidth: statusLabel.implicitWidth + 20
                Layout.preferredHeight: 26
                radius: 13
                color: root.previewAvailable ? "#143126" : AppTheme.Theme.surfaceHover

                RowLayout {
                    anchors.centerIn: parent
                    spacing: 6

                    Rectangle {
                        Layout.preferredWidth: 7
                        Layout.preferredHeight: 7
                        radius: 4
                        color: root.previewAvailable
                            ? AppTheme.Theme.success
                            : AppTheme.Theme.textMuted
                    }

                    Label {
                        id: statusLabel
                        text: root.previewAvailable ? qsTr("LIVE") : qsTr("OFFLINE")
                        color: root.previewAvailable
                            ? AppTheme.Theme.success
                            : AppTheme.Theme.textSecondary
                        font.pixelSize: 10
                        font.weight: Font.DemiBold
                    }
                }
            }
        }

        Label {
            Layout.fillWidth: true
            text: qsTr("%1 · %2 FPS").arg(root.resolution).arg(root.frameRate)
            color: AppTheme.Theme.textMuted
            font.pixelSize: 12
        }

        Rectangle {
            id: previewSurface

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: 200

            color: "#090A0D"
            radius: AppTheme.Theme.radiusSmall
            border.width: 1
            border.color: AppTheme.Theme.border
            clip: true

            Rectangle {
                anchors.fill: parent
                anchors.margins: 1
                color: "transparent"
                radius: AppTheme.Theme.radiusSmall
                border.width: 1
                border.color: "#17191E"
                visible: !root.previewAvailable

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: AppTheme.Theme.spacingSmall

                    Rectangle {
                        Layout.alignment: Qt.AlignHCenter
                        Layout.preferredWidth: 52
                        Layout.preferredHeight: 52
                        radius: AppTheme.Theme.radiusMedium
                        color: AppTheme.Theme.surface
                        border.color: AppTheme.Theme.border

                        Label {
                            anchors.centerIn: parent
                            text: "▶"
                            color: AppTheme.Theme.textMuted
                            font.pixelSize: 20
                        }
                    }

                    Label {
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("Preview is offline")
                        color: AppTheme.Theme.textSecondary
                        font.pixelSize: 14
                        font.weight: Font.DemiBold
                    }

                    Label {
                        Layout.alignment: Qt.AlignHCenter
                        text: qsTr("Start your stream to see it here.")
                        color: AppTheme.Theme.textMuted
                        font.pixelSize: 12
                    }
                }
            }
        }
    }
}
