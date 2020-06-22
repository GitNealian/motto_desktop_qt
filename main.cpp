#include <QCoreApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtCore/Qt>
#include <QPixmap>
#include <QPainter>
#include "previewimage.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<PreviewImage>("PreviewImage", 1, 0, "PreviewImage");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/settings.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    return app.exec();
}
typedef struct Character {
    int x;
    int y;
    QString fontFamily;
    int fontSize;
    QChar character;
} Character;

QPixmap* getPreviewPixmap(int width, int height, int n, Character* characters){
    QPixmap* pixmap = new QPixmap(width, height);
    QPainter painter(pixmap);
    for (int i = 0; i < n; i++){
        painter.setFont(QFont(characters[i].fontFamily, characters[i].fontSize));
        painter.drawText(QPoint(characters[i].x, characters[i].y), characters[i].character);
    }
    return pixmap;
}
