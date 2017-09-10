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

    QModelIndex parent;
    if (modelObject) {
        for (int i=0; i < modelObject->rowCount(); i++)  {
            QModelIndex modelIndex = modelObject->index(i,0);

            QUrl url(modelIndex.data().toString());
            QStringList args;
            args << "-dCanon_SELPHY_CP1200" << "-oraw" << url.toLocalFile();
            QProcess::execute(QString("/usr/bin/lp"),args);
            parent = modelIndex.parent();
        }
    }


}
