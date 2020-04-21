﻿#h::  ; Win+H hotkey
; 获取当前选择的文本. 使用剪贴板代替
; "ControlGet Selected", 是因为它可以工作于更大范围的编辑器
; (即字处理软件).  保存剪贴板当前的内容
; 以便在后面恢复. 尽管这里只能处理纯文本,
; 但总比没有好:
AutoTrim Off  ; 保留剪贴板中任何前导和尾随空白字符.
ClipboardOld = %ClipboardAll%
Clipboard =  ; 必须清空, 才能检测是否有效.
Send ^c
ClipWait 1
if ErrorLevel  ; ClipWait 超时.
    return
; 替换 CRLF 和/或 LF 为 `n 以便用于 "发送原始模式的" 热字串:
; 对其他任何在原始模式下可能出现问题
; 的字符进行相同的处理:
StringReplace, Hotstring, Clipboard, ``, ````, All  ; 首先进行此替换以避免和后面的操作冲突.
StringReplace, Hotstring, Hotstring, `r`n, ``r, All  ; 在 MS Word 等软件中中使用 `r 会比 `n 工作的更好.
StringReplace, Hotstring, Hotstring, `n, ``r, All
StringReplace, Hotstring, Hotstring, %A_Tab%, ``t, All
StringReplace, Hotstring, Hotstring, `;, ```;, All
Clipboard = %ClipboardOld%  ; 恢复剪贴板之前的内容.
#NoTrayIcon
; 这里会移动 InputBox 的光标到更人性化的位置:
SetTimer, MoveCaret, 10
; 显示 InputBox, 提供默认的热字串:
InputBox, Hotstring, New Hotstring, Type your abreviation at the indicated insertion point. You can also edit the replacement text if you wish.`n`nExample entry: :R:btw`::by the way,,,,,,,, :R:`::%Hotstring%
if ErrorLevel  ; 用户选择了取消.
    return
IfInString, Hotstring, :R`:::
{
    MsgBox You didn't provide an abbreviation. The hotstring has not been added.
    return
}
; 否则添加热字串并重新加载脚本:
FileAppend, `n%Hotstring%, %A_ScriptFullPath%  ; 在开始处放置 `n 以防文件末尾没有空行.
Reload
Sleep 200 ; 如果加载成功, reload 会在 Sleep 期间关闭当前实例, 所以永远不会执行到下面的语句.
MsgBox, 4,, The hotstring just added appears to be improperly formatted.  Would you like to open the script for editing? Note that the bad hotstring is at the bottom of the script.
IfMsgBox, Yes, Edit
return

MoveCaret:
IfWinNotActive, New Hotstring
    return
; 否则移动 InputBox 中的光标到用户输入缩写的位置.
Send {Home}{Right 3}
SetTimer, MoveCaret, Off
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
::btw::by the way
::shsf::Stay hungry,stay folish
::\kengdy::
send {Enter}庄子说{Enter}
sleep 100
send {Enter}唯至人乃能游于世不避，顺人而不失己{Enter}
sleep 100
send {Enter}如果我们怀有一颗自足的心，顺人而不失己{Enter}
sleep 100
send {Enter}不有待于外物，那么就像小船一样，虽然几番风浪，却不会沉下去{Enter}
sleep 100
send {Enter}在风平浪静之后，仍然可以保持着本来的状态漂浮在水面上{Enter}
sleep 100
send {Enter}好像什么都没有发生过一样，{Enter}
sleep 100
send {Enter}将狂风暴雨都容纳进内心，却不为之困恼和苦闷。{Enter}
return

:R:@::@163.com
:*:\dd::
    d =%A_YYYY%-%A_MM%-%A_DD%
    ;_%A_Hour%-%A_Min%-%A_Sec% 
    clipboard = %d%
    Send ^v
    return
:*:\tt::
    d =%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% 
    clipboard = %d%
    Send ^v
    return
:*:\ed::
    ed = %A_YYYY%%A_MM%%A_DD%
    Clipboard =
    clipboard = %ed%
    Send ^v
    return


:*:\gitcmt::git add . && git commit -m'update' && git push origin master`r

:*:\cdn::https://cdn.jsdelivr.net/gh/Leouas/Leouas-img/
:R:newblog::---`rtitle: `rdate: `rcategories:`rtags:`rphoto:`r---

