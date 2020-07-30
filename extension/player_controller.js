

// sends message to content script
function requestAction(req_action) {
    chrome.tabs.query({ pinned: true }, function (tabs) {
        chrome.tabs.sendMessage(tabs[0].id, { action: req_action}, function (response) {
            if (chrome.runtime.lastError) {
                console.warn("Whoops.. error sending message in "
                    + "sendTogglePlayback " + chrome.runtime.lastError.message);
            } else {
                //console.log(response)
            }

        });
    });
}