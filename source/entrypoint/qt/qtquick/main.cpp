#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "utils.hpp"

#define UI_ENTRY "qrc:/ui/main.qml"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    //![Register]
    qmlRegisterType<Shaparak::Utils>("Utils", 1, 0, "Utils");
    //![Register]

    const QUrl url(QStringLiteral(UI_ENTRY));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
