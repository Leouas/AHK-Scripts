Run http://172.30.16.34/srun_portal_pc.php?ac_id=5&url=www.msftconnecttest.com
WinWaitActive �û���¼ - Google Chrome
CoordMode, ToolTip, Window
Click 260, 340
send {Tab}
Send Love08.10
Click 190, 515
WinWait ��¼�ɹ� - Google Chrome
send ^w
sleep 100
Send ^w
return

SelfKill =
(
bat file
del %A_ScriptFullPath%
del `%0
)

FileAppend,%SelfKill%,SelfKill.bat

Run,SelfKill.bat
