var contextItemTitle = "Pause all";
// todo: add context menu only when there are streams/yt in bg
chrome.runtime.onInstalled.addListener(function() {

    chrome.contextMenus.create({
      id: "contextMenu",
      title: contextItemTitle,
      contexts: ["all"]
    });
  });

chrome.contextMenus.onClicked.addListener(contextClickHandler);

function contextClickHandler(info, tab) {
    
    getPlayingTabs(pause);
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