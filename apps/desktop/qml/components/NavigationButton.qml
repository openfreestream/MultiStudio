import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Button {
    id: control

    required property string pageId
    required property string label
    required property string iconName
    required property bool active

    signal selected(string pageId)

    readonly property string iconSource:
        "qrc:/qt/qml/MultiStudio/icons/" + iconName + ".svg"

    text: label
    activeFocusOnTab: true
    leftPadding: 14
    rightPadding: 12
    topPadding: 0
    bottomPadding: 0

    Accessible.name: label

    background: Rectangle {
        radius: 10
        color: control.active || control.down
            ? "#312454"
            : control.hovered
                ? "#1F2937"
                : "transparent"
        border.color: "#C4B5FD"
        border.width: control.visualFocus ? 2 : 0
    }

    contentItem: RowLayout {
        spacing: 14

        Rectangle {
            Layout.preferredWidth: 3
            Layout.preferredHeight: 22
            radius: 2
            color: control.active ? "#A78BFA" : "transparent"
            Accessible.ignored: true
        }

        Image {
            source: control.iconSource
            sourceSize.width: 24
            sourceSize.height: 24
            fillMode: Image.PreserveAspectFit
            Layout.preferredWidth: 22
            Layout.preferredHeight: 22
            Accessible.ignored: true

            onStatusChanged: {
                if (status === Image.Error) {
                    console.warn("Unable to load navigation icon:", source)
                }
            }
        }

        Text {
            text: control.label
            color: control.active ? "#FFFFFF" : "#CBD5E1"
            font.pixelSize: 14
            font.bold: control.active
            Layout.fillWidth: true
            Accessible.ignored: true
        }
    }

    Layout.fillWidth: true
    Layout.preferredHeight: 46

    onClicked: selected(pageId)
}
