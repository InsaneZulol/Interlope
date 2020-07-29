// todo: show context menu only when there is yt in bg
chrome.contextMenus.onClicked.addListener(contextClickHandler);

chrome.runtime.onInstalled.addListener(function () {
    chrome.contextMenus.create({
        id: "contextMenu",
        title: "\u2759\u2759 Pause all",
        contexts: ["all"]
    });
});

// Handle messages from yt_content_script
chrome.runtime.onMessage.addListener((msg, sender, response) => {
    console.log("message arrived!: " + msg);
    if (msg == "play") {
        onPlay();
    }
    if (msg == "pause") {
        onPause();
    }
});

function contextClickHandler(info, tab) {
    togglePlayback();
}

function onPause() {
    chrome.contextMenus.update("contextMenu", {
        title: "\u25B6 Resume in pinned tab",
    });
}

function onPlay() {
    chrome.contextMenus.update("contextMenu", {
        title: "\u2759\u2759 Pause all",
    });
}