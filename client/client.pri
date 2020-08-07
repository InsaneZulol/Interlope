HEADERS += ./vendor/de/skycoder42/qhotkey/QHotkey/qhotkey.h \
    $$PWD/hotkeymanager.h \
    $$PWD/receiverworker.h \
    $$PWD/stdinreaderservice.h \
    ./vendor/de/skycoder42/qhotkey/QHotkey/qhotkey_p.h \
    ./messenger.h
SOURCES += ./main.cpp \
    $$PWD/hotkeymanager.cpp \
    $$PWD/receiverworker.cpp \
    $$PWD/stdinreaderservice.cpp \
    ./vendor/de/skycoder42/qhotkey/QHotkey/qhotkey.cpp \
    ./vendor/de/skycoder42/qhotkey/QHotkey/qhotkey_win.cpp \
    ./messenger.cpp
RESOURCES += qml.qrc

#DISTFILES += \
#    $$PWD/qml_keyboard_layouts/KeyboardLayout_EU_QWERTY.qml
