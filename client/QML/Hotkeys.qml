import QtQuick 2.0
import de.skycoder42.QHotkey 1.0
import "Hotkeys.js" as Hotkey
Item {
    signal message(msg: string);
    QHotkey {
        objectName: "toggleHotkey";
        id: toggleHotkey;
        shortcut: Qt.Key_unknown;
        registered: false;
        onActivated: message("toggle_playback");
        Component.onCompleted: {
            Hotkey.register(this, keybindSettings.toggle);
        }
    }

    QHotkey {
        objectName: "fastFwdHotkey";
        id: fastFwdHotkey;
        shortcut: Qt.Key_unknown;
        registered: false;
        onActivated: message("fast_forward");
        Component.onCompleted: {
            Hotkey.register(this, keybindSettings.fastFwd);
        }
    }

    QHotkey {
        objectName: "reverseHotkey";
        id: reverseHotkey;
        shortcut: Qt.Key_unknown;
        registered: false;
        onActivated: message("reverse_playback");
        Component.onCompleted: {
            Hotkey.register(this, keybindSettings.reverse);
        }
    }

    QHotkey {
        objectName: "nextHotkey";
        id: nextHotkey;
        shortcut: Qt.Key_unknown;
        registered: false;
        onActivated: message("next_media");
        Component.onCompleted: {
            Hotkey.register(this, keybindSettings.next);
        }
    }

    QHotkey {
        objectName: "prevHotkey";
        id: prevHotkey;
        shortcut: Qt.Key_unknown;
        registered: false;
        onActivated: message("previous_media");
        Component.onCompleted: {
            Hotkey.register(this, keybindSettings.prev);
        }
    }

    QHotkey {
        objectName: "volUpHotkey";
        id: volUpHotkey;
        shortcut: Qt.Key_unknown;
        registered: false;
        onActivated: message("volume_up");
        Component.onCompleted: {
            Hotkey.register(this, keybindSettings.volUp);
        }
    }

    QHotkey {
        objectName: "volDnHotkey";
        id: volDnHotkey;
        shortcut: Qt.Key_unknown;
        registered: false;
        onActivated: message("volume_dn");
        Component.onCompleted: {
            Hotkey.register(this, keybindSettings.volDn);
        }
    }

    Connections {
        target: keybindSettings;

        function onToggleChanged() {
            let new_shortcut = keybindSettings.toggle;
            if(new_shortcut !== 0)
                Hotkey.register(toggleHotkey, new_shortcut)
            else
                Hotkey.unregister(toggleHotkey, new_shortcut)
        }

        function onFastFwdChanged() {
            let new_shortcut = keybindSettings.fastFwd;
            if(new_shortcut !== 0)
                Hotkey.register(fastFwdHotkey, new_shortcut)
            else
                Hotkey.unregister(fastFwdHotkey, new_shortcut)
        }

        function onReverseChanged() {
            let new_shortcut = keybindSettings.reverse;
            if(new_shortcut !== 0)
                Hotkey.register(reverseHotkey, new_shortcut)
            else
                Hotkey.unregister(reverseHotkey, new_shortcut)
        }

        function onNextChanged() {
            let new_shortcut = keybindSettings.next;
            if(new_shortcut !== 0)
                Hotkey.register(nextHotkey, new_shortcut)
            else
                Hotkey.unregister(nextHotkey, new_shortcut)
        }

        function onPrevChanged() {
            let new_shortcut = keybindSettings.prev;
            if(new_shortcut !== 0)
                Hotkey.register(prevHotkey, new_shortcut)
            else
                Hotkey.unregister(prevHotkey, new_shortcut)
        }

        function onVolUpChanged() {
            let new_shortcut = keybindSettings.volUp;
            if(new_shortcut !== 0)
                Hotkey.register(volUpHotkey, new_shortcut)
            else
                Hotkey.unregister(volUpHotkey, new_shortcut)
        }

        function onVolDnChanged() {
            let new_shortcut = keybindSettings.volDn;
            if(new_shortcut !== 0)
                Hotkey.register(volDnHotkey, new_shortcut)
            else
                Hotkey.unregister(volDnHotkey, new_shortcut)
        }
    }

}
