var UICONTROLLER = (function () {
    // Context menu
    //
    chrome.contextMenus.onClicked.addListener(_contextClickHandler);
    chrome.runtime.onInstalled.addListener(function () {
        chrome.contextMenus.create({
            id: "contextMenu",
            title: "\u2759\u2759 Pause all",
            contexts: ["all"]
        });
    });

    // React to messages from yt_content_script
    chrome.runtime.onMessage.addListener((msg) => {
        if (msg == "player_resumed") {
            chrome.contextMenus.update("contextMenu", {
                title: "\u2759\u2759 Pause",
            });
        }
        if (msg == "player_paused") {
            chrome.contextMenus.update("contextMenu", {
                title: "\u25B6 Resume",
            });
        }
        return true;
    });

    function _contextClickHandler(info, tab) {
        MESSENGER.requestAction("toggle_playback");
        NATIVEPORT.sendMessageToClient("Hello, client");
    }
    //
    // EOF Context menu
})();