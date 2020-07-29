const ENUM_PLAYBACKSTATE_NONE = 0,
    ENUMLEN_PLAYBACKSTATE_ANY = 1;

let playbackState = ENUM_PLAYBACKSTATE_NONE;

function pause(tab) {
    chrome.tabs.executeScript(
        tab.id,
        { code: "document.querySelector('video').pause();" },
        () => {
            if (chrome.runtime.lastError) {
                console.error('tab: ' + tab.id + ' lastError: ' + JSON.stringify(chrome.runtime.lastError));
            } else {
                onPause(); // this just updates context menu for now
            }
        });
}

function play(tab) {
    chrome.tabs.executeScript(
        tab.id,
        { code: "document.querySelector('video').play();" },
        () => {
            if (chrome.runtime.lastError) {
                console.error('tab: ' + tab.id + ' lastError: ' + JSON.stringify(chrome.runtime.lastError));
            } else {
                onPlay(); // this just updates context menu for now
            }
        });
}

// returns enum value ENUM_PLAYBACKSTATE_NONE / ENUMLEN_PLAYBACKSTATE_ANY
// through the callback.
//
// this query sucks, chrome has delay on audible status.
// Later on change that to sendMessage to content script and
// get the players state from it's response.
function getPlaybackState(callback) {
    chrome.tabs.query({ audible: true }, function (qTabs) {
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

function togglePlayback() {
    connectToNativeClient(); // retry to startup host app. TODO: Move it out of here.
    getPlaybackState(function (state) {
        if (state == ENUMLEN_PLAYBACKSTATE_ANY) {
            getPlayingTabs(pause);
        }
        if (state == ENUM_PLAYBACKSTATE_NONE) {
            getPinnedTab(play);
        }
    });
}