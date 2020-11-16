QT -= gui

CONFIG += c++17 console
CONFIG -= app_bundle

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


# Include OpenSSL Lib
unix:!macx: LIBS += -L$$PWD/../../../Qt/Tools/OpenSSL/binary/lib/ -lcrypto

INCLUDEPATH += $$PWD/../../../../Qt/Tools/OpenSSL/binary/include/openssl
DEPENDPATH += $$PWD/../../../../Qt/Tools/OpenSSL/binary/include/openssl

unix:!macx: PRE_TARGETDEPS += $$PWD/../../../../Qt/Tools/OpenSSL/binary/lib/libcrypto.a
unix:!macx: PRE_TARGETDEPS += $$PWD/../../../../Qt/Tools/OpenSSL/binary/lib/libssl.a

#
unix:!macx: LIBS += -L$$PWD/../../QSimpleCrypto/ -lQSimpleCrypto

INCLUDEPATH += $$PWD/../../QSimpleCrypto/include
DEPENDPATH += $$PWD/../../QSimpleCrypto/include

unix:!macx: PRE_TARGETDEPS += $$PWD/../../QSimpleCrypto/libQSimpleCrypto.a
