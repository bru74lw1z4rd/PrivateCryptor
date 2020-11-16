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
        id: customMenuButton3

        textOnButton: "Encrypt Text"

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.maximumHeight: maxButtonSize
        Layout.maximumWidth: maxButtonSize
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    }
    
    CustomMenuButton {
        id: customMenuButton4

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
