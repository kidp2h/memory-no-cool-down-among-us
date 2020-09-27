#NoTrayIcon
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include<NomadMemory.au3>
#include<_ModuleBase.au3>
MsgBox(0,"Notification", "Luu y : F7 o menu roi vao trong game, neu vao game roi F7 se bi loi")
HotKeySet("{F7}","NoCoolDown")
HotKeySet("{F8}","QuitTrainer")
#Region ### START Koda GUI section ### Form=
$mainGUI = GUICreate("Hack AmongUS by KidP2H",249, 43, 489, 227,$WS_POPUPWINDOW,$WS_EX_TOPMOST)
GUISetBkColor(0xe74c3c)
$Label1 = GUICtrlCreateLabel("F7 : Giet Nguoi Hang Loat =))", 8, 0, 143, 17)
$Label2 = GUICtrlCreateLabel("VerGame : v2020.9.22", 136, 24, 111, 17)
$Label3 = GUICtrlCreateLabel("F8 : Thoat Hack", 8, 16, 82, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


$pId = WinGetProcess("Among Us")
Func NoCoolDown()
	$hWnd = _MemoryOpen($pId)
	$address4ByteFirst = _ProcessGetModuleBase($pId,"GameAssembly.dll")+0x88C47A
	$address1ByteLast  = _ProcessGetModuleBase($pId,"GameAssembly.dll")+0x88C47E
	_MemoryWrite($address4ByteFirst,$hWnd,0x90909090)
	_MemoryWrite($address1ByteLast,$hWnd,0x8910A190)
EndFunc
Func QuitTrainer()
	Exit
EndFunc
;movss [esi+44],xmm0
While 1
	If(StringInStr(WinGetTitle("[ACTIVE]"),"Us") = 0) Then
		WinSetState($mainGUI, '', @SW_HIDE)
	Else
		WinSetState($mainGUI, '', @SW_SHOW)
	EndIf
	If(WinGetProcess("Among Us") = -1) Then
		MsgBox(0,"Notification","Mo game roi mo hack sau :<")
		Exit
	Else

		$posX = WinGetPos("Among Us")[0]
		$posY = WinGetPos("Among Us")[1]
		If($posX = 0 and $posY = 0) Then
			WinMove($mainGUI,"",$posX,$posY)
		Else
			WinMove($mainGUI,"",WinGetPos("Among Us")[0]+8,WinGetPos("Among Us")[1]+31)
		EndIf
	EndIf

	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
	EndSwitch
WEnd
