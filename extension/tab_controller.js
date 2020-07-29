// returns furthermost left pinned tab.
function getPinnedTab(callback) {
    chrome.tabs.query({ currentWindow: true, pinned: true }, function (qTabs) {
        callback(qTabs[0]);
    });
}

// retuns each playing tab through the callback.
function getPlayingTabs(callback) {
    chrome.tabs.query({ currentWindow: true, audible: true }, function (qTabs) {
        qTabs.forEach(function (tab) {
            callback(tab);
        });
    })
}
