#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QHotkey>
int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    auto hotkey = new QHotkey(QKeySequence("ctrl+alt+Q"), true, &app);//The hotkey will be automatically registered
    qDebug() << "Is Registered: " << hotkey->isRegistered();
    QObject::connect(hotkey, &QHotkey::activated, qApp, [&](){
        qDebug() << "Hotkey Activated - the application will quit now";
        qApp->quit();
    });
    app.setOrganizationName("interlope");
    app.setOrganizationDomain("interlope.com");
    app.setApplicationName("InterlopeClient");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
