import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Selphy CP 1200 Printer")


    id: principalForm
    Rectangle  {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: printButton.top
        anchors.margins: 10
        color: "lightgrey"
        border.color: "black"

        ListModel  {
            id: photoModel

        }

        DropArea  {
            anchors.fill: parent
            onDropped:  {
                if (drop.hasUrls) {

                    photoModel.append({
                                          'Url': drop.urls[0]
                                      })
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
            width: selectedImages.width - 10
            height: 100
            color: "lightgrey"

            Image {
               anchors.fill: parent
                id: name
                source: Url
                anchors.left: parent.left
                anchors.margins: 5
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}
