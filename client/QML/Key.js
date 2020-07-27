// Clears every action with the same setting 'key' as the Key that called it.
function clearAllBindings() {
    let s = keybindSettings;
    if(s.toggle === button.key) s.toggle = 0;
    if(s.fastFwd === button.key) s.fastFwd = 0;
    if(s.reverse === button.key) s.reverse = 0;
    if(s.next === button.key) s.next = 0;
    if(s.prev === button.key) s.prev = 0;
    if(s.volUp === button.key) s.volUp = 0;
    if(s.volDn === button.key) s.volDn = 0;
}

function tryLabel(sett_val, label) {
    if(sett_val === button.key)
        button.actionLabel = label;
}

function refresh() {
    if (!(getSettingsList().includes(button.key))) {
        button.actionLabel = qsTr("");
    }
}


function getSettingsList() {
    let s = keybindSettings;
    let settsList = [s.toggle, s.fastFwd,
                     s.reverse, s.next,
                     s.prev, s.volUp,
                     s.volDn];
    return settsList;
}
