
Run D:\Program Files\Git\bin\bash.exe
WinWaitActive ahk_class ConsoleWindowClass
Send cd /d/GIt/GroupTasks/EGAP
Send {Enter}
Send git add .`rgit commit -m'modify'`rgit push origin master`r#{Down}
return

SelfKill =
(
bat file
del %A_ScriptFullPath%
del `%0
)

FileAppend,%SelfKill%,SelfKill.bat

Run,SelfKill.bat
