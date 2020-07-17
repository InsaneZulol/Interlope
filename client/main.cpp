#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QHotkey>
#include <QIcon>
#include <QJsonDocument>
#include <QJsonObject>
#include <Windows.h>
#include "messenger.h"

int main(int argc, char *argv[])
{

#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    // Just for debug...
    AllocConsole();
    FILE* nerr = nullptr;
    freopen_s(&nerr, "CONOUT$", "w", stderr);
	//
#endif
	
    QGuiApplication app(argc, argv);

    Messenger messenger;
	//todo organize binds
    QHotkey toggle_playback_action(QKeySequence(Qt::Key_Clear), true, &app);
    qDebug() << "Is Registered: " << toggle_playback_action.isRegistered();
    QObject::connect(&toggle_playback_action, &QHotkey::activated, qApp, [&](){
        qDebug() << "Pressed toggle_playback_action";
        const QJsonObject object
        {
            {"action", "toggle_playback"}
        };
        const auto msg = QJsonDocument(object).toJson(QJsonDocument::Compact);
        messenger.sendMessage(msg);
    });
	
    app.setWindowIcon(QIcon(":/icon_black.png"));
    app.setOrganizationName("Alan Kaluza");
    app.setOrganizationDomain("insanezulol.github.io");
    app.setApplicationName("Interlope");
	
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
