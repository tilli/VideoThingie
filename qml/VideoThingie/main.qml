import QtQuick 1.0
//import QtMultimediaKit 1.1
import com.nokia.meego 1.0
import VideoThingie 1.0

PageStackWindow {

    function loadVideo(url) {
        // Fetch data from source
        var xhr = new XMLHttpRequest;
        xhr.open("GET", url);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                var responseJson = JSON.parse(xhr.responseText);
                if (responseJson.data) {
                    var items = responseJson.data.items || [];
                    var url;
                    if (items.length === 1) {
                        url = items[0].content["1"];
                    } else {
                        if (responseJson.data.content) {
                            url = responseJson.data.content["1"];
                        }
                    }
                    launcher.launchVideo(url)
                    // video.source = url;
                }
            }
        }
        xhr.send();
    }

    // Fetch content in JSON-C format (see http://code.google.com/apis/youtube/2.0/developers_guide_jsonc.html)
    Component.onCompleted: loadVideo("https://gdata.youtube.com/feeds/api/videos/HJCynM0hsN4?v=2&alt=jsonc")

    // Embedded video player would need custom UI controls
//    Video {
//        id: video
//        anchors.fill: parent
//        Component.onCompleted: play();

//        MouseArea {
//            anchors.fill: parent
//            onClicked: video.paused = !video.paused
//        }
//    }

    // System video player, launched via C++ QDesktopServices::openUrl() is simpler
    VideoLauncher {
        id: launcher
    }

}
