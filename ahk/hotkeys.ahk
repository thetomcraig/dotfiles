#Include WinGetPosEx.ahk

IsAppActive(App) {
    Winget,AppName,ProcessName,A
    return AppName == App
}

SetCapslockState, AlwaysOff

; Map Alt Control
LAlt::LCtrl
RAlt::RCtrl
; Map Win to Alt
LWin::LAlt
RWin::RAlt
; Map Control to Windows
;LCtrl::LWin
;RCtrl::RWin
; Map F9 to Windows key
F9::LWin


;#SingleInstance, Force
; Map Ctrl+Tab to Win+Tab
; But in the browser, make it select next tab
^Tab::
if IsAppActive("brave.exe") {
    Send, ^{PgDn}
} else {
    Send #{Tab}
}
Return

; Windows has no concept of "hiding" an application
; So this will just minimize thea active window
^h::WinMinimize, A
Return
^m::WinMinimize, A
Return

; "Quit" (close the front window)
^q::
Send !{f4} ; Simulates the keypress alt+f4
Return

; Browser History
^y::
Send, ^h
Return

;Browser Tabs
^+]::Send, ^{tab}
^+[::Send, +^{tab}

;Browser History
^]::Send, !{Right}
^[::Send, !{Left}

;; vim navigation 
Capslock & h:: Send {Left} 
Capslock & l:: Send {Right}
Capslock & k:: Send {Up}
Capslock & j:: Send {Down}

; Forward Delete
CapsLock & Backspace::Send, {Del}

; Back and Forward One Word
CapsLock & i::Send, ^{Left}
CapsLock & o::Send, ^{Right}

; Tmux Commands
CapsLock & /::
Send, ^b
Sleep, 50
Send, c
Return
CapsLock & -::
Send, ^b
Sleep, 50
Send, -
Return
CapsLock & \::
Send, ^b
Sleep, 50
Send, \
Return
CapsLock & |::
Send, ^b
Sleep, 50
Send, |
Return
CapsLock & n::
Send, ^b
Sleep, 50
Send, n
Return
CapsLock & m::
Send, ^b
Sleep, 50
Send, m
Return
CapsLock & t::
Send, ^b
Sleep, 50
Send, t
Return
CapsLock & ,::
Send, ^b
Sleep, 50
Send, ,
Return
CapsLock & .::
Send, ^b
Sleep, 50
Send, .
Return

; TODO: refactor
; and figure out centering logic
; Window Controls
CapsLock & w::Send, #{Up}
CapsLock & s::Send, #{Down}
CapsLock & r::Send, +#{Down}
CapsLock & f::WinMaximize, A

CapsLock & a::
WinMaximize, A
Send, #{Left}
Sleep, 100
Send, {Esc}
Return

CapsLock & d::
WinMaximize, A
Send, #{Right}
Sleep, 100
Send, {Esc}
Return

CapsLock & x::Send, +#{Right}

; Debugging
CapsLock & b::
Winget,AppName,ProcessName,A
MsgBox, %AppName%
Return


^+m::
    IfWinExist, ahk_exe C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE
    {
        WinActivate
    }
    else
    {
        Run, C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE
        WinActivate
    }
return
