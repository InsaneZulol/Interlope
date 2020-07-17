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
            onKeyClicked: console.log("Q clicked");
        }
        // Margin
        Spacer {
            opacity: 0
        }
        Key {
            caption: "F1"
            onKeyClicked: console.log("Q clicked");
        }
        Key {
            caption: "F2"
            onKeyClicked: console.log("Q clicked");
        }
        Key {
            caption: "F3"
            onKeyClicked: console.log("Q clicked");
        }
        Key {
            caption: "F4"
            onKeyClicked: console.log("Q clicked");
        }
        // Margin
        Key {
            aspectRatio: 0.5
            opacity: 0
        }
        Key {
            caption: "F5"
            onKeyClicked: console.log("Q clicked");
        }
        Key {
            caption: "F6"
            onKeyClicked: console.log("Q clicked");
        }
        Key {
            caption: "F7"
            onKeyClicked: console.log("Q clicked");
        }
        Key {
            caption: "F8"
            onKeyClicked: console.log("Q clicked");
        }
        // Margin
        Spacer {
            aspectRatio: .5
            opacity: 0
        }
        Key {
            caption: "F9"
            onKeyClicked: console.log("Q clicked");
        }
        Key {
            caption: "F10"
            onKeyClicked: console.log("Q clicked");
        }
        Key {
            caption: "F11"
            onKeyClicked: console.log("Q clicked");
        }
        Key {
            caption: "F12"
            onKeyClicked: console.log("Q clicked");
        }
        // Margin
        Spacer {
            aspectRatio: .25
        }
        Key {
            caption: "Pr.Sc."
            onKeyClicked: console.log("Q clicked");
        }
        Key {
            caption: "Scroll\n Lock"
            onKeyClicked: console.log("Q clicked");
        }
        Key {
            caption: "Pause"
            onKeyClicked: console.log("Q clicked");
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
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "1"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "2"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "3"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "4"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "5"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "6"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "7"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "8"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "9"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "0"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "-"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "+"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    aspectRatio: 2.0
                    caption: "Backspace"
                    onKeyClicked: console.log("Q clicked");
                }

            }
            // TAB Q W E R T Y ...
            //
            Row {
                Key {
                    aspectRatio: 1.5
                    caption: "TAB"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "Q"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "W"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "E"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "R"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "T"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "Y"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "U"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "I"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "O"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "P"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "["
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "]"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    aspectRatio: 1.5
                    caption: "\\"
                    onKeyClicked: console.log("Q clicked");
                }
            }
            // CAPS A S D F G ...
            //
            Row {
                Key {
                    aspectRatio: 1.75
                    caption: "Caps Lock"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "A"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "S"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "D"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "F"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "G"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "H"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "J"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "K"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "L"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: ";"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "'"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    aspectRatio: 2.25
                    caption: "Enter"
                    onKeyClicked: console.log("Q clicked");
                }
            }
            // SHIFT Z X C V B ...
            //
            Row {
                Key {
                    aspectRatio: 2.25
                    caption: "Shift"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "Z"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "X"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "C"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "V"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "B"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "N"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "M"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: ","
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "."
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "/"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    aspectRatio: 2.75
                    caption: "Shift"
                    onKeyClicked: console.log("Q clicked");
                }
            }
            // LCtrl Win Alt SPACE Alt Win Menu
            //
            Row {
                Key {
                    aspectRatio: 1.5
                    caption: "LCtrl"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "Win"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    aspectRatio: 1.25
                    caption: "Alt"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    aspectRatio: 6.5
                    caption: "Spacebar"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    aspectRatio: 1.25
                    caption: "Alt"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "Win"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    caption: "Menu"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    aspectRatio: 1.5
                    caption: "RCtrl"
                    onKeyClicked: console.log("Q clicked");
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
                onKeyClicked: console.log("Q clicked");
            }
            Key {
                caption: "Home"
                onKeyClicked: console.log("Q clicked");
            }
            Key {
                caption: "Page\nUp"
                onKeyClicked: console.log("Q clicked");
            }
            Key {
                caption: "Delete"
                onKeyClicked: console.log("Q clicked");
            }
            Key {
                caption: "End"
                onKeyClicked: console.log("Q clicked");
            }
            Key {
                caption: "Page\nDown"
                onKeyClicked: console.log("Q clicked");
            }
            // Margin
            Spacer {} Spacer {}
            Spacer {} Spacer {}
            Key {
                caption: "Up"
                onKeyClicked: console.log("Q clicked");
            }
            // Margin
            Spacer {}
            Key {
                caption: "Left"
                onKeyClicked: console.log("Q clicked");
            }
            Key {
                caption: "Down"
                onKeyClicked: console.log("Q clicked");
            }
            Key {
                caption: "Right"
                onKeyClicked: console.log("Q clicked");
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
                        onKeyClicked: console.log("Q clicked");
                    }
                    Key {
                        caption: "/"
                        onKeyClicked: console.log("Q clicked");
                    }
                    Key {
                        caption: "*"
                        onKeyClicked: console.log("Q clicked");
                    }
                }
                Row {
                    Key {
                        caption: "7"
                        onKeyClicked: console.log("Q clicked");
                    }
                    Key {
                        caption: "8"
                        onKeyClicked: console.log("Q clicked");
                    }
                    Key {
                        caption: "9"
                        onKeyClicked: console.log("Q clicked");
                    }
                }
                Row {
                    Key {
                        caption: "4"
                        onKeyClicked: console.log("Q clicked");
                    }
                    Key {
                        caption: "5"
                        onKeyClicked: console.log("Q clicked");
                    }
                    Key {
                        caption: "6"
                        onKeyClicked: console.log("Q clicked");
                    }
                }
                Row {
                    Key {
                        caption: "1"
                        onKeyClicked: console.log("Q clicked");
                    }
                    Key {
                        caption: "2"
                        onKeyClicked: console.log("Q clicked");
                    }
                    Key {
                        caption: "3"
                        onKeyClicked: console.log("Q clicked");
                    }
                }
                Row {
                    Key {
                        aspectRatio: 2.0
                        caption: "0"
                        onKeyClicked: console.log("Q clicked");
                    }
                    Key {
                        caption: "Del"
                        onKeyClicked: console.log("Q clicked");
                    }
                }
            }

            // + - ENTER
            Column {
                Key {
                    caption: "-"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    isVerticalKey: true
                    aspectRatio: 2.0
                    caption: "+"
                    onKeyClicked: console.log("Q clicked");
                }
                Key {
                    isVerticalKey: true
                    aspectRatio: 2.0
                    caption: "Enter"
                    onKeyClicked: console.log("Q clicked");
                }
            }
        }
    }
    // End of Keypad Section
}
//
// End of Main Section
