#include "messenger.h"
#include <receiverworker.h>
#include <QCoreApplication>
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include <QThread>

#ifdef Q_OS_WIN
#include <Windows.h>
#include <io.h>
#include <fcntl.h>
#endif


Messenger::Messenger(QObject *parent)
	: QObject(parent) {
#ifdef Q_OS_WIN
    _setmode(_fileno(stdout), _O_BINARY);
    _setmode(_fileno(stdin), _O_BINARY);

#endif
    // stdout can stay on same thread, as we know when we send the messages.
    // stdin, since we don't know when the new message arrives,
    // we will use a blocking loop in it's own thread.
	out_.open(stdout, QIODevice::WriteOnly);
    
    ReceiverWorker* worker = new ReceiverWorker();
    worker->moveToThread(&recv_thread_);
    connect(worker, &ReceiverWorker::receivedMessage, this, [this](const QString& message) {
        qDebug() << "new message arrived in c++!: " << message;
        });
    connect(&recv_thread_, &QThread::started, worker, &ReceiverWorker::run);

    connect(worker, &QThread::finished, worker, &QObject::deleteLater);
    connect(&recv_thread_, &QThread::finished, worker, &QObject::deleteLater);

    recv_thread_.start();
}

Messenger::~Messenger() {
    recv_thread_.quit();
    recv_thread_.wait();
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