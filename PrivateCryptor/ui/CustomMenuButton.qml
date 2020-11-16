import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtGraphicalEffects 1.15

Item {
    id: customMenuButton

    property string textOnButton
    property string imageSourceButton

    RoundButton {
        id: menuButton
        opacity: 0.4
        radius: 24
        highlighted: menuButton.hovered
        anchors.fill: parent

        onClicked: {
            if(textOnButton != "") {
                navigate(textOnButton)
            } else if(imageSourceButton != "") {
                navigate("Back")
            }
        }
    }

    Text {
        opacity: 0.7

        font.pointSize: 14
        color: "white"
        text: textOnButton
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WrapAnywhere

        anchors.fill: menuButton
        anchors.margins: 12
    }

    Image {
        id: appCreatorLogo
        anchors.fill: parent
        anchors.margins: 6

        source: imageSourceButton
        fillMode: Image.PreserveAspectFit
        asynchronous: true
        sourceSize.height: height
        sourceSize.width: width
        antialiasing: true
        smooth: true
        mipmap: true
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
