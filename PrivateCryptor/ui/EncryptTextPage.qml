/**
 * Copyright 2020 PrivateWeb (https://privateweb.software). All Rights Reserved.
 *
 * Licensed under the Apache License 2.0 (the "License"). You may not use
 * this file except in compliance with the License. You can obtain a copy
 * in the file LICENSE in the source distribution
**/

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

Page {
    id: encryptTextPage

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

                Layout.alignment: Qt.AlignTop | Qt.AlignRight | Qt.AlignBottom

                ScrollView {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: firstColumn.implicitHeight / 2

                    Layout.leftMargin: itemLeftRightMargin
                    Layout.topMargin: itemTopBottomMargin
                    Layout.bottomMargin: itemTopBottomMargin
                    Layout.rightMargin: itemLeftRightMargin

                    TextArea {
                        id: encryptionTextField

                        placeholderText: qsTr("Enter text that will be encrypted")
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop

                        background: Rectangle {
                            border.color: (encryptionTextField.activeFocus === true) ? "blue" : "grey"
                            color: "white"
                            border.width: borderWidth
                        }

                        onTextChanged: {
                            if (checkForEmptyFields() === false && encryptionTextField.focus === true) {
                                decryptionTextField.text = encryptionProcess.encryptDecryptTextWithBlockCipher(
                                            true, parseInt(secondColumn.roundsField.text),
                                            encryptionTextField.text, firstColumn.blockSizeComboBox.currentText,
                                            firstColumn.encryptionAlgorithmComboBox.currentText, firstColumn.hashAlgorithmComboBox.currentText,
                                            firstColumn.aesKeyField.text, firstColumn.initializationVectorField.text,
                                            secondColumn.randomDeltaField.text, secondColumn.passwordField.text)

                                decryptionTextField.cursorPosition = decryptionTextField.text.length
                            }
                        }
                    }
                }

                ScrollView {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: firstColumn.implicitHeight / 2

                    Layout.leftMargin: itemLeftRightMargin
                    Layout.bottomMargin: itemTopBottomMargin
                    Layout.rightMargin: itemLeftRightMargin

                    TextArea {
                        id: decryptionTextField

                        placeholderText: qsTr("Enter text that will be decrypted")
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop

                        background: Rectangle {
                            border.color: (decryptionTextField.activeFocus === true) ? "blue" : "grey"
                            color: "white"
                            border.width: borderWidth
                        }

                        onTextChanged: {
                            if (checkForEmptyFields() === false && decryptionTextField.focus === true) {
                                encryptionTextField.text = encryptionProcess.encryptDecryptTextWithBlockCipher(
                                            false, parseInt(secondColumn.roundsField.text),
                                            decryptionTextField.text, firstColumn.blockSizeComboBox.currentText,
                                            firstColumn.encryptionAlgorithmComboBox.currentText, firstColumn.hashAlgorithmComboBox.currentText,
                                            firstColumn.aesKeyField.text, firstColumn.initializationVectorField.text,
                                            secondColumn.randomDeltaField.text, secondColumn.passwordField.text)

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
