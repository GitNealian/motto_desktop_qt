#include "systemtrayiconmenu.h"
#include <QCoreApplication>
#include <QAction>
#include <QActionGroup>

SystemTrayIconMenu::SystemTrayIconMenu()
{
    QMenu* subMenu = new QMenu("颜色");

    QAction* light = new QAction("浅色");
    light->setCheckable(true);
    light->setChecked(true);

    QAction* dark = new QAction("深色");
    dark->setCheckable(true);

    QAction* autoColor = new QAction("自动");
    autoColor->setCheckable(true);

    QActionGroup* group = new QActionGroup(this);

    connect(group, SIGNAL(triggered(QAction* )),this, SLOT(onColor(QAction* )));

    light->setActionGroup(group);
    dark->setActionGroup(group);
    autoColor->setActionGroup(group);

    subMenu->addAction(light);
    subMenu->addAction(dark);
    subMenu->addAction(autoColor);
    addMenu(subMenu);

    QAction* adjust = new QAction("调整");
    connect(adjust, SIGNAL(triggered()),this, SLOT(onAdjust()));
    addAction(adjust);

    QAction* settings = new QAction("设置");
    connect(settings, SIGNAL(triggered()),this, SLOT(onSettings()));
    addAction(settings);

    QAction* exit = new QAction("退出");
    connect(exit, SIGNAL(triggered()),this, SLOT(onExit()));
    addAction(exit);
}

void SystemTrayIconMenu::onColor(QAction* action)
{
    emit(this->color(action->text()));
}

void SystemTrayIconMenu::onAdjust()
{
    emit(this->adjust());
}
void SystemTrayIconMenu::onSettings()
{
    emit(this->settings());
}
void SystemTrayIconMenu::onExit()
{
    emit(this->exit());
}
