import QtQuick 2.12
Column {
    id: keyboardEuQwertyFull
    spacing: (sectionSpacing.width)
    // This invisible item exists just so we can grab dynamic resizable width
    Spacer { id: sectionSpacing; aspectRatio: .25 }
    // Function Section
    // Esc F1 F2 F3 ...
    //
    Row {

        id: functionSection
        Key {
            caption: "Esc"
            key: Qt.Key_Escape;
        }
        // Margin
        Spacer {}
        Key {
            caption: "F1"
            key: Qt.Key_F1;
        }
        Key {
            caption: "F2"
            key: Qt.Key_F2;
        }
        Key {
            caption: "F3"
            key: Qt.Key_F3;
        }
        Key {
            caption: "F4"
            key: Qt.Key_F4;
        }
        // Margin
        Spacer {aspectRatio: 0.5}
        Key {
            caption: "F5"
            key: Qt.Key_F5;
        }
        Key {
            caption: "F6"
            key: Qt.Key_F6;
        }
        Key {
            caption: "F7"
            key: Qt.Key_F7;
        }
        Key {
            caption: "F8"
            key: Qt.Key_F8;
        }
        // Margin
        Spacer {aspectRatio: .5}
        Key {
            caption: "F9"
            key: Qt.Key_F9;
        }
        Key {
            caption: "F10"
            key: Qt.Key_F10;
        }
        Key {
            caption: "F11"
            key: Qt.Key_F11;
        }
        Key {
            caption: "F12"
            key: Qt.Key_F12;
        }
        // Margin
        Spacer {aspectRatio: .25}
        Key {
            caption: "Pr.Sc."
            key: Qt.Key_Print;
        }
        Key {
            caption: "Scroll\n Lock"
            key: Qt.Key_ScrollLock
        }
        Key {
            caption: "Pause"
            key: Qt.Key_Pause
        }
    }
    //
    // End of Function Section

    // Main Section
    //
    Row {
        id: mainKeyboardSection
        spacing: sectionSpacing.width
        //Writing Section
        //
        Column {
            id: writingSection
            // ~ 1 2 3 4 5 6 7 8 9 0 - = backspace
            //
            Row {
                Key {
                    caption: "~"
                    key: Qt.Key_QuoteLeft
                }
                Key {
                    caption: "1"
                    key: Qt.Key_1
                }
                Key {
                    caption: "2"
                    key: Qt.Key_2
                }
                Key {
                    caption: "3"
                    key: Qt.Key_3
                }
                Key {
                    caption: "4"
                    key: Qt.Key_4
                }
                Key {
                    caption: "5"
                    key: Qt.Key_5
                }
                Key {
                    caption: "6"
                    key: Qt.Key_6
                }
                Key {
                    caption: "7"
                    key: Qt.Key_7
                }
                Key {
                    caption: "8"
                    key: Qt.Key_8
                }
                Key {
                    caption: "9"
                    key: Qt.Key_9
                }
                Key {
                    caption: "0"
                    key: Qt.Key_0
                }
                Key {
                    caption: "-"
                    key: Qt.Key_Minus
                }
                Key {
                    caption: "+"
                    key: Qt.Key_Plus
                }
                Key {
                    aspectRatio: 2.0
                    caption: "Backspace"
                    key: Qt.Key_Backspace
                }
            }
            // TAB Q W E R T Y ...
            //
            Row {
                Key {
                    aspectRatio: 1.5
                    caption: "TAB"
                    key: Qt.Key_Tab
                }
                Key {
                    caption: "Q"
                    key: Qt.Key_Q
                }
                Key {
                    caption: "W"
                    key: Qt.Key_W
                }
                Key {
                    caption: "E"
                    key: Qt.Key_E
                }
                Key {
                    caption: "R"
                    key: Qt.Key_R
                }
                Key {
                    caption: "T"
                    key: Qt.Key_T
                }
                Key {
                    caption: "Y"
                    key: Qt.Key_Y
                }
                Key {
                    caption: "U"
                    key: Qt.Key_U
                }
                Key {
                    caption: "I"
                    key: Qt.Key_I
                }
                Key {
                    caption: "O"
                    key: Qt.Key_O
                }
                Key {
                    caption: "P"
                    key: Qt.Key_P
                }
                Key {
                    caption: "["
                    key: Qt.Key_BracketLeft
                }
                Key {
                    caption: "]"
                    key: Qt.Key_BracketRight
                }
                Key {
                    aspectRatio: 1.5
                    caption: "\\"
                    key: Qt.Key_Backslash
                }
            }
            // CAPS A S D F G ...
            //
            Row {
                Key {
                    aspectRatio: 1.75
                    caption: "Caps Lock"
                    key: Qt.Key_CapsLock
                }
                Key {
                    caption: "A"
                    key: Qt.Key_A
                }
                Key {
                    caption: "S"
                    key: Qt.Key_S
                }
                Key {
                    caption: "D"
                    key: Qt.Key_D
                }
                Key {
                    caption: "F"
                    key: Qt.Key_F
                }
                Key {
                    caption: "G"
                    key: Qt.Key_G
                }
                Key {
                    caption: "H"
                    key: Qt.Key_H
                }
                Key {
                    caption: "J"
                    key: Qt.Key_J
                }
                Key {
                    caption: "K"
                    key: Qt.Key_K
                }
                Key {
                    caption: "L"
                    key: Qt.Key_L
                }
                Key {
                    caption: ";"
                    key: Qt.Key_Semicolon
                }
                Key {
                    caption: "'"
                    key: Qt.Key_Apostrophe
                }
                Key {
                    aspectRatio: 2.25
                    caption: "Enter"
                    key: Qt.Key_Enter
                }
            }
            // SHIFT Z X C V B ...
            //
            Row {
                Key {
                    aspectRatio: 2.25
                    caption: "Shift"
                    key: Qt.Key_Shift
                }
                Key {
                    caption: "Z"
                    key: Qt.Key_Z

                }
                Key {
                    caption: "X"
                    key: Qt.Key_X
                }
                Key {
                    caption: "C"
                    key: Qt.Key_C
                }
                Key {
                    caption: "V"
                    key: Qt.Key_V
                }
                Key {
                    caption: "B"
                    key: Qt.Key_B
                }
                Key {
                    caption: "N"
                    key: Qt.Key_N
                }
                Key {
                    caption: "M"
                    key: Qt.Key_M
                }
                Key {
                    caption: ","
                    key: Qt.Key_Comma
                }
                Key {
                    caption: "."
                    key: Qt.Key_Period
                }
                Key {
                    caption: "/"
                    key: Qt.Key_Slash
                }
                Key {
                    aspectRatio: 2.75
                    caption: "Shift"
                    key: Qt.Key_Shift
                }
            }
            // LCtrl Win Alt SPACE Alt Win Menu
            //
            Row {
                Key {
                    aspectRatio: 1.5
                    caption: "Ctrl"
                    key: Qt.Key_Control
                }
                Key {
                    caption: "Win"
                    key: Qt.Key_Meta
                }
                Key {
                    aspectRatio: 1.25
                    caption: "Alt"
                    key: Qt.Key_Alt
                }
                Key {
                    aspectRatio: 6.5
                    caption: "Spacebar"
                    key: Qt.Key_Space
                }
                Key {
                    aspectRatio: 1.25
                    caption: "Alt"
                    key: Qt.Key_Alt
                }
                Key {
                    caption: "Win"
                    key: Qt.Key_Meta
                }
                Key {
                    caption: "Menu"
                    key: Qt.Key_Meta
                }
                Key {
                    aspectRatio: 1.5
                    caption: "Ctrl"
                    key: Qt.Key_Control
                }
            }
        }
        //
        //        End of Writing Section


        //        Mid Section
        //
        Grid {
            id: midSection
            columns: 3
            rows: 5

            Key {
                caption: "Insert"
                key: Qt.Key_Insert
            }
            Key {
                caption: "Home"
                key: Qt.Key_Home
            }
            Key {
                caption: "Page\nUp"
                key: Qt.Key_PageUp
            }
            Key {
                caption: "Delete"
                key: Qt.Key_Delete
            }
            Key {
                caption: "End"
                key: Qt.Key_End
            }
            Key {
                caption: "Page\nDown"
                key: Qt.Key_PageDown
            }
            // Margin
            Spacer {} Spacer {}
            Spacer {} Spacer {}
            Key {
                caption: "Up"
                key: Qt.Key_Up
            }
            // Margin
            Spacer {}
            Key {
                caption: "Left"
                key: Qt.Key_Left
            }
            Key {
                caption: "Down"
                key: Qt.Key_Down
            }
            Key {
                caption: "Right"
                key: Qt.Key_Right
            }
        }
        //
        // End of Mid Section

        // Keypad Section
        //
        Row {
            id: keypadSection
            Column {
                id: keypadMainSection
                Row {
                    Key {
                        caption: "Num\nLock"
                        key: Qt.Key_NumLock
                    }
                    Key {
                        caption: "/"
                        key: Qt.Key_Slash
                    }
                    Key {
                        caption: "*"
                        key: Qt.Key_Asterisk
                    }
                }
                Row {
                    Key {
                        caption: "7"
                        key: Qt.Key_Home
                    }
                    Key {
                        caption: "8"
                        key: Qt.Key_Up
                    }
                    Key {
                        caption: "9"
                        key: Qt.Key_PageUp
                    }
                }
                Row {
                    Key {
                        caption: "4"
                        key: Qt.Key_Left
                    }
                    Key {
                        caption: "5"
                        key: Qt.Key_Clear
                    }
                    Key {
                        caption: "6"
                        key: Qt.Key_Right
                    }
                }
                Row {
                    Key {
                        caption: "1"
                        key: Qt.Key_End
                    }
                    Key {
                        caption: "2"
                        key: Qt.Key_Down
                    }
                    Key {
                        caption: "3"
                        key: Qt.Key_PageDown
                    }
                }
                Row {
                    Key {
                        aspectRatio: 2.0
                        caption: "0"
                        key: Qt.Key_Insert
                    }
                    Key {
                        caption: "Del"
                        key: Qt.Key_Delete
                    }
                }
            }

            // + - ENTER
            Column {
                Key {
                    caption: "-"
                    key: Qt.Key_Minus
                }
                Key {
                    isVerticalKey: true
                    aspectRatio: 2.0
                    caption: "+"
                    key: Qt.Key_Plus
                }
                Key {
                    isVerticalKey: true
                    aspectRatio: 2.0
                    caption: "Enter"
                    key: Qt.Key_Enter
                }
            }
        }
        //
        // End of Keypad Section
    }
    //
    // End of Main Section
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
