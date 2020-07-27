import QtQuick 2.12
import QtQuick.Controls 2.12
import "Key.js" as Logic

Menu {
    y: button.height * 0.8
    x: button.width * 0.8

    delegate: MenuItem {
        id: menuItem
        font.family: "Segoe UI"
        font.weight: Font.SemiLight

        font.pixelSize: (parent.height/20);
        implicitWidth: 200
        implicitHeight: 35
        contentItem: Text {
            renderType: Text.NativeRendering
            leftPadding: menuItem.indicator.width
            rightPadding: menuItem.arrow.width
            text: menuItem.text
            font: menuItem.font
            color: "white"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 30
            color: menuItem.highlighted ? "#172325" : "transparent"
        }

    }

    Action {
        text: textConstants.toggle_playback;
        onTriggered: {
            Logic.clearAllBindings();
            keybindSettings.toggle = button.key;
            button.actionLabel = this.text;
        }
    }
    Action {
        text: textConstants.fast_forward;
        onTriggered: {
            Logic.clearAllBindings();
            keybindSettings.fastFwd = button.key;
            button.actionLabel = this.text;
        }
    }
    Action {
        text: textConstants.reverse;
        onTriggered: {
            Logic.clearAllBindings();
            keybindSettings.reverse = button.key;
            button.actionLabel = this.text;
        }
    }
    Action {
        text: textConstants.next;
        onTriggered: {
            Logic.clearAllBindings();
            keybindSettings.next = button.key;
            button.actionLabel = this.text;
        }
    }
    Action {
        text: textConstants.previous;
        onTriggered: {
            Logic.clearAllBindings();
            keybindSettings.prev = button.key;
            button.actionLabel = this.text;
        }
    }
    Action {
        text: textConstants.increase_vol;
        onTriggered: {
            Logic.clearAllBindings();
            keybindSettings.volUp = button.key;
            button.actionLabel = this.text;
        }
    }
    Action {
        text: textConstants.decrease_vol;
        onTriggered: {
            Logic.clearAllBindings();
            keybindSettings.volDn = button.key;
            button.actionLabel = this.text;
        }
    }
    MenuSeparator {
        contentItem: Rectangle {
            implicitHeight: 1
            color: "white"
        }
    }
    Action {
        text: textConstants.clear;
        onTriggered: {
            Logic.clearAllBindings();
            button.actionLabel = qsTr("");
        }
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 20
        color: "#131516"
        border.color: "#0C1114"
        radius: 6
    }

}
