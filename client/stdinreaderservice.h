#pragma once

#include <QObject>
#include <receiverworker.h>
class StdinReaderService : public QObject
{
	Q_OBJECT

public:
	StdinReaderService(QObject *parent);
	~StdinReaderService();
private:
	QThread* stdin_receiver_thread_ = nullptr;
	ReceiverWorker* stdin_receiver_ = nullptr;
};
