#pragma once
#include <QHotkey>
#include <QObject>
#include <QSettings>
#include "messenger.h"

class HotkeyManager : public QObject
{
	Q_OBJECT
public slots:
	void onClearBinding(qint32 key);

public:
	explicit HotkeyManager(QObject* parent, Messenger* messenger, QObject* qml_comms);
	~HotkeyManager();

private:
	QHotkey* registerHotkey(QKeySequence new_key, QHotkey** hotkey_ptr);
	void connectAction(QHotkey* hotkey, const QString& action);
	void updateHotkey(QHotkey* hotkey = nullptr);

	QKeySequence assignKeySequence(qint32 key);
private:
	QHotkey* toggleHotkey_ = nullptr;
	QHotkey* fastFwdHotkey_ = nullptr;
	QHotkey* reverseHotkey_ = nullptr;
	QHotkey* nextHotkey_ = nullptr;
	QHotkey* previousHotkey_ = nullptr;
	QHotkey* volupHotkey_ = nullptr;
	QHotkey* voldnHotkey_ = nullptr;

	std::vector<QHotkey**>hotkey_vec_ {&toggleHotkey_, &fastFwdHotkey_, &reverseHotkey_, &nextHotkey_, &previousHotkey_, &volupHotkey_, &voldnHotkey_};

	Messenger messenger_;
	QSettings settings_;

	const QKeySequence TEMP_HOTKEY_ = "Ctrl+ScrollLock";

};