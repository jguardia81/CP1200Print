#include "printphotos.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QVariant variant = engine.rootContext()->contextProperty("photoModel");

    QObject* rootObject = engine.rootObjects().at(0);
    PrintPhotos printPhotos(rootObject);
    QObject::connect(rootObject, SIGNAL(qmlSignal(QVariant)),&printPhotos, SLOT(onPrintClicked(QVariant)));
    return app.exec();
}
