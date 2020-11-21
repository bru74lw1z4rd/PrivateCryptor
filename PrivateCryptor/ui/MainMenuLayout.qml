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

RowLayout {    
    property int maxButtonSize: 250

    id: mainMenuLayout
    spacing: 4
    
    CustomMenuButton {
        id: encryptPageButton

        textOnButton: "Encrypt Text"

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.maximumHeight: maxButtonSize
        Layout.maximumWidth: maxButtonSize
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    }
    
    CustomMenuButton {
        id: decryptPageButton

        textOnButton: "Decrypt Text"

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.maximumHeight: maxButtonSize
        Layout.maximumWidth: maxButtonSize
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    }
    
    CustomMenuButton {
        id: customMenuButton1

        textOnButton: "Encrypt File"

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.maximumHeight: maxButtonSize
        Layout.maximumWidth: maxButtonSize
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    }
    
    CustomMenuButton {
        id: customMenuButton2

        textOnButton: "Decrypt File"

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.maximumHeight: maxButtonSize
        Layout.maximumWidth: maxButtonSize
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    }
}
