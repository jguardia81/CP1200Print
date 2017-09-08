import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Selphy CP 1200 Printer")
    signal qmlSignal(var anObject)

    id: principalForm
    Rectangle  {
        id: myRect
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: printButton.top
        anchors.margins: 10
        color: "lightgrey"
        border.color: "black"
        property bool busy: false


        ListModel  {
            id: photoModel
            objectName: "photoModel"
        }

        BusyIndicator {
            running: myRect.busy === true
        }
        DropArea  {

            anchors.fill: parent
            onDropped:  {


                if (drop.hasUrls) {

                    myRect.busy = true
                    for (var index = 0; index < drop.urls.length; index++) {
                        photoModel.append({
                                              'Url': drop.urls[index]
                                          })
                    }

                    myRect.busy = false
                }
            }

            ListView {
                visible: true
                id: selectedImages
                model: photoModel
                anchors.fill: parent
                delegate: myDelegate
            }
        }
    }
    Button {
        visible: true
        id:printButton
        text: qsTr("Print")
        anchors.right: quitButton.left
        anchors.bottom: parent.bottom
        anchors.margins: 10
        onClicked: {
            qmlSignal(photoModel)
        }
    }

    Button {
        visible: true
        id:quitButton
        text: qsTr("Quit")
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 10
        onClicked: {
            Qt.quit()
        }
    }
    Component {
        id: myDelegate

        Rectangle {
            border.color: "black"
            width: selectedImages.width
            height: 100
            color: "lightgrey"

            Image {

                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                id: photo
                source: Url

                anchors.margins: 5
                fillMode: Image.PreserveAspectFit
            }
            Text {
                text:Url
                anchors.left: photo.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.margins: 10
                verticalAlignment: Text.AlignVCenter
                wrapMode:  Text.WrapAtWordBoundaryOrAnywhere
            }
        }
    }
}
