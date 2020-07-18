import QtQuick 2.15
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
        }
        // Margin
        Spacer {}
        Key {
            caption: "F1"
        }
        Key {
            caption: "F2"
        }
        Key {
            caption: "F3"
        }
        Key {
            caption: "F4"
        }
        // Margin
        Spacer {aspectRatio: 0.5}
        Key {
            caption: "F5"
        }
        Key {
            caption: "F6"
        }
        Key {
            caption: "F7"
        }
        Key {
            caption: "F8"
        }
        // Margin
        Spacer {aspectRatio: .5}
        Key {
            caption: "F9"
        }
        Key {
            caption: "F10"
        }
        Key {
            caption: "F11"
        }
        Key {
            caption: "F12"
        }
        // Margin
        Spacer {aspectRatio: .25}
        Key {
            caption: "Pr.Sc."
        }
        Key {
            caption: "Scroll\n Lock"
        }
        Key {
            caption: "Pause"
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
                }
                Key {
                    caption: "1"
                }
                Key {
                    caption: "2"
                }
                Key {
                    caption: "3"
                }
                Key {
                    caption: "4"
                }
                Key {
                    caption: "5"
                }
                Key {
                    caption: "6"
                }
                Key {
                    caption: "7"
                }
                Key {
                    caption: "8"
                }
                Key {
                    caption: "9"
                }
                Key {
                    caption: "0"
                }
                Key {
                    caption: "-"
                }
                Key {
                    caption: "+"
                }
                Key {
                    aspectRatio: 2.0
                    caption: "Backspace"
                }
            }
            // TAB Q W E R T Y ...
            //
            Row {
                Key {
                    aspectRatio: 1.5
                    caption: "TAB"
                }
                Key {
                    caption: "Q"
                }
                Key {
                    caption: "W"
                }
                Key {
                    caption: "E"
                }
                Key {
                    caption: "R"
                }
                Key {
                    caption: "T"
                }
                Key {
                    caption: "Y"
                }
                Key {
                    caption: "U"
                }
                Key {
                    caption: "I"
                }
                Key {
                    caption: "O"
                }
                Key {
                    caption: "P"
                }
                Key {
                    caption: "["
                }
                Key {
                    caption: "]"
                }
                Key {
                    aspectRatio: 1.5
                    caption: "\\"
                }
            }
            // CAPS A S D F G ...
            //
            Row {
                Key {
                    aspectRatio: 1.75
                    caption: "Caps Lock"
                }
                Key {
                    caption: "A"
                }
                Key {
                    caption: "S"
                }
                Key {
                    caption: "D"
                }
                Key {
                    caption: "F"
                }
                Key {
                    caption: "G"
                }
                Key {
                    caption: "H"
                }
                Key {
                    caption: "J"
                }
                Key {
                    caption: "K"
                }
                Key {
                    caption: "L"
                }
                Key {
                    caption: ";"
                }
                Key {
                    caption: "'"
                }
                Key {
                    aspectRatio: 2.25
                    caption: "Enter"
                }
            }
            // SHIFT Z X C V B ...
            //
            Row {
                Key {
                    aspectRatio: 2.25
                    caption: "Shift"
                }
                Key {
                    caption: "Z"
                }
                Key {
                    caption: "X"
                }
                Key {
                    caption: "C"
                }
                Key {
                    caption: "V"
                }
                Key {
                    caption: "B"
                }
                Key {
                    caption: "N"
                }
                Key {
                    caption: "M"
                }
                Key {
                    caption: ","
                }
                Key {
                    caption: "."
                }
                Key {
                    caption: "/"
                }
                Key {
                    aspectRatio: 2.75
                    caption: "Shift"
                }
            }
            // LCtrl Win Alt SPACE Alt Win Menu
            //
            Row {
                Key {
                    aspectRatio: 1.5
                    caption: "LCtrl"
                }
                Key {
                    caption: "Win"
                }
                Key {
                    aspectRatio: 1.25
                    caption: "Alt"
                }
                Key {
                    aspectRatio: 6.5
                    caption: "Spacebar"
                }
                Key {
                    aspectRatio: 1.25
                    caption: "Alt"
                }
                Key {
                    caption: "Win"
                }
                Key {
                    caption: "Menu"
                }
                Key {
                    aspectRatio: 1.5
                    caption: "RCtrl"
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
            }
            Key {
                caption: "Home"
            }
            Key {
                caption: "Page\nUp"
            }
            Key {
                caption: "Delete"
            }
            Key {
                caption: "End"
            }
            Key {
                caption: "Page\nDown"
            }
            // Margin
            Spacer {} Spacer {}
            Spacer {} Spacer {}
            Key {
                caption: "Up"
            }
            // Margin
            Spacer {}
            Key {
                caption: "Left"
            }
            Key {
                caption: "Down"
            }
            Key {
                caption: "Right"
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
                    }
                    Key {
                        caption: "/"
                    }
                    Key {
                        caption: "*"
                    }
                }
                Row {
                    Key {
                        caption: "7"
                    }
                    Key {
                        caption: "8"
                    }
                    Key {
                        caption: "9"
                    }
                }
                Row {
                    Key {
                        caption: "4"
                    }
                    Key {
                        caption: "5"
                    }
                    Key {
                        caption: "6"
                    }
                }
                Row {
                    Key {
                        caption: "1"
                    }
                    Key {
                        caption: "2"
                    }
                    Key {
                        caption: "3"
                    }
                }
                Row {
                    Key {
                        aspectRatio: 2.0
                        caption: "0"
                    }
                    Key {
                        caption: "Del"
                    }
                }
            }

            // + - ENTER
            Column {
                Key {
                    caption: "-"
                }
                Key {
                    isVerticalKey: true
                    aspectRatio: 2.0
                    caption: "+"
                }
                Key {
                    isVerticalKey: true
                    aspectRatio: 2.0
                    caption: "Enter"
                }
            }
        }
    }
    // End of Keypad Section
}
//
// End of Main Section
