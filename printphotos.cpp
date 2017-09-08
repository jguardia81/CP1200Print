#include "printphotos.h"
#include <QDebug>
#include <QAbstractListModel>
#include <QUrl>
#include <QProcess>
PrintPhotos::PrintPhotos(QObject *parent) : QObject(parent)
{

}

void PrintPhotos::onPrintClicked(QVariant variant)
{
    Q_UNUSED(variant);
    QAbstractItemModel* modelObject = parent()->findChild<QAbstractItemModel *>(QString("photoModel"));

    if (modelObject) {
        for (int i=0; i < modelObject->rowCount(); i++)  {
            QModelIndex modelIndex = modelObject->index(i,0);
            qDebug() << "Print " << modelIndex.data().toString();

            QUrl url(modelIndex.data().toString());
            qDebug() << url.path();
            QStringList args;
            args << "-dCanon_SELPHY_CP1200" << "-oraw" << url.toLocalFile();
            QProcess::execute(QString("/usr/bin/lp"),args);
        }
    }
}
