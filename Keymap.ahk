#NoTrayIcon
CapsLock & V::
	Run D:\Vim\vim82\gvim.exe
	WinActivate
	return
CapsLock & h::Left
CapsLock & j::Down
CapsLock & k::up
CapsLock & l::Right
CapsLock & y::Run D:\Youdao\Dict\Application\YoudaoDict.exe

CapsLock & e::
;CapsLock Up::
   If WinExist("ahk_class EmEditorMainFrame3"){
    if WinActive("ahk_class EmEditorMainFrame3")
    send ^a^c{Delete}^w
    else
     WinActivate
  }
   else{
    Run D:\EmEditor Professional\EmEditor.exe
}
return


#IfWinActive ahk_class Vim
Capslock::Esc
#IfWinActive

#IfWinActive ahk_class ENSingleNoteView
^w::send !{F4}
#IfWinActive

#IfWinActive ahk_class YXMainFrame
^w::send !{F4}
#IfWinActive

;ScrollLock::^#Right
