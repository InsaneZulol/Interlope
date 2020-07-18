import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle {
    id: button;

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

    HoverHandler {
        onHoveredChanged: hovered == true
                          ? button.state = "ON"
                          : button.state = "OUT"
    }

    TapHandler {
        onTapped: {
            menu.open()
            console.log("assigned action is " + assignedAction)
        }
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
        text: assignedAction;
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

    Menu {
        id: menu
        y: button.height * 0.8
        x: button.width * 0.8

        delegate: MenuItem {
            antialiasing: true
            id: menuItem
            font.family: "Segoe UI"

            font.pixelSize: (parent.height/20);
            implicitWidth: 200
            implicitHeight: 35
            contentItem: Text {
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
                color: menuItem.highlighted ? "#555B61" : "transparent"
            }

        }

        Action {
            text: "Toggle Playback";
            onTriggered: {
                keybindSettings.action_toggleKey = button.caption;
            }
        }
        Action {
            text: "Fast Forward 15sec."
        }
        Action {
            text: "Reverse 15sec."
        }
        Action {
            text: "Next"
        }
        Action {
            text: "Previous"
        }
        Action {
            text: "Increase volume"
        }
        Action {
            text: "Decrease volume"
        }
        MenuSeparator {
            contentItem: Rectangle {
                implicitHeight: 1
                color: "white"
            }
        }
        Action {
            text: "Clear"
            onTriggered: {
                // remvoe just that one key, not empty whole!
                keybindSettings.action_toggleKeys = [];
                keybindSettings.action_nextKeys = [];
            }
        }

        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 20
            color: "#2a2c2e"
            border.color: "#2a2c2e"
            radius: 1
        }
    }



    states: [
        State {
            name: "ON"
            PropertyChanges { target: button; color: hoverColor}
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

    Connections{
        target: keybindSettings

        function onAction_toggleKeyChanged() {
            console.log("onAction_toggleKeyChanged")
            if(keybindSettings.action_toggleKey == button.caption) {
                button.assignedAction = qsTr("Toggle Playback");
            } else assignedAction = qsTr("");
        }
    }
    // we lookup settings to check if there is action bound to this key
    Component.onCompleted: {
        if(keybindSettings.action_toggleKey == button.caption)
            button.assignedAction = qsTr("Toggle Playback");
    }


    signal newToggleBinding(string key);
    signal clearBinding(string keyName);


    property real aspectRatio: 1;
    property real sizeRatio: 0.04;
    property bool isVerticalKey: false;
    property color hoverColor: "#000000"
    property string assignedAction: qsTr("");
    property string caption: qsTr("...");
    // Checks settings for key name/caption.
    // Returns action bound to that name.
}

