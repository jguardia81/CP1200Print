#include "printphotos.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;


    const QObject* rootObject = engine.rootObjects().at(0);
    PrintPhotos printPhotos;
    QObject::connect(rootObject, SIGNAL(qmlSignal(QVariant)),&printPhotos, SLOT(onPrintClicked(QVariant)));
    return app.exec();
}
