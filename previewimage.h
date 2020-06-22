#ifndef PREVIEWIMAGE_H
#define PREVIEWIMAGE_H
#include <QQuickPaintedItem>

class PreviewImage: public QQuickPaintedItem
{
    Q_OBJECT

public:
    PreviewImage();
public slots:
    void preview(QString pText, QString pFont, int pSize, QString sText, QString sFont, int sSize);
    void changeColor(QString color);
protected:
    void paint(QPainter *painter);
private:
    QString pText;
    QString pFont;
    int pSize;
    QString sText;
    QString sFont;
    int sSize;
    QString color;
};

#endif // PREVIEWIMAGE_H
