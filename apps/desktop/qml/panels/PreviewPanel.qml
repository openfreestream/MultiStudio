import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import MultiStudio.Theme

Rectangle {
    id: root

    property string previewTitle: qsTr("Preview")
    property string resolution: "1920 × 1080"
    property int frameRate: 60
    property bool previewAvailable: false

    color: Theme.surface
    radius: Theme.radiusMedium
    border.width: 1
    border.color: Theme.border

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Theme.spacingMedium
        spacing: Theme.spacingMedium

        RowLayout {
            Layout.fillWidth: true
            spacing: Theme.spacingSmall

            Label {
                Layout.fillWidth: true

                text: root.previewTitle
                color: Theme.textPrimary
                font.pixelSize: 16
                font.weight: Font.DemiBold
            }

            Label {
                text: root.resolution + " · " + root.frameRate + " FPS"
                color: Theme.textSecondary
                font.pixelSize: 12
            }
        }

        Rectangle {
            id: previewSurface

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: 200

            color: Theme.background
            radius: Theme.radiusSmall
            border.width: 1
            border.color: Theme.border

            Label {
                anchors.centerIn: parent
                visible: !root.previewAvailable

                text: qsTr("No preview available")
                color: Theme.textMuted
                font.pixelSize: 14
            }
        }
    }
}
