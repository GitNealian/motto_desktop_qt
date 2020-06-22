#include "previewimage.h"
#include <QPainter>
#include <QColor>
#include <QPixmap>
PreviewImage::PreviewImage()
{
    this->color = QString("black");
}
void PreviewImage::paint(QPainter* painter)
{
    painter->fillRect(0, 0, width(), height(), QColor(this->color));
}
void PreviewImage::changeColor(QString color)
{
    this->color = color;
    update();
}
void PreviewImage::preview(QString pText, QString pFont, int pSize, QString sText, QString sFont, int sSize)
{
    this->pText = pText;
    this->pFont = pFont;
    this->pSize = pSize;
    this->sText = sText;
    this->sFont = sFont;
    this->sSize = sSize;
    update();
}
