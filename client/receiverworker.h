#pragma once

#include <QThread>

class ReceiverWorker : public QThread
{
	Q_OBJECT

public:
	void run() override;

	Q_SIGNAL
	void receivedMessage(const QString& message);
};
