const ENUM_PLAYBACKSTATE_NONE = 0,
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
    getPlaybackState(function (state) {
        if (state == ENUMLEN_PLAYBACKSTATE_ANY) {
            getPlayingTabs(pause);
        }
        if (state == ENUM_PLAYBACKSTATE_NONE) {
            getPinnedTab(play);
        }
    });
}