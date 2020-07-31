var MESSENGER = (function () {
    // sends message to content script
    function _requestAction(req_action) {
        chrome.tabs.query({ pinned: true }, function (tabs) {
            if (tabs.length != 0) {
                chrome.tabs.sendMessage(tabs[0].id, { action: req_action }, function (response) {
                    if (chrome.runtime.lastError) {
                        console.warn("Whoops.. error sending message to content script"
                            + chrome.runtime.lastError.message);
                        if (chrome.runtime.lastError.message ==
                            "Could not establish connection. Receiving end does not exist.")
                            alert("Refresh the pinned Youtube Tab");
                    } else {
                        console.log(response)
                    }

                });
            }
        });
    }
    return {
        requestAction: _requestAction,
    };
})();