#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <Windows.h>
#include "messenger.h"
#include "hotkeymanager.h"
#include <io.h>
#include <iostream>

int main(int argc, char *argv[])
{

#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
//  Just for debug
    if (argc > 1) {
        std::string arg = argv[1];
        if (arg == "--debug") {
            AllocConsole();
            FILE* nerr = nullptr;
            freopen_s(&nerr, "CONOUT$", "w", stderr);
        }
    }

    /// delet
    AllocConsole();
    FILE* nerr = nullptr;
    freopen_s(&nerr, "CONOUT$", "w", stderr);
#endif
    
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/assets/icon_black.png"));
    app.setOrganizationName("Alan Kaluza");
    app.setOrganizationDomain("insanezulol.github.io");
    app.setApplicationName("Interlope");
    
    qmlRegisterType<QHotkey>("de.skycoder42.QHotkey", 1, 0, "QHotkey");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QObject* rootObject = engine.rootObjects().first();
    QObject* QMLHotkeys = rootObject->findChild<QObject*>("hotkeys");
    QObject* QMLTrayIcon = rootObject->findChild<QObject*>("trayIcon");

    Messenger messenger;

    QObject::connect(QMLHotkeys, SIGNAL(message(QString)),
        &messenger, SLOT(prepareMessage(QString)), Qt::DirectConnection);

    QObject::connect(QMLTrayIcon, SIGNAL(message(QString)),
        &messenger, SLOT(prepareMessage(QString)), Qt::DirectConnection);
    

    return app.exec();
}
