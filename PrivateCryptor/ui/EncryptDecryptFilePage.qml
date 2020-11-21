import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

import Qt.labs.platform 1.1

Page {
    id: encryptDecryptFilePage

    background: Rectangle {
        color: backgroundLightColor
        opacity: backgroundOpacity
        radius: 8
    }

    property int fontSize: 15
    property int borderWidth: 3
    property int itemSpacing: 10
    property int itemDefaultMargin: 35
    property int itemLeftRightMargin: 20
    property int itemTopBottomMargin: 30

    /* This function checks for empty fields in encryption/decryption pages */
    function checkForEmptyFields() {
        if (firstColumn.aesKeyField.length < 12) {
            errorMessageDialog.text = "AES Key Field mustn't be empty or less then 12."
            errorMessageDialog.open()

            return true
        } else if (secondColumn.roundsField <= 0) {
            errorMessageDialog.text = "Rounds Field mustn't be empty!"
            errorMessageDialog.open()

            return true;
        } else if (secondColumn.randomDeltaField.length < 8) {
            errorMessageDialog.text = "Random Delta Field mustn't be empty or less then 8."
            errorMessageDialog.open()

            return true
        }

        return false;
    }

    ScrollView {
        clip: true

        anchors.fill: parent

        contentWidth: Screen.width - (itemLeftRightMargin * 2) // Multiply by the number of sides where there is an indent

        ScrollBar.horizontal.policy: ScrollBar.AsNeeded
        ScrollBar.vertical.policy: ScrollBar.AsNeeded

        RowLayout {
            anchors.fill: parent

            FirstColumn {
                id: firstColumn
            }

            SecondColumn {
                id: secondColumn
            }

            ColumnLayout {
                id: thirdColumn

                Layout.alignment: Qt.AlignTop | Qt.AlignLeft | Qt.AlignBottom

                Column {
                    spacing: itemSpacing

                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.topMargin:  itemTopBottomMargin
                    Layout.bottomMargin: itemTopBottomMargin
                    Layout.rightMargin: itemLeftRightMargin
                    Layout.leftMargin: itemLeftRightMargin

                    FileDialog {
                        id: fileDialog                       
                        title: "Please choose a file"
                    }

                    Text {
                        color: "#ffffff"
                        text: qsTr("Step 9. Choose file, that will be decrypted.")
                        font.pixelSize: fontSize
                        verticalAlignment: Text.AlignVCenter
                    }


                    Button {
                        text: "Choose file"

                        onClicked: {
                            fileDialog.open()
                        }
                    }
                }

                Column {
                    spacing: itemSpacing

                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    Layout.topMargin:  itemTopBottomMargin
                    Layout.leftMargin: itemLeftRightMargin
                    Layout.bottomMargin: itemTopBottomMargin
                    Layout.rightMargin: itemLeftRightMargin

                    Text {
                        color: "#ffffff"
                        text: qsTr("Step 10. Choose operation.")
                        font.pixelSize: fontSize
                        verticalAlignment: Text.AlignVCenter
                    }

                    Row {
                        spacing: itemSpacing

                        Button {
                            text: "Decrypt"

                            onClicked: {
                                if (checkForEmptyFields() === false) {
                                    encryptionProcess.encryptDecryptFileWithBlockCipher(
                                                false, parseInt(secondColumn.roundsField.text),
                                                fileDialog.currentFile.toString(), firstColumn.blockSizeComboBox.currentText,
                                                firstColumn.encryptionAlgorithmComboBox.currentText, firstColumn.hashAlgorithmComboBox.currentText,
                                                firstColumn.aesKeyField.text, firstColumn.initializationVectorField.text,
                                                secondColumn.randomDeltaField.text, secondColumn.passwordField.text)
                                }
                            }
                        }

                        Button {
                            text: "Encrypt"

                            onClicked: {
                                if (checkForEmptyFields() === false) {
                                    encryptionProcess.encryptDecryptFileWithBlockCipher(
                                                true, parseInt(secondColumn.roundsField.text),
                                                fileDialog.currentFile.toString(), firstColumn.blockSizeComboBox.currentText,
                                                firstColumn.encryptionAlgorithmComboBox.currentText, firstColumn.hashAlgorithmComboBox.currentText,
                                                firstColumn.aesKeyField.text, firstColumn.initializationVectorField.text,
                                                secondColumn.randomDeltaField.text, secondColumn.passwordField.text)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
