// todo: show context menu only when there is yt in bg
chrome.runtime.onInstalled.addListener(function() {

    chrome.contextMenus.create({
      id: "contextMenu",
      title: "Pause all",
      contexts: ["all"]
    });
  });

chrome.contextMenus.onClicked.addListener(contextClickHandler);

function contextClickHandler(info, tab) {
    getPlaybackState(function(state) {
        if(state == ENUMLEN_PLAYBACKSTATE_ANY) {
            getPlayingTabs(pause);
        }
        if(state == ENUM_PLAYBACKSTATE_NONE) {
            getPinnedTab(play);
        }
    });
}

function onPause() {
    chrome.contextMenus.update("contextMenu", {
        title: "Resume in pinned tab", 
    });
}

function onPlay() {
    chrome.contextMenus.update("contextMenu", {
        title: "Pause all", 
    });
}