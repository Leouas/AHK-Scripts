CapsLock & V::
 Run D:\Program Files\Vim\vim81\gvim.exe
  If WinExist("ahk_class Vim")
 WinActivate
CapsLock & h::Left
CapsLock & j::Down
CapsLock & k::up
CapsLock & l::Right
CapsLock & y::Run D:\Program Files\Dict\Application\YoudaoDict.exe

CapsLock & e::
;CapsLock Up::
   If WinExist("ahk_class EmEditorMainFrame3"){
    if WinActive("ahk_class EmEditorMainFrame3")
    send ^a^c{Delete}^w
    else
     WinActivate
  }
   else{
    Run D:\Program Files\Emeditor\EmEditor.exe
}
return
;+CapsLock::CapsLock
