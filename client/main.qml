import QtQuick 2.15
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import Qt.labs.platform 1.1
import Qt.labs.settings 1.0
import "qml_keyboard_layouts"

ApplicationWindow {
    id: windowRoot
    visible: true
    title: qsTr("Interlope")
    
    width: 640
    height: 480
    color: "#252526"
    onClosing: {
        close.accepted = false
        onTriggered: windowRoot.hide()
    }

    KeyboardLayout_EU_QWERTY {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    SystemTrayIcon {
        visible: true
        iconSource: "qrc:/icon.png"
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
                text: qsTr("Toggle playback")
            }
            MenuItem {
                text: qsTr("Settings...")
                onTriggered: {
                    windowRoot.show()
                    windowRoot.raise()
                }
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit()
            }
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
        category: "Keybinds"
        property string action_toggleKey
        property var action_nextKeys: [];

    }
}
