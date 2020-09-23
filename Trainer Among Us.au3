#NoTrayIcon
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include<NomadMemory.au3>
#include<_ModuleBase.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Hack AmongUS by KidP2H", 199, 39, 403, 227)
$active = GUICtrlCreateButton(" Giet nguoi hang loat max speed =))", 8, 8, 179, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $active
			$pId = WinGetProcess("Among Us")
			$hWnd = _MemoryOpen($pId)
			$address4ByteFirst = _ProcessGetModuleBase($pId,"GameAssembly.dll")+0x212B9A
			$address1ByteLast  = _ProcessGetModuleBase($pId,"GameAssembly.dll")+0x212B9E
			_MemoryWrite($address4ByteFirst,$hWnd,0x90909090)
			_MemoryWrite($address1ByteLast,$hWnd,0x5A84A190)
	EndSwitch
WEnd
