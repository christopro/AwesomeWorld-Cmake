import QtQuick
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Text{
        anchors.fill:parent
        font.pixelSize: 24
        text: "Hello Beautifull World!"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

}
