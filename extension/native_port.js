var native_connection_status = false;

chrome.runtime.onInstalled.addListener(function () {
    connectToNativeClient();
});

function connectToNativeClient() {
    if (!native_connection_status) {        
        var port = chrome.runtime.connectNative('io.alan_kaluza.interlope');
        native_connection_status = true;

        port.onMessage.addListener(function (msg) {
            console.log("Received " + msg.action);
            if (msg.action == "toggle_playback") {
                togglePlayback();
            }
        });

        port.onDisconnect.addListener((p) => {
            native_connection_status = false;
            console.log("Disconnected");
            if (p.error) {
                console.log(`due to an error: ${p.error.message}`);
            }
        });
    }
    // port.postMessage({ text: "Hello, my_application" });

}