import QtQuick 2.9
import QtQuick.Window 2.2
import Qt.labs.platform 1.1

SystemTrayIcon {
    visible: true
    icon.source: "qrc:/icon.png"

    onActivated: {
        window.show()
        window.raise()
        window.requestActivate()
    }

    menu: Menu {
        MenuItem {
            text: qsTr("Shutdown")
            onTriggered: Qt.quit()
        }
    }
}