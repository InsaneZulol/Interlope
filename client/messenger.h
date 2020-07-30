#pragma once

#include <QObject>
#include <QFile>


namespace Message {
	const QString TOGGLE = "toggle_playback";
	const QString FAST_FWD = "fast_forward";
	const QString REVERSE = "reverse_playback";
	const QString NEXT = "next_media";
	const QString PREVIOUS = "previous_media";
	const QString VOL_UP = "volume_up";
	const QString VOL_DN = "volume_dn";
}

class Messenger : public QObject
{
	Q_OBJECT
public:
	explicit Messenger(QObject* parent = nullptr);
	
	void sendMessage(const QByteArray& message);
Q_SIGNALS:
	void newMessage(const QString& message);
public Q_SLOTS:
	void prepareMessage(const QString& message);
private Q_SLOTS:
	void readyRead();
private:
	QFile in_;
	QFile out_;

};
