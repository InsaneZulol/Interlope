var playerTabId = 129; // tab designated for play() action;
var playbackState;

function pause(tab) {
    console.log("pausing...");
    chrome.tabs.executeScript(
        tab.id,
        {code: "document.querySelector('video').pause();" },
        onPause
    );
}

function play(tab) {
    //getPinnedTab();
    console.log("playerTabId: " + tab.id);
    chrome.tabs.executeScript(
        tab.id,
        {code: "document.querySelector('video').play();" },
        onPlay
    );

 }

// function getPlaybackState()
// check all tabs, if any playing return true;
//                 if none playing return false


function getPinnedTab(callback) {
    chrome.tabs.query({currentWindow: true, pinned: true}, function(qTabs) {
        console.log("pinned tab id: " + qTabs[0].id)
        callback(qTabs[0]);
    });
}

function getPlayingTabs(callback) {
    chrome.tabs.query({currentWindow: true, audible: true}, function(qTabs) {
        qTabs.forEach(function(tab) {
            callback(tab);
        });
    });
}
