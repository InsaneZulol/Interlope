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

// i think this gets called each time tab_controller is loaded. Test. 
var port = chrome.runtime.connectNative('io.alan_kaluza.interlope');
port.onMessage.addListener(function(msg) {
  console.log("Received" + msg.action);
  if(msg.action == "toggle_playback") {
      togglePlayback();
  }
});
port.onDisconnect.addListener(function() {
  console.log("Disconnected");
});
// port.postMessage({ text: "Hello, my_application" });