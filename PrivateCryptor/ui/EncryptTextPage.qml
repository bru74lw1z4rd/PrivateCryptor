import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Dialogs 1.3

Page {
    id: encryptTextPage

    MessageDialog {
        id: errorMessageDialog
        title: "Oops!"
    }

    background: Rectangle {
        color: backgroundLightColor
        opacity: backgroundOpacity
        radius: 8
    }

    property int itemLeftMargin: 20
    property int itemTopBottomMargin: 30
    property int itemDefaultMargin: 35

    function checkForEmptyFields() {
        if(encryptionAlgorithmComboBox.currentText !== "AES - GCM" && encryptionAlgorithmComboBox.currentText !== "AES - CCM") {
            if (aesKeyField.length < 12) {
                errorMessageDialog.text = "AES Key Field mustn't be empty or less then 12."
                errorMessageDialog.open()
                return true;
            } else if (roundsField <= 0) {
                errorMessageDialog.text = "Rounds Field mustn't be empty!"
                errorMessageDialog.open()
                return true;
            } else if (randomDeltaField.length < 8) {
                errorMessageDialog.text = "Random Delta Field mustn't be empty or less then 8."
                errorMessageDialog.open()
                return true;
            }
        }
        return false;
    }

    function isGcm() {
        if(encryptionAlgorithmComboBox.currentText === "AES - GCM") {
            return true
        } else {
            return false
        }
    }

    ScrollView {
        clip: true

        anchors.fill: parent

        contentWidth: firstColumn.implicitWidth + secondColumn.implicitWidth + thirdColumn.implicitWidth + (encryptTextPage.width - (firstColumn.implicitWidth + secondColumn.implicitWidth + thirdColumn.implicitWidth))

        ScrollBar.horizontal.policy: ScrollBar.AsNeeded
        ScrollBar.vertical.policy: ScrollBar.AsNeeded

        RowLayout {
            anchors.fill: parent

            ColumnLayout {
                id: firstColumn

                width: stepFiveText.implicitWidth + itemDefaultMargin
                Layout.alignment: Qt.AlignTop | Qt.AlignLeft

                Column {
                    id: stepOneSectionColumn

                    spacing: 10

                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.leftMargin: itemLeftMargin
                    Layout.topMargin: itemTopBottomMargin

                    Text {
                        id: stepOneText

                        text: qsTr("Step 1. Choose encryption algorithm.")
                        color: "white"
                        font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                    }

                    ComboBox {
                        id: encryptionAlgorithmComboBox

                        textRole: "text"
                        valueRole: "value"

                        model: ListModel {
                            ListElement {
                                text: "AES - ECB"
                            }

                            ListElement {
                                text: "AES - CBC"
                            }

                            ListElement {
                                text: "AES - CFB"
                            }

                            ListElement {
                                text: "AES - OFB"
                            }

                            ListElement {
                                text: "AES - CTR"
                            }

                            ListElement {
                                text: "AES - CCM"
                            }

                            ListElement {
                                text: "AES - GCM"
                            }
                        }
                    }
                }

                Column {
                    id: stepTwoSectionColumn

                    spacing: 10

                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.leftMargin: itemLeftMargin
                    Layout.topMargin: itemTopBottomMargin

                    Text {
                        id: stepTwoText

                        color: "#ffffff"
                        text: qsTr("Step 2. Choose block size.")
                        font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                    }

                    ComboBox {
                        id: blockSizeComboBox

                        textRole: "text"
                        valueRole: "value"

                        model: ListModel {
                            ListElement {
                                text: "128"
                            }

                            ListElement {
                                text: "192"
                            }

                            ListElement {
                                text: "256"
                            }
                        }
                    }
                }

                Column {
                    id: stepThreeSectionColumn

                    spacing: 10

                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.leftMargin: itemLeftMargin
                    Layout.topMargin: itemTopBottomMargin

                    Text {
                        id: stepThreeText

                        color: "#ffffff"
                        text: qsTr("Step 3. Choose hash algorithm.")
                        font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                    }

                    ComboBox {
                        id: hashAlgorithmComboBox

                        textRole: "text"
                        valueRole: "value"

                        model: ListModel {
                            ListElement {
                                text: "SHA-254"
                            }

                            ListElement {
                                text: "SHA-256"
                            }

                            ListElement {
                                text: "SHA-384"
                            }

                            ListElement {
                                text: "SHA-512"
                            }

                            ListElement {
                                text: "SHA-3-224"
                            }

                            ListElement {
                                text: "SHA-3-256"
                            }

                            ListElement {
                                text: "SHA-3-384"
                            }

                            ListElement {
                                text: "SHA-3-512"
                            }
                        }
                    }
                }

                Column {
                    id: stepFourSectionColumn

                    spacing: 10

                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.leftMargin: itemLeftMargin
                    Layout.topMargin: itemTopBottomMargin

                    Text {
                        id: stepFourText
                        color: "#ffffff"
                        text: qsTr("Step 4. Enter AES Key.")
                        font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                    }

                    TextField {
                        id: aesKeyField
                        placeholderText: qsTr("Enter AES Key")
                    }
                }

                Column {
                    id: stepFiveSectionColumn

                    spacing: 10

                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.leftMargin: itemLeftMargin
                    Layout.topMargin: itemTopBottomMargin
                    Layout.bottomMargin: itemTopBottomMargin

                    Text {
                        id: stepFiveText
                        color: "#ffffff"
                        text: (encryptionAlgorithmComboBox.currentText === "AES - GCM" || encryptionAlgorithmComboBox.currentText === "AES - CCM") ? qsTr("Step 5. Enter Initialization Vector.") : qsTr("Step 5. Enter Initialization Vector. (Optional)")
                        font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                    }

                    TextField {
                        id: initializationVectorField
                        placeholderText: qsTr("Enter Initialization Vector")
                    }
                }
            }

            ColumnLayout {
                id: secondColumn

                width: stepSixSectionColumn.implicitWidth + itemDefaultMargin
                Layout.alignment: Qt.AlignTop | Qt.AlignRight

                visible: (encryptionAlgorithmComboBox.currentText === "AES - GCM" || encryptionAlgorithmComboBox.currentText === "AES - CCM") ? false : true

                Column {
                    id: stepSixSectionColumn

                    spacing: 10

                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.leftMargin: itemLeftMargin
                    Layout.topMargin: itemTopBottomMargin
                    Layout.bottomMargin: itemTopBottomMargin

                    Text {
                        id: stepSixTextFirst
                        color: "#ffffff"
                        text: qsTr("Step 6. Enter count of Transformation Rounds.")
                        font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                    }

                    TextField {
                        id: roundsField
                        placeholderText: qsTr("Enter count of Transformation Rounds")
                        validator: IntValidator {}
                    }
                }

                Column {
                    id: stepSevenSectionColumn

                    spacing: 10

                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.leftMargin: itemLeftMargin
                    Layout.topMargin: itemTopBottomMargin
                    Layout.bottomMargin: itemTopBottomMargin

                    Text {
                        id: stepSevenTextFirst
                        color: "#ffffff"
                        text: qsTr("Step 7. Enter Random Delta.")
                        font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                    }

                    TextField {
                        id: randomDeltaField
                        placeholderText: qsTr("Enter Random Delta")
                    }
                }

                Column {
                    id: stepEightSectionColumn

                    spacing: 10

                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.leftMargin: itemLeftMargin
                    Layout.topMargin: itemTopBottomMargin
                    Layout.bottomMargin: itemTopBottomMargin

                    Text {
                        id: stepEigthTextFirst
                        color: "#ffffff"
                        text: qsTr("Step 8. Enter password. (Optional)")
                        font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                    }

                    TextField {
                        id: passwordField
                        placeholderText: qsTr("Enter password")
                    }
                }
            }

            ColumnLayout {
                id: thirdColumn

                width: stepSixSectionColumn.implicitWidth + itemDefaultMargin
                Layout.alignment: Qt.AlignTop | Qt.AlignLeft

                visible: (encryptionAlgorithmComboBox.currentText === "AES - GCM" || encryptionAlgorithmComboBox.currentText === "AES - CCM") ? true : false

                Column {
                    id: stepSixSecondSectionColumn

                    spacing: 10

                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.leftMargin: itemLeftMargin
                    Layout.topMargin: itemTopBottomMargin
                    Layout.bottomMargin: itemTopBottomMargin

                    Text {
                        id: stepSixTextSecond
                        color: "#ffffff"
                        text: qsTr("Step 6. Enter Authorization Tag.")
                        font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                    }

                    TextField {
                        id: authTagField
                        placeholderText: qsTr("Enter Authorization Tag")
                    }
                }

                Column {
                    id: stepSevenSecondSectionColumn

                    spacing: 10

                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.leftMargin: itemLeftMargin
                    Layout.topMargin: itemTopBottomMargin
                    Layout.bottomMargin: itemTopBottomMargin

                    Text {
                        id: stepSevenTextSecond
                        color: "#ffffff"
                        text: qsTr("Step 7. Additional authenticated data. (Optional)")
                        font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                    }

                    TextField {
                        id: aadField
                        placeholderText: qsTr("Additional authenticated data")
                    }
                }
            }

            ColumnLayout {
                id: fourthColumn

                Layout.alignment: Qt.AlignTop | Qt.AlignRight | Qt.AlignBottom

                ScrollView {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.maximumHeight: encryptTextPage.height / 2.5
                    Layout.margins: 20

                    TextArea {
                        id: encryptionTextField

                        placeholderText: qsTr("Enter text that will be encrypted")
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop

                        background: Rectangle {
                            border.color: "grey"
                            color: "white"
                        }

                        onTextChanged: {
                            if (checkForEmptyFields() === false) {
                                if(encryptionAlgorithmComboBox.currentText !== "AES - GCM" && encryptionAlgorithmComboBox.currentText !== "AES - CCM") {
                                    decryptionTextField.text = encryptionProcess.encryptDecryptTextWithBlockCipher(
                                                true, parseInt(roundsField.text),
                                                encryptionTextField.text, blockSizeComboBox.currentText,
                                                encryptionAlgorithmComboBox.currentText, hashAlgorithmComboBox.currentText,
                                                aesKeyField.text, initializationVectorField.text,
                                                randomDeltaField.text, passwordField.text)

                                } else {
                                    decryptionTextField.text = encryptionProcess.encryptDecryptTextWithAEAD(
                                                true, isGcm(),
                                                encryptionTextField.text, blockSizeComboBox.currentText, encryptionAlgorithmComboBox.currentText,
                                                aesKeyField.text, initializationVectorField.text, authTagField.text, aadField.text)
                                }

                                decryptionTextField.cursorPosition = decryptionTextField.text.length
                            }
                        }
                    }
                }

                ScrollView {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.maximumHeight: encryptTextPage.height / 2.5
                    Layout.margins: 20

                    TextArea {
                        id: decryptionTextField

                        placeholderText: qsTr("Enter text that will be decrypted")
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop

                        background: Rectangle {
                            border.color: "black"
                            color: "white"
                        }

                        onTextChanged: {
                            if (checkForEmptyFields() === false) {
                                if(encryptionAlgorithmComboBox.currentText !== "AES - GCM" && encryptionAlgorithmComboBox.currentText !== "AES - CCM") {
                                    encryptionTextField.text = encryptionProcess.encryptDecryptTextWithBlockCipher(
                                                false, parseInt(roundsField.text),
                                                decryptionTextField.text, blockSizeComboBox.currentText,
                                                encryptionAlgorithmComboBox.currentText, hashAlgorithmComboBox.currentText,
                                                aesKeyField.text, initializationVectorField.text,
                                                randomDeltaField.text, passwordField.text)
                                } else {
                                    encryptionTextField.text = encryptionProcess.encryptDecryptTextWithAEAD(
                                                false, isGcm(),
                                                decryptionTextField.text, blockSizeComboBox.currentText, encryptionAlgorithmComboBox.currentText,
                                                aesKeyField.text, initializationVectorField.text, authTagField.text, aadField.text)
                                }

                                encryptionTextField.cursorPosition = encryptionTextField.text.length
                            }
                        }
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.8999999761581421;height:480;width:640}D{i:3}
D{i:4}D{i:34}D{i:36}D{i:2}
}
##^##*/
