#include "messenger.h"
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>


#ifdef Q_OS_WIN
#include <Windows.h>
#include <io.h>
#include <fcntl.h>
#endif


Messenger::Messenger(QObject* parent)
    : QObject(parent) {
#ifdef Q_OS_WIN
    _setmode(_fileno(stdout), _O_BINARY);
    _setmode(_fileno(stdin), _O_BINARY);
#endif
    // stdout can stay on the same thread, as we know when we send messages.
    // stdin, since we don't know when the new message arrives,
    // we will use a blocking loop in it's own thread.
    out_.open(stdout, QIODevice::WriteOnly);

    stdin_service_ = new StdinReaderService(this);
}

Messenger::~Messenger() {
}


void Messenger::prepareMessage(const QString& message) {
    qDebug() << "preparing msg: " << message;
    const QJsonObject object
    {
        {"action", message}
    };
    const auto msg = QJsonDocument(object).toJson(QJsonDocument::Compact);
    sendMessage(msg);
}


void Messenger::sendMessage(const QByteArray& message) {
	quint32 len = message.length();
	out_.write(reinterpret_cast<char*>(&len), sizeof(len));
	out_.write(message);
	out_.flush();
}