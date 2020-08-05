#include "stdinreaderservice.h"

StdinReaderService::StdinReaderService(QObject *parent)
	: QObject(parent) {

    // Start worker thread for stdin
    stdin_receiver_thread_ = new QThread(); // using 'new', but we schedule the object for deletion via &QObject::deleteLater connection
    stdin_receiver_ = new ReceiverWorker(); // using 'new', but we schedule the object for deletion via &QObject::deleteLater connection
    stdin_receiver_->moveToThread(stdin_receiver_thread_);

    connect(stdin_receiver_, &ReceiverWorker::receivedMessage, this, [this](const QString& message) {
        qDebug() << "new message arrived: " << message; // todo: handle the message
    });

    connect(stdin_receiver_thread_, &QThread::started, stdin_receiver_, &ReceiverWorker::process);
    connect(stdin_receiver_, &ReceiverWorker::receivedMessage, stdin_receiver_thread_, &QThread::quit);
    connect(stdin_receiver_, &ReceiverWorker::receivedMessage, stdin_receiver_, &QObject::deleteLater);
    connect(stdin_receiver_thread_, &QThread::finished, stdin_receiver_thread_, &QObject::deleteLater);

    stdin_receiver_thread_->start();
}

StdinReaderService::~StdinReaderService() {
    stdin_receiver_thread_->requestInterruption();
}
