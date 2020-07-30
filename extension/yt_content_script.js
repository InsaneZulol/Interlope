// remember these console.log() messages will be visible in DOM console, not extension console.

let vid = document.querySelector('video');

chrome.runtime.connect().onDisconnect.addListener(function () {
    chrome.runtime.sendMessage("content_script_disconnected");
    // clean up when content script gets disconnected...
});

// Message we use to launch native connection on content script load
chrome.runtime.sendMessage("content_script_load", function () {
    if (chrome.runtime.lastError) {
        console.log("error during sendMessage(content_script_load) from contentscript: "
            + chrome.runtime.lastError.message);
    }
});


// Output to extension scripts from this content script
// 
vid.addEventListener('pause', () => {
    chrome.runtime.sendMessage("player_paused", function () {
        if (chrome.runtime.lastError) {
            console.log("error during sendMessage from contentscript: "
                + chrome.runtime.lastError.message);
        }
    });
});

vid.addEventListener('play', () => {
    chrome.runtime.sendMessage("player_resumed", function () {
        if (chrome.runtime.lastError) {
            console.log("error during sendMessage from contentscript: "
                + chrome.runtime.lastError.message);
        }
    });
});
//
// EOF Output

// Input from extension scripts to this content script
//
chrome.runtime.onMessage.addListener((msg, sender, response) => {
    try {
        switch (msg.action) {
            case 'toggle_playback':
                {
                    console.log("In cs. Msg is: " + msg.action);
                    togglePlayback();
                    response("toggled playback");
                    break;
                }
                case 'fast_forward':
                {
                    console.log("In cs. Msg is: " + msg.action);
                    fastForward();
                    response("skipped 15sec");
                    break;
                }
                case 'reverse_playback':
                {
                    console.log("In cs. Msg is: " + msg.action);
                    reverse();
                    response("reversed 15sec");
                    break;
                }
            case 'volume_up':
                {
                    console.log("In cs. Msg is: " + msg.action);
                    increaseVolume();
                    response("increased volume");
                    break;
                }
            case 'volume_dn':
                {
                    console.log("In cs. Msg is: " + msg.action);
                    decreaseVolume(response);
                    response("decreased volume");
                    break;
                }
            case 'next_media':
                {
                    console.log("In cs. Msg is: " + msg.action);
                    skip();
                    response("skipped");
                    break;
                }
            case 'prev_media':
                {
                    console.log("In cs. Msg is: " + msg.action);
                    // skip();
                    response("back");
                    break;
                }
            default:
                console.log("Unknown message");

        }
    } catch (e) {
        response(e);
    }
    return true;
});
//
// EOF Input

function isPaused() {
    return vid.paused;
}

function togglePlayback() {
    let state = isPaused();
    if (state == true) {
        vid.play();
    }
    else {
        vid.pause();
    }
}

function increaseVolume() {
    vid.volume += 0.02;
}

function decreaseVolume() {
    vid.volume -= 0.02;
}

function fastForward() {
    vid.currentTime += 15;
}

function reverse() {
    vid.currentTime -= 15;
}

function skip() {
    vid.currentTime = vid.duration - 1;
}