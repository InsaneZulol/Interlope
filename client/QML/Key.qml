import QtQuick 2.12
import de.skycoder42.QHotkey 1.0
import "Key.js" as Logic

Rectangle {
    id: button;
    objectName: "kbutton";
    color: "#101011"
    radius: windowRoot.width * sizeRatio / 10;
    border.color: "#2a2c2e"
    border.width: windowRoot.width * sizeRatio / 33;

    width:  isVerticalKey
            ? (windowRoot.width * sizeRatio)
            : (windowRoot.width * sizeRatio) * aspectRatio
    height: isVerticalKey
            ? (windowRoot.width * sizeRatio) * aspectRatio
            : (windowRoot.width * sizeRatio);


    signal clearBinding(keyName: int);

    property real aspectRatio: 1;
    property real sizeRatio: 0.04;
    property bool isVerticalKey: false;
    property string actionLabel: qsTr("");
    property string caption: qsTr("...");
    property int key // Qt::Key

    TextConstants {
        id: textConstants
    }

    HoverHandler {
        onHoveredChanged: hovered == true
                          ? button.state = "ON"
                          : button.state = "OUT"
    }

    TapHandler {
        onTapped: menu.open()
        onLongPressed: menu.open()
    }

    Text {
        text: caption;
        color: "White";
        anchors.fill: parent;
        fontSizeMode: Text.Fit;
        font.pixelSize: isVerticalKey
                        ? (parent.width/5)
                        : (parent.height/5);

        font.family: "Consolas";
        minimumPixelSize: 4;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
    }

    Text {
        text: actionLabel;
        topPadding: parent.height/10
        anchors.fill: parent;
        color: "lightgrey";
        fontSizeMode: Text.Fit;
        font.pixelSize: isVerticalKey
                        ? (parent.width/6)
                        : (parent.height/6);

        font.family: "Consolas";
        font.italic: true;
        minimumPixelSize: 4;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignTop;
    }

    ActionMenu{
        id: menu
    }

    states: [
        State {
            name: "ON"
            PropertyChanges { target: button; color: "#000000"}
        },
        State {
            name: "OUT"
            PropertyChanges { target: button; color: "#101111"}
        }
    ]

    transitions: [
        Transition {
            from: "ON"
            to: "OUT"
            ColorAnimation { target: button; duration: 250;}
        },
        Transition {
            from: "OUT"
            to: "ON"
            ColorAnimation { target: button; duration: 250;}
        }
    ]

    Connections {
        target: keybindSettings
        function onSettingsChanged() {
            Logic.refresh();
        }
    }



    // lookup settings, check if there is action bound to this key
    Component.onCompleted: {
        let s = keybindSettings;
        Logic.tryLabel(s.toggle, "Toggle Playback")
        Logic.tryLabel(s.fastFwd, "Fast Forward 15sec.")
        Logic.tryLabel(s.reverse, "Reverse 15sec.")
        Logic.tryLabel(s.next, "Next")
        Logic.tryLabel(s.prev, "Previous")
        Logic.tryLabel(s.volUp, "Increase Volume")
        Logic.tryLabel(s.volDn, "Decrease Volume")
    }

}


