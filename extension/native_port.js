var NATIVEPORT = (function () {
    var _native_connection_status = false;
    var _port;

    function _connectToNativeClient() {
        if (!_native_connection_status) {
            _port = chrome.runtime.connectNative('io.alan_kaluza.interlope');
            _native_connection_status = true;

            _port.onMessage.addListener(function (msg) {
                console.log("Received " + msg.action);
                // relay the message to content script
                MESSENGER.requestAction(msg.action);
            });

            _port.onDisconnect.addListener((p) => {
                _native_connection_status = false;
                console.log("Native client disconnected");
                if (p.error) {
                    console.log(`due to an error: ${p.error.message}`);
                }
            });
        }
    }

    function _sendMessageToClient(msg) {
        _port.postMessage({ text: msg });
    }
    
    chrome.runtime.onInstalled.addListener(function (res) {
        _connectToNativeClient();
    });

    // Handle messages from yt_content_script
    chrome.runtime.onMessage.addListener((msg) => {
        if (msg == "content_script_load") {
            _connectToNativeClient();
        }
        return true;
    });
    return {
        sendMessageToClient : _sendMessageToClient,
    }
})();