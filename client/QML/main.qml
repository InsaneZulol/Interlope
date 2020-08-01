import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import Qt.labs.platform 1.1
import Qt.labs.settings 1.0
import de.skycoder42.QHotkey 1.0
import "Key.js" as Logic

ApplicationWindow {
    id: windowRoot
    visible: false
    title: qsTr("Interlope")
    
    width: 640
    height: 480
    color: "#252526"
    onClosing: {
        close.accepted = false
        onTriggered: windowRoot.hide()
    }

    TextConstants {
        id: textConstants
    }

    SystemTrayIcon {
        objectName: "trayIcon";
        id: trayIcon;
        visible: true
        icon.source: "qrc:/assets/icon.png"
        signal message(msg: string);
        onActivated: {
            if(reason === SystemTrayIcon.Trigger) {
                if(windowRoot.visible === true) {
                    windowRoot.hide()
                } else {
                    windowRoot.show()
                    windowRoot.raise()
                    windowRoot.requestActivate()
                }
            }
        }

        menu: Menu {
            MenuItem {
                text: textConstants.toggle_playback;
                onTriggered: trayIcon.message("toggle_playback");
            }
            MenuItem {
                text: textConstants.settings;
                onTriggered: {
                    windowRoot.show()
                    windowRoot.raise()
                }
            }
            MenuItem {
                text: textConstants.exit;
                onTriggered: Qt.quit()
            }
        }
    }

    Column {

        id: settingsMenu
        anchors.fill: parent

        Text {
            id: textArea
            width: 300
            height: 70
            color: "lightgrey"
            text: "Settings"
            topPadding: 10
            anchors.leftMargin: (windowRoot.width - keyboard.width) / 2
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.left: parent.left
            font.weight: Font.Bold
            font.letterSpacing: 6
            font.pointSize: 21
            font.family: "Consolas"
        }

        KeyboardLayout_EU_QWERTY {
            id: keyboard
            spacing: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }



    Settings {
        id: winPosSettings
        category: "WindowPosition"
        property alias x: windowRoot.x
        property alias y: windowRoot.y
        property alias width: windowRoot.width
        property alias height: windowRoot.height
    }
    Settings {
        id: keybindSettings
        objectName: "keybindSettings"

        category: "Keybinds"
        property int toggle; // Qt::Key
        property int fastFwd; // Qt::Key
        property int reverse; // Qt::Key
        property int next; // Qt::Key
        property int prev; // Qt::Key
        property int volUp; // Qt::Key
        property int volDn; // Qt::Key

        signal settingsChanged();

        onToggleChanged: settingsChanged();
        onFastFwdChanged: settingsChanged();
        onReverseChanged: settingsChanged();
        onNextChanged: settingsChanged();
        onPrevChanged: settingsChanged();
        onVolUpChanged: settingsChanged();
        onVolDnChanged: settingsChanged();
    }

    Hotkeys {
        id: hotkeys
        objectName: "hotkeys";
    }


}


