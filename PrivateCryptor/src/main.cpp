#include <QApplication>
#include <QQmlApplicationEngine>

#include "EncryptionProcess/EncryptionProcess.h"

int main(int argc, char* argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    /* Set up organization information */
    QGuiApplication::setOrganizationName("PrivateWeb");
    QGuiApplication::setOrganizationDomain("https://privateweb.software");

    /* Register C++ classes in qml */
    qmlRegisterType<EncryptionProcess>("encryptionProcess", 1, 0, "EncryptionProcess");

    /* Load UI */
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/ui/ui/main.qml"));
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject* obj, const QUrl& objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
