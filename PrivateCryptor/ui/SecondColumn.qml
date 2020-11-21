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
import QtQuick.Dialogs 1.3

ColumnLayout {
    id: secondColumn
    
    width: stepSixSectionColumn.implicitWidth + itemDefaultMargin
    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
        
    property alias roundsField: roundsField
    property alias randomDeltaField: randomDeltaField
    property alias passwordField: passwordField

    Column {
        id: stepSixSectionColumn
        
        spacing: itemSpacing
        
        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
        Layout.leftMargin: itemLeftRightMargin
        Layout.topMargin: itemTopBottomMargin
        Layout.bottomMargin: itemTopBottomMargin
        
        Text {
            id: stepSixTextFirst
            color: "#ffffff"
            text: qsTr("Step 6. Enter count of Transformation Rounds.")
            font.pixelSize: fontSize
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
        
        spacing: itemSpacing
        
        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
        Layout.leftMargin: itemLeftRightMargin
        Layout.topMargin: itemTopBottomMargin
        Layout.bottomMargin: itemTopBottomMargin
        
        Text {
            id: stepSevenTextFirst
            color: "#ffffff"
            text: qsTr("Step 7. Enter Random Delta.")
            font.pixelSize: fontSize
            verticalAlignment: Text.AlignVCenter
        }
        
        TextField {
            id: randomDeltaField
            placeholderText: qsTr("Enter Random Delta")
        }
    }
    
    Column {
        id: stepEightSectionColumn
        
        spacing: itemSpacing
        
        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
        Layout.leftMargin: itemLeftRightMargin
        Layout.topMargin: itemTopBottomMargin
        Layout.bottomMargin: itemTopBottomMargin
        
        Text {
            id: stepEigthTextFirst
            color: "#ffffff"
            text: qsTr("Step 8. Enter password. (Optional)")
            font.pixelSize: fontSize
            verticalAlignment: Text.AlignVCenter
        }
        
        TextField {
            id: passwordField
            placeholderText: qsTr("Enter password")
        }
    }
}
