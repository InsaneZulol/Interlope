#pragma once

#include <QObject>
#include <QFile>

class Messenger : public QObject
{
	Q_OBJECT
public:
	explicit Messenger(QObject *parent = nullptr);
	
	void sendMessage(const QByteArray& message);
	Q_SIGNALS:
	void newMessage(const QByteArray& message);

private Q_SLOTS:
	void readyRead();
private:
	QFile in_;
	QFile out_;
};
