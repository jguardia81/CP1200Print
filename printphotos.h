#ifndef PRINTPHOTOS_H
#define PRINTPHOTOS_H

#include <QObject>
#include <QVariant>

class PrintPhotos : public QObject
{
    Q_OBJECT

public:
    explicit PrintPhotos(QObject *parent = nullptr);

signals:

public slots:
    void onPrintClicked(QVariant variant);
};

#endif // PRINTPHOTOS_H
