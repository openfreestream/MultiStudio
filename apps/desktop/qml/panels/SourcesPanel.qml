
pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import MultiStudio.Theme

Rectangle {
    id: root

    property int selectedSourceIndex: -1

    signal sourceSelected(int index, string name)
    signal sourceVisibilityChanged(int index, bool visible)

    color: Theme.surface
    radius: Theme.radiusMedium
    border.width: 1
    border.color: Theme.border

    function selectSource(index) {
        if (index < 0 || index >= sourcesModel.count)
            return

        selectedSourceIndex = index
        sourceSelected(index, sourcesModel.get(index).sourceName)
    }

    function addSource(name, type) {
        const sourceName = name.trim()

        if (sourceName.length === 0)
            return

        sourcesModel.append({
            sourceName: sourceName,
            sourceType: type,
            sourceVisible: true
        })

        selectSource(sourcesModel.count - 1)
    }

    function removeSelectedSource() {
        if (selectedSourceIndex < 0)
            return

        const index = selectedSourceIndex
        sourcesModel.remove(index)

        selectedSourceIndex = -1

        if (sourcesModel.count > 0)
            selectSource(Math.min(index, sourcesModel.count - 1))
    }

    function renameSelectedSource(name) {
        const sourceName = name.trim()

        if (sourceName.length === 0 || selectedSourceIndex < 0)
            return

        sourcesModel.setProperty(
            selectedSourceIndex,
            "sourceName",
            sourceName
        )

        sourceSelected(selectedSourceIndex, sourceName)
    }

    ListModel {
        id: sourcesModel
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Theme.spacingMedium
        spacing: Theme.spacingMedium

        RowLayout {
            Layout.fillWidth: true

            Label {
                Layout.fillWidth: true
                text: qsTr("Sources")
                color: Theme.textPrimary
                font.pixelSize: 16
                font.weight: Font.DemiBold
            }

            Label {
                text: sourcesModel.count.toString()
                color: Theme.textSecondary
                font.pixelSize: 12
            }
        }

        ListView {
            id: sourcesList

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: 120

            model: sourcesModel
            spacing: 4
            clip: true

            delegate: Rectangle {
                id: sourceDelegate

                required property int index
                required property string sourceName
                required property string sourceType
                required property bool sourceVisible

                width: sourcesList.width
                height: 44
                radius: Theme.radiusSmall

                color: root.selectedSourceIndex === index
                    ? Theme.primary
                    : sourceMouseArea.containsMouse
                        ? Theme.surfaceHover
                        : "transparent"

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: Theme.spacingSmall
                    anchors.rightMargin: Theme.spacingSmall
                    spacing: Theme.spacingSmall

                    Label {
                        Layout.fillWidth: true

                        text: sourceDelegate.sourceName
                        elide: Text.ElideRight
                        color: sourceDelegate.sourceVisible
                            ? Theme.textPrimary
                            : Theme.textMuted

                        font.pixelSize: 13
                    }

                    Button {
                        text: sourceDelegate.sourceVisible
                            ? qsTr("Hide")
                            : qsTr("Show")

                        onClicked: {
                            const visible = !sourceDelegate.sourceVisible

                            sourcesModel.setProperty(
                                sourceDelegate.index,
                                "sourceVisible",
                                visible
                            )

                            root.sourceVisibilityChanged(
                                sourceDelegate.index,
                                visible
                            )
                        }
                    }
                }

                MouseArea {
                    id: sourceMouseArea

                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    z: -1

                    onClicked: root.selectSource(sourceDelegate.index)
                }
            }

            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AsNeeded
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: Theme.spacingSmall

            Button {
                Layout.fillWidth: true
                text: qsTr("Add")

                onClicked: {
                    sourceNameField.text = ""
                    sourceTypeBox.currentIndex = 0
                    addDialog.open()
                }
            }

            Button {
                Layout.fillWidth: true
                text: qsTr("Rename")
                enabled: root.selectedSourceIndex >= 0

                onClicked: {
                    renameField.text = sourcesModel.get(
                        root.selectedSourceIndex
                    ).sourceName

                    renameDialog.open()
                }
            }

            Button {
                Layout.fillWidth: true
                text: qsTr("Remove")
                enabled: root.selectedSourceIndex >= 0

                onClicked: removeDialog.open()
            }
        }
    }

    Dialog {
        id: addDialog

        parent: Overlay.overlay
        anchors.centerIn: parent

        title: qsTr("Add Source")
        modal: true
        width: 340

        standardButtons: Dialog.Ok | Dialog.Cancel

        onAccepted: root.addSource(
            sourceNameField.text,
            sourceTypeBox.currentText
        )

        contentItem: ColumnLayout {
            spacing: Theme.spacingMedium

            TextField {
                id: sourceNameField

                Layout.fillWidth: true
                placeholderText: qsTr("Source name")
                selectByMouse: true
            }

            ComboBox {
                id: sourceTypeBox

                Layout.fillWidth: true

                model: [
                    qsTr("Display Capture"),
                    qsTr("Window Capture"),
                    qsTr("Video Capture Device"),
                    qsTr("Image"),
                    qsTr("Media Source"),
                    qsTr("Text")
                ]
            }
        }
    }

    Dialog {
        id: renameDialog

        parent: Overlay.overlay
        anchors.centerIn: parent

        title: qsTr("Rename Source")
        modal: true
        width: 320

        standardButtons: Dialog.Ok | Dialog.Cancel

        onAccepted: root.renameSelectedSource(renameField.text)

        contentItem: TextField {
            id: renameField

            placeholderText: qsTr("Source name")
            selectByMouse: true
        }
    }

    Dialog {
        id: removeDialog

        parent: Overlay.overlay
        anchors.centerIn: parent

        title: qsTr("Remove Source")
        modal: true
        width: 340

        standardButtons: Dialog.Yes | Dialog.No

        onAccepted: root.removeSelectedSource()

        contentItem: Label {
            text: qsTr("Do you want to remove the selected source?")
            wrapMode: Text.WordWrap
        }
    }
}
