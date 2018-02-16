#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "chatserver.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<ChatServer>("ChatServer", 1, 0, "ChatServer");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    //  Create two server instances and connect two server objects together
//    ChatServer server1, server2;
//    QObject::connect(&server1, SIGNAL(userNameChanged()), &server2, SLOT(setUserName));

    return app.exec();
}
