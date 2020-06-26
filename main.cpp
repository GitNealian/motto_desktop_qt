#include <QCoreApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtCore/Qt>
#include <QPixmap>
#include <QPainter>
#include <QSystemTrayIcon>
#include <QQmlContext>
#include "previewimage.h"
#include "systemtrayiconmenu.h"
#include "framelesswindow.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    SystemTrayIconMenu* menu = new SystemTrayIconMenu();

    qmlRegisterType<PreviewImage>("PreviewImage", 1, 0, "PreviewImage");
    qmlRegisterType<FramelessWindow>("FrameLessWindow", 1, 0, "FramelessWindow");


    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("menu", menu);


    QSystemTrayIcon systemTrayIcon(NULL);
    systemTrayIcon.setContextMenu(menu);
    systemTrayIcon.show();

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
