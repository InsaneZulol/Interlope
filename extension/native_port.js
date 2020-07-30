var native_connection_status = false;

chrome.runtime.onInstalled.addListener(function (res) {
    connectToNativeClient();
});

// Handle messages from yt_content_script
chrome.runtime.onMessage.addListener((msg) => {
    if (msg == "content_script_load") {
        connectToNativeClient();
    }
    return true;
});



function connectToNativeClient() {
    if (!native_connection_status) {
        var port = chrome.runtime.connectNative('io.alan_kaluza.interlope');
        native_connection_status = true;

        port.onMessage.addListener(function (msg) {
            console.log("Received " + msg.action);
            // relay the message to content script
            requestAction(msg.action);
        });

        port.onDisconnect.addListener((p) => {
            native_connection_status = false;
            console.log("Native client disconnected");
            if (p.error) {
                console.log(`due to an error: ${p.error.message}`);
            }
        });
    }
    // port.postMessage({ text: "Hello, my_application" });

}