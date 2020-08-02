#include "hotkeymanager.h"


HotkeyManager::HotkeyManager(QObject* parent, Messenger* messenger, QObject* qml_comms)
    : QObject(parent), messenger_(messenger), settings_() {
    // load settings on startup
    const QKeySequence TEMP_HOTKEY(TEMP_HOTKEY_);
    settings_.beginGroup("Keybinds");
    QKeySequence toggle = assignKeySequence(settings_.value("toggleKey").toInt());
    QKeySequence fastfwd = assignKeySequence(settings_.value("fastFwdKey").toInt());
    QKeySequence reverse = assignKeySequence(settings_.value("reverseKey").toInt());
    QKeySequence next = assignKeySequence(settings_.value("nextKey").toInt());
    QKeySequence prev = assignKeySequence(settings_.value("prevKey").toInt());
    QKeySequence volup = assignKeySequence(settings_.value("volUpKey").toInt());
    QKeySequence voldn = assignKeySequence(settings_.value("volDnKey").toInt());

    if (toggle != NULL)
        connectAction(registerHotkey(QKeySequence(toggle), &toggleHotkey_), Message::TOGGLE);
    if (fastfwd != NULL)
        connectAction(registerHotkey(QKeySequence(fastfwd), &fastFwdHotkey_), Message::FAST_FWD);
    if (reverse != NULL)
        connectAction(registerHotkey(QKeySequence(reverse), &reverseHotkey_), Message::REVERSE);
    if (next != NULL)
        connectAction(registerHotkey(QKeySequence(next), &nextHotkey_), Message::NEXT);
    if (prev != NULL)
        connectAction(registerHotkey(QKeySequence(prev), &previousHotkey_), Message::PREVIOUS);
    if (volup != NULL)
        connectAction(registerHotkey(QKeySequence(volup), &volupHotkey_), Message::VOL_UP);
    if (voldn != NULL)
        connectAction(registerHotkey(QKeySequence(voldn), &voldnHotkey_), Message::VOL_DN);


}


HotkeyManager::~HotkeyManager()
{

}

// Create a hotkey, register it and return it's pointer
QHotkey* HotkeyManager::registerHotkey(QKeySequence new_key, QHotkey** hotkey_ptr) {
    *hotkey_ptr = new QHotkey(new_key, true); // todo: unique_ptr
    qDebug() << "registered a hotkey: " << (*hotkey_ptr)->shortcut();
    if ((*hotkey_ptr)->isRegistered()) {
        return *hotkey_ptr;
    }
    qDebug() << "registerHotkey() returned nullptr";
    return nullptr;
}

// Bind the registered Hotkey to the message that will be sent by Messenger
void HotkeyManager::connectAction(QHotkey* hotkey, const QString& action) {

    QObject::connect(hotkey, &QHotkey::activated, this, [=]() {
        messenger_.prepareMessage(action);
        });

    hotkey->disconnect();
}



void HotkeyManager::updateHotkey(QHotkey* hotkey) {
}




// unregisters hotkey with matching Qt::Key
void HotkeyManager::onClearBinding(qint32 key) {
    for (const auto& i : hotkey_vec_) {
        // kinda weird comparing QKeySequence with qint. Potential failure point.
        if ((*i != nullptr) && ((*i)->shortcut() == Qt::Key(key))) {
            (*i)->setShortcut(TEMP_HOTKEY_);
            (*i)->setRegistered(false);
            qDebug() << "Unregistered" << Qt::Key(key);
        }
    }
}

QKeySequence HotkeyManager::assignKeySequence(qint32 key) {
    if (key == NULL) {
        return QKeySequence(TEMP_HOTKEY_);
    } else {
        return QKeySequence(Qt::Key(key));
    }
}