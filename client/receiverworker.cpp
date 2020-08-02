#include "receiverworker.h"
#include <QObject>
#include <QFile>
#include <QDebug>


void ReceiverWorker::process() {
    QFile in;
    in.open(stdin, QIODevice::ReadOnly | QIODevice::Unbuffered);
    while (true) {
        in.startTransaction();
        quint32 len = 0;
        const auto res = in.read(reinterpret_cast<char*>(&len), sizeof(quint32));
        if (res == -1) {
            in.rollbackTransaction();
            return;
        }
        const auto message = in.read(len);
        qDebug() << "in readyRead, message: " << message;
        if (message.length() != int(len)) {
            in.rollbackTransaction();
            return;
        }
        if (message.isEmpty()) {
            in.rollbackTransaction();
            return;
        }
        in.commitTransaction();
        emit receivedMessage(message);
    }
    qDebug() << "done";
}

ReceiverWorker::~ReceiverWorker() {

}
ReceiverWorker::ReceiverWorker() {
    // you could copy data from constructor arguments to internal variables here.
}