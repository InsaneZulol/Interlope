#pragma once

#include <QThread>
#include <QDebug>


class ReceiverWorker : public QObject {
	Q_OBJECT
public:
	ReceiverWorker();
	~ReceiverWorker();
public slots:
	void process();

signals:
	void receivedMessage(const QString& message);
};
