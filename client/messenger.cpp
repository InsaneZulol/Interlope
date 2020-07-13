#include "messenger.h"
#include <io.h>
#include <fcntl.h>
#include <QCoreApplication>
#include <Windows.h>
#include <QDebug>

Messenger::Messenger(QObject *parent)
	: QObject(parent) {
#ifdef Q_OS_WIN
    _setmode(_fileno(stdout), _O_BINARY);
#endif
	out_.open(stdout, QIODevice::WriteOnly);
}

void Messenger::sendMessage(const QByteArray& message) {
	quint32 len = message.length();
	out_.write(reinterpret_cast<char*>(&len), sizeof(len));
	out_.write(message);
	out_.flush();
}

// todo: finish reading from stdin later... either starting new a new thread with cin might be necessary
// or async notifications through QWinSocketNotifier/tcpnotifier(?)
void Messenger::readyRead() {
    in_.startTransaction();
    quint32 len = 0;
    const auto res = in_.read(reinterpret_cast<char*>(&len), sizeof(quint32));
    if (res == -1) {
        in_.rollbackTransaction();
        return;
    }
    const auto message = in_.read(len);
    qDebug() << "in readyRead, message: " << message;
    if (message.length() != int(len)) {
        in_.rollbackTransaction();
        return;
    }
    if (message.isEmpty()) {
        in_.rollbackTransaction();
        return;
    }
    in_.commitTransaction();
    Q_EMIT newMessage(message);
}
