#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

#include <Windows.h>
#include "messenger.h"
#include "hotkeymanager.h"




int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
////     Just for debug...
    AllocConsole();
    FILE* nerr = nullptr;
    freopen_s(&nerr, "CONOUT$", "w", stderr);

#endif
    

    QGuiApplication app(argc, argv);

    // todo organize binds
	
    app.setWindowIcon(QIcon(":/assets/icon_black.png"));
    app.setOrganizationName("Alan Kaluza");
    app.setOrganizationDomain("insanezulol.github.io");
    app.setApplicationName("Interlope");
    
    qmlRegisterType<QHotkey>("de.skycoder42.QHotkey", 1, 0, "QHotkey");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/QML/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    
    QObject* rootObject = engine.rootObjects().first();
    QObject* QMLSettings_obj = rootObject->findChild<QObject*>("keybindSettings");
    if (QMLSettings_obj) qDebug() << "found";
    Messenger messenger;

    //HotkeyManager man(&app, &messenger, QMLSettings_obj);
    // connect to all key button items. Move this to hotkeyManager. 
    /*QList<QObject*> keyObj = rootObject->findChildren<QObject*>("kbutton");
    for (auto i = 0; i < keyObj.length(); i++) {
        bool connected = QObject::connect(keyObj[i], SIGNAL(clearBinding(qint32)),
            &man, SLOT(onClearBinding(qint32)), Qt::DirectConnection);
        qDebug() << "Connection established?" << connected;
    }*/
    


    return app.exec();
}
