import QtQuick 2.0

Item {
    width: (windowRoot.width * sizeRatio) * aspectRatio
    height: (windowRoot.width * sizeRatio)

    property real aspectRatio: 1;
    property real sizeRatio: 0.04;
}
