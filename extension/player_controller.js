const ENUM_PLAYBACKSTATE_NONE   = 0,
ENUMLEN_PLAYBACKSTATE_ANY = 1;

let playbackState = ENUM_PLAYBACKSTATE_NONE;

function pause(tab) {
    chrome.tabs.executeScript(
        tab.id,
        { code: "document.querySelector('video').pause();" },
        onPause
    );
}

function play(tab) {
    chrome.tabs.executeScript(
        tab.id,
        { code: "document.querySelector('video').play();" },
        onPlay
    );

}

// returns enum value ENUM_PLAYBACKSTATE_NONE / ENUMLEN_PLAYBACKSTATE_ANY
// through the callback.
function getPlaybackState(callback) {
    chrome.tabs.query({ currentWindow: true, audible: true }, function (qTabs) {
        if (qTabs.length == 0) { 
            playbackState = ENUM_PLAYBACKSTATE_NONE;
            callback(playbackState);
        }
        else {
            playbackState = ENUMLEN_PLAYBACKSTATE_ANY;
            callback(playbackState);
        }
    });
}
