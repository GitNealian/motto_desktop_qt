#ifndef SYSTEMTRAYICONMENU_H
#define SYSTEMTRAYICONMENU_H
#include <QMenu>

class SystemTrayIconMenu: public QMenu
{
    Q_OBJECT
public:
    SystemTrayIconMenu();
public slots:
    void onColor(QAction* action);
    void onAdjust();
    void onSettings();
    void onExit();

signals:
    void color(QString color);
    void adjust();
    void settings();
    void exit();
};

#endif // SYSTEMTRAYICONMENU_H
