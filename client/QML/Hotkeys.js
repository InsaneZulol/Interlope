
function register(target, key) {
    if(key !== 0) {
        console.log("set shortcut to: " + key)
        target.setShortcut(key, true);
    }
}

function unregister(target, key) {
    if(key === 0) {
        console.log("unregistering hotkey: " + target + " " + key)
        target.setShortcut(Qt.Key_unknown, true);
    }
}
