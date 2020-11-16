import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

import encryptionProcess 1.0

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("PrivateCryptor")

    BackGround {
        z: -1
        id: backGround
    }

    EncryptionProcess {
        id: encryptionProcess
    }

    property double backgroundOpacity: 0.3
    property string backgroundLightColor: "#CCC4EB"

    function navigate(page) {
        if (page === "Encrypt Text") {
            pageStackView.replace(encryptTextPage)
        } else if (page === "Decrypt Text") {
            pageStackView.replace(decryptTextPage)
        } else if (page === "Encrypt File") {
            pageStackView.replace(encryptFilePage)
        } else if (page === "Decrypt File") {
            pageStackView.replace(decryptFilePage)
        } else if (page === "Back") {
            pageStackView.replace(mainPage)
        }
    }

    StackView {
        id: pageStackView
        initialItem: mainPage

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: appCreatorInformation.top
        anchors.margins: 15

        replaceEnter: Transition {
            OpacityAnimator  {
                from: 0.0
                to: 1.0
                duration: 12000
            }
        }

        replaceExit: Transition {
            OpacityAnimator  {
                from: 1.0
                to: 0.0
                duration: 12000
            }
        }
    }

    MainPage {
        id: mainPage
        visible: (pageStackView.currentItem === mainPage) ? true : false
    }

    EncryptTextPage {
        id: encryptTextPage
        visible: (pageStackView.currentItem === encryptTextPage) ? true : false
    }

    Page {
        id: decryptTextPage
        visible: (pageStackView.currentItem === decryptTextPage) ? true : false
    }

    Page {
        id: encryptFilePage
        visible: (pageStackView.currentItem === encryptFilePage) ? true : false
    }

    Page {
        id: decryptFilePage
        visible: (pageStackView.currentItem === decryptFilePage) ? true : false
    }

    CustomMenuButton {
        id: customMenuButton
        width: 35
        height: 35
        imageSourceButton: "qrc:/images/images/menu/backArrow.svg"
        visible: (pageStackView.currentItem !== mainPage) ? true : false

        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 15
        anchors.bottomMargin: 10
    }

    AppCreatorInformation {
        id: appCreatorInformation
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.rightMargin: 15
    }

}

/*##^##
Designer {
    D{i:0;globalAnnotation:"1 //;;//  //;;//  //;;// <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html> //;;// 1605349901"}
D{i:12}
}
##^##*/
