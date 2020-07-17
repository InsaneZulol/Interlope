import QtQuick 2.0

Rectangle {
    id: root
    property string caption: "..."
    width: parent.height;
    height: parent.height;
    border.color: "black";
    color: "white";
    radius: 5;
    border.width: 2;
    Text {
        text: caption;
        color: "black";
        font.bold: false;
        anchors.fill: parent
        font.pixelSize: parent.height/5 // maximum height of the font
        minimumPixelSize: 4 // minimum height of the font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: root.keyClicked()
    }

    signal keyClicked();

}
