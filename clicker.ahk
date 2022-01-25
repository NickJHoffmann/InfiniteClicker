#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 3

Esc::ExitApp

ABtn := "Space"
BBtn := "LCtrl"
LeftStickLeft := "a"
LeftStickRight := "d"
LeftStickUp := "w"

PressKey(key, ms:=100) {
    Send, {%key% down}
    Sleep, %ms%
    Send, {%key% up}
    Sleep, %ms%
    Return
}

MakeSupplyPad() {
    PressKey(ABtn)
    Send, {LeftStickUp down}
    Send, {LeftStickRight down}
    Sleep, 100
    PressKey(ABtn)
    Send, {LeftStickUp up}
    Send, {LeftStickRight up}
    Sleep, 100
    PressKey(BBtn)
    Return
}

^k::
if WinActive("Xbox") {
    PressKey(LeftStickRight, 250)
    while(1) {
        if WinActive("Xbox") {
            MakeSupplyPad()

            PressKey(LeftStickLeft, 400)

            MakeSupplyPad()

            PressKey(LeftStickRight, 400)
        }
    }
}

Return