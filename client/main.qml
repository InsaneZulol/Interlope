import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import Qt.labs.platform 1.1
import Qt.labs.settings 1.0


ApplicationWindow {
    id: windowRoot
    visible: false
    title: qsTr("Interlope")
    width: 640
    height: 480
    color: "silver"
    onClosing: {
        close.accepted = false
        onTriggered: windowRoot.hide()
    }

    SystemTrayIcon {
        visible: true
        iconSource: "qrc:/icon.png"
        // toggle show/hide main window
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
                    // todo: goto settings tab
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
        category: "Keybinds"
    }
}
