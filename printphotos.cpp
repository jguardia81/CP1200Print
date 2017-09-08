#include "printphotos.h"
#include <QDebug>
PrintPhotos::PrintPhotos(QObject *parent) : QObject(parent)
{

}

void PrintPhotos::onPrintClicked(QVariant variant)
{
    Q_UNUSED(variant);
    qDebug() << "hello";
}
