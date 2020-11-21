import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Dialogs 1.3

ColumnLayout {
    id: firstColumn
    
    width: stepFiveText.implicitWidth + itemDefaultMargin
    Layout.alignment: Qt.AlignTop | Qt.AlignLeft

    property alias encryptionAlgorithmComboBox: encryptionAlgorithmComboBox
    property alias blockSizeComboBox: blockSizeComboBox
    property alias hashAlgorithmComboBox: hashAlgorithmComboBox
    property alias aesKeyField: aesKeyField
    property alias initializationVectorField: initializationVectorField

    Column {
        id: stepOneSectionColumn
        
        spacing: itemSpacing
        
        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
        Layout.leftMargin: itemLeftRightMargin
        Layout.topMargin: itemTopBottomMargin
        
        Text {
            id: stepOneText
            
            text: qsTr("Step 1. Choose encryption algorithm.")
            color: "white"
            font.pixelSize: fontSize
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
            }
        }
    }
    
    Column {
        id: stepTwoSectionColumn
        
        spacing: itemSpacing
        
        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
        Layout.leftMargin: itemLeftRightMargin
        Layout.topMargin: itemTopBottomMargin
        
        Text {
            id: stepTwoText
            
            color: "#ffffff"
            text: qsTr("Step 2. Choose block size.")
            font.pixelSize: fontSize
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
        
        spacing: itemSpacing
        
        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
        Layout.leftMargin: itemLeftRightMargin
        Layout.topMargin: itemTopBottomMargin
        
        Text {
            id: stepThreeText
            
            color: "#ffffff"
            text: qsTr("Step 3. Choose hash algorithm.")
            font.pixelSize: fontSize
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
        
        spacing: itemSpacing
        
        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
        Layout.leftMargin: itemLeftRightMargin
        Layout.topMargin: itemTopBottomMargin
        
        Text {
            id: stepFourText
            color: "#ffffff"
            text: qsTr("Step 4. Enter AES Key.")
            font.pixelSize: fontSize
            verticalAlignment: Text.AlignVCenter
        }
        
        TextField {
            id: aesKeyField
            placeholderText: qsTr("Enter AES Key")
        }
    }
    
    Column {
        id: stepFiveSectionColumn
        
        spacing: itemSpacing
        
        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
        Layout.leftMargin: itemLeftRightMargin
        Layout.topMargin: itemTopBottomMargin
        Layout.bottomMargin: itemTopBottomMargin
        
        Text {
            id: stepFiveText
            color: "#ffffff"
            text: (encryptionAlgorithmComboBox.currentText === "AES - GCM" || encryptionAlgorithmComboBox.currentText === "AES - CCM") ? qsTr("Step 5. Enter Initialization Vector.") : qsTr("Step 5. Enter Initialization Vector. (Optional)")
            font.pixelSize: fontSize
            verticalAlignment: Text.AlignVCenter
        }
        
        TextField {
            id: initializationVectorField
            placeholderText: qsTr("Enter Initialization Vector")
        }
    }
}
