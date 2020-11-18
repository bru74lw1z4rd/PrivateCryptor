import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

Item {
    id: mainBackground
    anchors.fill: parent
    
    property int backgroundAnimationDuration: 8000

    property string gradientColorOne: "#144552"
    property string gradientColorTwo: "#272640"
    property string gradientColorThree: "#312244"
    property string gradientColorFour: "#3E1F47"

    Rectangle {
        id: backGroundRectangle
        anchors.fill: parent
        
        LinearGradient {
            anchors.fill: parent
            start: Qt.point(mainBackground.width, 0)
            end: Qt.point(0, mainBackground.height)
            
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    /*
                            Palete One: #8874D0, #583EB6, #4F37A2, #332468
                            Palete Two: #490d9c, #130b61, #020024
                    */
                    SequentialAnimation on color {
                        loops: Animation.Infinite
                        ColorAnimation { from: gradientColorOne; to: gradientColorTwo; duration: backgroundAnimationDuration }
                        ColorAnimation { from: gradientColorTwo; to: gradientColorOne; duration: backgroundAnimationDuration }
                        ColorAnimation { from: gradientColorOne; to: gradientColorFour; duration: backgroundAnimationDuration }
                        ColorAnimation { from: gradientColorFour; to: gradientColorOne; duration: backgroundAnimationDuration }
                    }
                }
                GradientStop {
                    position: 0.7
                    SequentialAnimation on color {
                        loops: Animation.Infinite
                        ColorAnimation { from: gradientColorTwo; to: gradientColorThree; duration: backgroundAnimationDuration }
                        ColorAnimation { from: gradientColorThree; to: gradientColorTwo; duration: backgroundAnimationDuration }
                    }
                }
                GradientStop {
                    position: 1
                    SequentialAnimation on color {
                        loops: Animation.Infinite
                        ColorAnimation { from: gradientColorThree; to: gradientColorFour; duration: backgroundAnimationDuration }
                        ColorAnimation { from: gradientColorFour; to: gradientColorThree; duration: backgroundAnimationDuration }
                    }
                }
            }
        }
    }
}
