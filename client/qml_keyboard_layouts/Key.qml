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
        id: hoverHandler;
        onHoveredChanged: hovered == true
                          ? button.state = "ON"
                          : button.state = "OUT"
    }

    TapHandler {
        id: tapHandler;
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

    Menu {
        id: menu
        y: button.height * 0.8
        x: button.width * 0.8

        delegate: MenuItem {
            id: menuItem
            font.family: "Arial"
            font.pixelSize: (parent.height/9);
            implicitWidth: 200
            implicitHeight: 40
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
                implicitHeight: 40
                color: menuItem.highlighted ? "#555B61" : "transparent"
            }

        }

        Action {
            text: "New..."
        }
        Action {
            text: "Open..."
        }
        MenuSeparator {
            contentItem: Rectangle {
                implicitHeight: 1
                color: "white"
            }}
        Action {
            text: "Clear"
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

    signal keyClicked();

    property string caption: "...";
    property real aspectRatio: 1;
    property real sizeRatio: 0.04;
    property bool isVerticalKey: false;
    property color hoverColor: "#000000"
}

