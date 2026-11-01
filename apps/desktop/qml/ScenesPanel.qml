pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

import MultiStudio.Theme as AppTheme

Rectangle {
    id: root

    property int selectedSceneIndex: 0
    readonly property string selectedSceneName: {
        if (selectedSceneIndex < 0 || selectedSceneIndex >= scenesModel.count)
            return ""

        return scenesModel.get(selectedSceneIndex).sceneName
    }

    signal sceneSelected(int index, string name)

    color: AppTheme.Theme.surface
    radius: AppTheme.Theme.radiusMedium
    border.width: 1
    border.color: AppTheme.Theme.border

    function selectScene(index) {
        if (index < 0 || index >= scenesModel.count)
            return

        selectedSceneIndex = index
        sceneSelected(index, scenesModel.get(index).sceneName)
    }

    function addScene(name) {
        const sceneName = name.trim()

        if (sceneName.length === 0)
            return

        scenesModel.append({ sceneName: sceneName })
        selectScene(scenesModel.count - 1)
    }

    function removeSelectedScene() {
        if (scenesModel.count <= 1)
            return

        const removedIndex = selectedSceneIndex

        if (removedIndex < 0 || removedIndex >= scenesModel.count)
            return

        scenesModel.remove(removedIndex)
        selectScene(Math.min(removedIndex, scenesModel.count - 1))
    }

    function renameSelectedScene(name) {
        const sceneName = name.trim()

        if (sceneName.length === 0 || selectedSceneIndex < 0)
            return

        scenesModel.setProperty(selectedSceneIndex, "sceneName", sceneName)
        sceneSelected(selectedSceneIndex, sceneName)
    }

    ListModel {
        id: scenesModel

        ListElement {
            sceneName: "Scene 1"
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: AppTheme.Theme.spacingMedium
        spacing: AppTheme.Theme.spacingMedium

        RowLayout {
            Layout.fillWidth: true
            spacing: AppTheme.Theme.spacingSmall

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 3

                Label {
                    text: qsTr("Scenes")
                    color: AppTheme.Theme.textPrimary
                    font.pixelSize: 16
                    font.weight: Font.DemiBold
                }

                Label {
                    text: qsTr("Choose a scene for your production")
                    color: AppTheme.Theme.textMuted
                    font.pixelSize: 11
                }
            }

            Rectangle {
                Layout.minimumWidth: 30
                Layout.preferredHeight: 26
                radius: 13
                color: AppTheme.Theme.surfaceHover

                Label {
                    anchors.centerIn: parent
                    text: scenesModel.count
                    color: AppTheme.Theme.textSecondary
                    font.pixelSize: 11
                    font.weight: Font.DemiBold
                }
            }
        }

        ListView {
            id: scenesList

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: 120

            model: scenesModel
            spacing: 6
            clip: true
            currentIndex: root.selectedSceneIndex
            boundsBehavior: Flickable.StopAtBounds

            delegate: Button {
                id: sceneButton

                required property int index
                required property string sceneName

                width: scenesList.width
                height: 54
                text: sceneName
                activeFocusOnTab: true

                background: Rectangle {
                    radius: AppTheme.Theme.radiusSmall
                    color: root.selectedSceneIndex === sceneButton.index
                        ? "#25233A"
                        : sceneButton.hovered
                            ? AppTheme.Theme.surfaceHover
                            : "transparent"
                    border.width: root.selectedSceneIndex === sceneButton.index
                        || sceneButton.visualFocus
                        ? 1
                        : 0
                    border.color: sceneButton.visualFocus
                        ? AppTheme.Theme.primaryHover
                        : "#3D385C"
                }

                contentItem: RowLayout {
                    spacing: AppTheme.Theme.spacingSmall

                    Rectangle {
                        Layout.preferredWidth: 3
                        Layout.preferredHeight: 24
                        radius: 2
                        color: AppTheme.Theme.primary
                        visible: root.selectedSceneIndex === sceneButton.index
                    }

                    Rectangle {
                        Layout.preferredWidth: 30
                        Layout.preferredHeight: 30
                        radius: AppTheme.Theme.radiusSmall
                        color: root.selectedSceneIndex === sceneButton.index
                            ? AppTheme.Theme.primary
                            : AppTheme.Theme.background

                        Label {
                            anchors.centerIn: parent
                            text: "▶"
                            color: root.selectedSceneIndex === sceneButton.index
                                ? AppTheme.Theme.primaryForeground
                                : AppTheme.Theme.textMuted
                            font.pixelSize: 10
                        }
                    }

                    Label {
                        Layout.fillWidth: true
                        text: sceneButton.text
                        color: AppTheme.Theme.textPrimary
                        font.pixelSize: 13
                        font.weight: root.selectedSceneIndex === sceneButton.index
                            ? Font.DemiBold
                            : Font.Normal
                        elide: Text.ElideRight
                    }

                    Label {
                        visible: root.selectedSceneIndex === sceneButton.index
                        text: qsTr("ACTIVE")
                        color: AppTheme.Theme.primaryHover
                        font.pixelSize: 9
                        font.weight: Font.DemiBold
                    }
                }

                onClicked: root.selectScene(sceneButton.index)
            }

            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AsNeeded
            }
        }

        Button {
            id: addSceneButton

            Layout.fillWidth: true
            Layout.preferredHeight: 40
            text: qsTr("Add scene")
            activeFocusOnTab: true

            contentItem: Label {
                text: addSceneButton.text
                color: AppTheme.Theme.primaryForeground
                font.pixelSize: 13
                font.weight: Font.DemiBold
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                radius: AppTheme.Theme.radiusSmall
                color: addSceneButton.down
                    ? AppTheme.Theme.primaryHover
                    : AppTheme.Theme.primary
                border.width: addSceneButton.visualFocus ? 2 : 0
                border.color: AppTheme.Theme.primaryHover
            }

            onClicked: {
                addField.text = qsTr("Scene %1").arg(scenesModel.count + 1)
                addDialog.open()
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: AppTheme.Theme.spacingSmall

            Button {
                Layout.fillWidth: true
                Layout.preferredHeight: 34
                text: qsTr("Rename")
                enabled: root.selectedSceneIndex >= 0
                activeFocusOnTab: true

                onClicked: {
                    renameField.text = root.selectedSceneName
                    renameDialog.open()
                }
            }

            Button {
                Layout.fillWidth: true
                Layout.preferredHeight: 34
                text: qsTr("Remove")
                enabled: scenesModel.count > 1
                activeFocusOnTab: true

                onClicked: removeDialog.open()
            }
        }
    }

    Dialog {
        id: addDialog

        parent: Overlay.overlay
        anchors.centerIn: parent
        title: qsTr("Add Scene")
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel
        width: 320
        onAccepted: root.addScene(addField.text)

        contentItem: TextField {
            id: addField

            placeholderText: qsTr("Scene name")
            selectByMouse: true
        }
    }

    Dialog {
        id: renameDialog

        parent: Overlay.overlay
        anchors.centerIn: parent
        title: qsTr("Rename Scene")
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel
        width: 320
        onAccepted: root.renameSelectedScene(renameField.text)

        contentItem: TextField {
            id: renameField

            placeholderText: qsTr("Scene name")
            selectByMouse: true
        }
    }

    Dialog {
        id: removeDialog

        parent: Overlay.overlay
        anchors.centerIn: parent
        title: qsTr("Remove Scene")
        modal: true
        standardButtons: Dialog.Yes | Dialog.No
        width: 340
        onAccepted: root.removeSelectedScene()

        contentItem: Label {
            text: qsTr("Do you want to remove the selected scene?")
            color: AppTheme.Theme.textSecondary
            wrapMode: Text.WordWrap
        }
    }
}
