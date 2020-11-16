import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

Item {
    id: backGround
    anchors.fill: parent
    
    property string gradientColorOne: "#8874D0"
    property string gradientColorTwo: "#583EB6"
    property string gradientColorThree: "#4F37A2"
    property string gradientColorFour: "#332468"

    Rectangle {
        id: backGroundRectangle
        anchors.fill: parent
        
        LinearGradient {
            anchors.fill: parent
            start: Qt.point(backGround.width, 0)
            end: Qt.point(0, backGround.height)
            
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    /*
                            Palete One: #8874D0, #583EB6, #4F37A2, #332468
                            Palete Two: #490d9c, #130b61, #020024
                    */
                    SequentialAnimation on color {
                        loops: Animation.Infinite
                        ColorAnimation { from: gradientColorOne; to: gradientColorTwo; duration: 8000 }
                        ColorAnimation { from: gradientColorTwo; to: gradientColorOne; duration: 8000 }
                        ColorAnimation { from: gradientColorOne; to: gradientColorFour; duration: 8000 }
                        ColorAnimation { from: gradientColorFour; to: gradientColorOne; duration: 8000 }
                    }
                }
                GradientStop {
                    position: 0.5
                    SequentialAnimation on color {
                        loops: Animation.Infinite
                        ColorAnimation { from: gradientColorTwo; to: gradientColorThree; duration: 8000 }
                        ColorAnimation { from: gradientColorThree; to: gradientColorTwo; duration: 8000 }
                    }
                }
                GradientStop {
                    position: 1
                    SequentialAnimation on color {
                        loops: Animation.Infinite
                        ColorAnimation { from: gradientColorThree; to: gradientColorFour; duration: 8000 }
                        ColorAnimation { from: gradientColorFour; to: gradientColorThree; duration: 8000 }
                    }
                }
            }
        }
    }
}
