import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

import MultiStudio.Theme as AppTheme

Rectangle {
    id: root

    property string applicationName: "MultiStudio"
    property string applicationVersion: "0.1.0"
    property string applicationDescription: qsTr("Open-source multistreaming studio")
    property string repositoryUrl: "https://github.com/openfreestream/MultiStudio"
    property string licenseName: qsTr("GPL-3.0")

    color: AppTheme.Theme.background

    ScrollView {
        anchors.fill: parent
        clip: true
        contentWidth: availableWidth

        ColumnLayout {
            width: parent.width
            spacing: AppTheme.Theme.spacingMedium

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: AppTheme.Theme.spacingMedium
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.leftMargin: AppTheme.Theme.spacingLarge
                Layout.rightMargin: AppTheme.Theme.spacingLarge
                spacing: AppTheme.Theme.spacingLarge

                Rectangle {
                    Layout.preferredWidth: 76
                    Layout.preferredHeight: 76
                    radius: AppTheme.Theme.radiusLarge
                    color: AppTheme.Theme.primary

                    Image {
                        anchors.centerIn: parent
                        source: "qrc:/qt/qml/MultiStudio/icons/about/layers.svg"
                        sourceSize.width: 36
                        sourceSize.height: 36
                        width: 36
                        height: 36
                        Accessible.ignored: true

                        onStatusChanged: {
                            if (status === Image.Error) {
                                console.warn("Unable to load about icon:", source)
                            }
                        }
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: AppTheme.Theme.spacingSmall

                    Label {
                        Layout.fillWidth: true
                        text: root.applicationName
                        color: AppTheme.Theme.textPrimary
                        font.pixelSize: 28
                        font.weight: Font.Bold
                        elide: Text.ElideRight
                    }

                    Label {
                        Layout.fillWidth: true
                        text: root.applicationDescription
                        color: AppTheme.Theme.textSecondary
                        font.pixelSize: 14
                        wrapMode: Text.WordWrap
                    }

                    Rectangle {
                        Layout.preferredWidth: versionRow.implicitWidth + 20
                        Layout.preferredHeight: 26
                        radius: 13
                        color: AppTheme.Theme.surfaceHover

                        RowLayout {
                            id: versionRow
                            anchors.centerIn: parent
                            spacing: 5

                            Image {
                                source: "qrc:/qt/qml/MultiStudio/icons/about/tag.svg"
                                sourceSize.width: 14
                                sourceSize.height: 14
                                Layout.preferredWidth: 14
                                Layout.preferredHeight: 14
                                Accessible.ignored: true

                                onStatusChanged: {
                                    if (status === Image.Error) {
                                        console.warn("Unable to load about icon:", source)
                                    }
                                }
                            }

                            Label {
                                text: qsTr("VERSION %1").arg(root.applicationVersion)
                                color: AppTheme.Theme.primaryHover
                                font.pixelSize: 10
                                font.weight: Font.DemiBold
                            }
                        }
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: AppTheme.Theme.spacingLarge
                Layout.rightMargin: AppTheme.Theme.spacingLarge
                Layout.preferredHeight: 1
                color: AppTheme.Theme.border
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: AppTheme.Theme.spacingLarge
                Layout.rightMargin: AppTheme.Theme.spacingLarge
                Layout.preferredHeight: aboutContent.implicitHeight
                    + AppTheme.Theme.spacingLarge * 2
                color: AppTheme.Theme.surface
                radius: AppTheme.Theme.radiusMedium
                border.width: 1
                border.color: AppTheme.Theme.border

                ColumnLayout {
                    id: aboutContent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: AppTheme.Theme.spacingLarge
                    spacing: AppTheme.Theme.spacingSmall

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: AppTheme.Theme.spacingSmall

                        Image {
                            source: "qrc:/qt/qml/MultiStudio/icons/about/info.svg"
                            sourceSize.width: 16
                            sourceSize.height: 16
                            Layout.preferredWidth: 16
                            Layout.preferredHeight: 16
                            Accessible.ignored: true

                            onStatusChanged: {
                                if (status === Image.Error) {
                                    console.warn("Unable to load about icon:", source)
                                }
                            }
                        }

                        Label {
                            text: qsTr("ABOUT THE PROJECT")
                            color: AppTheme.Theme.primaryHover
                            font.pixelSize: 10
                            font.weight: Font.DemiBold
                        }
                    }

                    Label {
                        Layout.fillWidth: true
                        text: qsTr("A studio built for your streams")
                        color: AppTheme.Theme.textPrimary
                        font.pixelSize: 18
                        font.weight: Font.DemiBold
                        wrapMode: Text.WordWrap
                    }

                    Label {
                        Layout.fillWidth: true
                        Layout.topMargin: AppTheme.Theme.spacingSmall
                        text: qsTr("MultiStudio is an open-source desktop application designed for managing live streaming workflows and multiple streaming destinations.")
                        color: AppTheme.Theme.textSecondary
                        font.pixelSize: 14
                        wrapMode: Text.WordWrap
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: AppTheme.Theme.spacingLarge
                Layout.rightMargin: AppTheme.Theme.spacingLarge
                Layout.preferredHeight: technologiesContent.implicitHeight
                    + AppTheme.Theme.spacingLarge * 2
                color: AppTheme.Theme.surface
                radius: AppTheme.Theme.radiusMedium
                border.width: 1
                border.color: AppTheme.Theme.border

                ColumnLayout {
                    id: technologiesContent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: AppTheme.Theme.spacingLarge
                    spacing: AppTheme.Theme.spacingMedium

                    Label {
                        text: qsTr("Built with")
                        color: AppTheme.Theme.textPrimary
                        font.pixelSize: 18
                        font.weight: Font.DemiBold
                    }

                    Repeater {
                        model: [
                            {
                                name: "Qt",
                                description: "6.12",
                                icon: "layers"
                            },
                            {
                                name: "QML",
                                description: qsTr("User interface"),
                                icon: "code-xml"
                            },
                            {
                                name: "C++",
                                description: "C++20",
                                icon: "cpu"
                            },
                            {
                                name: "CMake",
                                description: qsTr("Build system"),
                                icon: "wrench"
                            },
                            {
                                name: "FFmpeg",
                                description: qsTr("Optional streaming backend"),
                                icon: "film"
                            }
                        ]

                        delegate: RowLayout {
                            id: technologyItem

                            required property var modelData
                            Layout.fillWidth: true
                            spacing: AppTheme.Theme.spacingMedium

                            Image {
                                readonly property string iconSource:
                                    "qrc:/qt/qml/MultiStudio/icons/about/"
                                    + technologyItem.modelData.icon + ".svg"

                                source: iconSource
                                sourceSize.width: 20
                                sourceSize.height: 20
                                Layout.preferredWidth: 20
                                Layout.preferredHeight: 20
                                Accessible.ignored: true

                                onStatusChanged: {
                                    if (status === Image.Error) {
                                        console.warn("Unable to load about icon:", source)
                                    }
                                }
                            }

                            Label {
                                Layout.fillWidth: true
                                text: technologyItem.modelData.name
                                color: AppTheme.Theme.textPrimary
                                font.pixelSize: 13
                                font.weight: Font.Medium
                            }

                            Label {
                                text: technologyItem.modelData.description
                                color: AppTheme.Theme.textMuted
                                font.pixelSize: 12
                            }
                        }
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: AppTheme.Theme.spacingLarge
                Layout.rightMargin: AppTheme.Theme.spacingLarge
                Layout.preferredHeight: projectContent.implicitHeight
                    + AppTheme.Theme.spacingLarge * 2
                color: AppTheme.Theme.surface
                radius: AppTheme.Theme.radiusMedium
                border.width: 1
                border.color: AppTheme.Theme.border

                ColumnLayout {
                    id: projectContent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: AppTheme.Theme.spacingLarge
                    spacing: AppTheme.Theme.spacingMedium

                    Label {
                        text: qsTr("Project information")
                        color: AppTheme.Theme.textPrimary
                        font.pixelSize: 18
                        font.weight: Font.DemiBold
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: AppTheme.Theme.spacingSmall

                        Image {
                            source: "qrc:/qt/qml/MultiStudio/icons/about/scale.svg"
                            sourceSize.width: 18
                            sourceSize.height: 18
                            Layout.preferredWidth: 18
                            Layout.preferredHeight: 18
                            Accessible.ignored: true

                            onStatusChanged: {
                                if (status === Image.Error) {
                                    console.warn("Unable to load about icon:", source)
                                }
                            }
                        }

                        Label {
                            Layout.fillWidth: true
                            text: qsTr("License")
                            color: AppTheme.Theme.textSecondary
                            font.pixelSize: 13
                        }

                        Label {
                            text: root.licenseName
                            color: AppTheme.Theme.textPrimary
                            font.pixelSize: 13
                            font.weight: Font.Medium
                        }
                    }

                    Button {
                        id: repositoryButton

                        Layout.fillWidth: true
                        Layout.preferredHeight: 42
                        text: qsTr("View project on GitHub")
                        enabled: root.repositoryUrl.length > 0
                        activeFocusOnTab: true

                        contentItem: RowLayout {
                            spacing: AppTheme.Theme.spacingSmall

                            Item {
                                Layout.fillWidth: true
                            }

                            Image {
                                source: "qrc:/qt/qml/MultiStudio/icons/about/github.svg"
                                sourceSize.width: 18
                                sourceSize.height: 18
                                Layout.preferredWidth: 18
                                Layout.preferredHeight: 18
                                Accessible.ignored: true

                                onStatusChanged: {
                                    if (status === Image.Error) {
                                        console.warn("Unable to load about icon:", source)
                                    }
                                }
                            }

                            Label {
                                text: repositoryButton.text
                                color: repositoryButton.enabled
                                    ? AppTheme.Theme.primaryForeground
                                    : AppTheme.Theme.textMuted
                                font.pixelSize: 13
                                font.weight: Font.DemiBold
                            }

                            Item {
                                Layout.fillWidth: true
                            }
                        }

                        background: Rectangle {
                            radius: AppTheme.Theme.radiusSmall
                            color: !repositoryButton.enabled
                                ? AppTheme.Theme.surfaceHover
                                : repositoryButton.down
                                    ? AppTheme.Theme.primaryHover
                                    : AppTheme.Theme.primary
                            border.width: repositoryButton.visualFocus ? 2 : 0
                            border.color: AppTheme.Theme.primaryHover
                        }

                        onClicked: Qt.openUrlExternally(root.repositoryUrl)
                    }
                }
            }

            Label {
                Layout.fillWidth: true
                Layout.leftMargin: AppTheme.Theme.spacingLarge
                Layout.rightMargin: AppTheme.Theme.spacingLarge
                Layout.bottomMargin: AppTheme.Theme.spacingLarge
                text: qsTr("Made with Qt")
                color: AppTheme.Theme.textMuted
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
