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
    id: mainPage

    background: Rectangle {
        color: "transparent"
    }
    
    Text {
        id: mainPageInformationText
        color: "white"
        text: qsTr("Choose action below to continue")
        font.pixelSize: 24

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        
        anchors.topMargin: 60
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }
    
    MainMenuLayout {
        id: mainMenuLayout
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: mainPageInformationText.bottom
        anchors.bottom: parent.bottom
        anchors.margins: 15
    }
}
