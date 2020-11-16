import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

Item {
    property int customMargin: 15
    property int informationItemHeight: 18

    property string gradientColorOne: "#4F37A2"
    property string gradientColorTwo: "#45318E"
    property string gradientColorThree: "#332468"

    id: appCreatorInformation
    height: 30
    width: appCreatorLogo.implicitWidth + appCreatorText.implicitWidth + customMargin

    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: backgroundLightColor
        opacity: backgroundOpacity
        radius: 8
    }

    Image {
        id: appCreatorLogo
        width: informationItemHeight
        height: informationItemHeight

        source: "qrc:/images/images/logo/icon.svg"
        fillMode: Image.PreserveAspectFit
        asynchronous: true
        sourceSize.height: informationItemHeight
        sourceSize.width: informationItemHeight
        antialiasing: true
        smooth: true
        mipmap: true

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.rightMargin: 5
    }

    Text {
        id: appCreatorText
        height: informationItemHeight
        textFormat: Text.MarkdownText
        color: gradientColorOne
        linkColor: "white"
        text: qsTr("Made by [PrivateWeb Community](https://privateweb.software)")
        font.pixelSize: 12

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: appCreatorLogo.right
        anchors.right: parent.right
        anchors.leftMargin: 5
        anchors.rightMargin: 5

        onLinkActivated: {
            Qt.openUrlExternally(link)
        }

        LinearGradient {
            anchors.fill: appCreatorText
            source: appCreatorText
            start: Qt.point(appCreatorText.width, 0)
            end: Qt.point(0, appCreatorText.height)

            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    /*
                            Palete One: #4F37A2, #45318E, #332468,
                    */
                    SequentialAnimation on color {
                        loops: Animation.Infinite
                        ColorAnimation { from: gradientColorOne; to: gradientColorTwo; duration: 5000 }
                        ColorAnimation { from: gradientColorTwo; to: gradientColorThree; duration: 5000 }
                        ColorAnimation { from: gradientColorThree; to: gradientColorOne; duration: 5000 }
                    }
                }
            }
        }
    }
}
