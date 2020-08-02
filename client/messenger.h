#pragma once

#include <QObject>
#include <QFile>
#include <QThread>

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
	~Messenger();
	void sendMessage(const QByteArray& message);
Q_SIGNALS:

public Q_SLOTS:
	void prepareMessage(const QString& message);

private:

	QFile out_;
	QThread* recv_thread_ = nullptr;
};
