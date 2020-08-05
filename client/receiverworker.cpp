#include "receiverworker.h"
#include <QObject>
#include <QFile>

// infinite loop for receiving data from stdin. 
// Should simulate readyRead from sockets - or at least behave alike.
// on new message emits a signal with it's content.
void ReceiverWorker::process() {
	QFile in;
	in.open(stdin, QIODevice::ReadOnly | QIODevice::Unbuffered);
	forever {
		if (QThread::currentThread()->isInterruptionRequested()) {
			return;
		}
		in.startTransaction();
		quint32 len = 0;
		const auto res = in.read(reinterpret_cast<char*>(&len), sizeof(quint32));
		if (res == -1) {
			in.rollbackTransaction();
			return;
		}
		const auto message = in.read(len);
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
}


ReceiverWorker::~ReceiverWorker() {
}

ReceiverWorker::ReceiverWorker() {

}