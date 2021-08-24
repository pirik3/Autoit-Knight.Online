#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include "_ImageSearch_UDF.au3"


;__ OnlineHile.com __ pirik3 __

; Esc butonu ile Script 'i kapat, "pause/break" butonu ile Script 'i "durdur/baslat".

Global $Dongu = True

HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")

While 1

	While $Dongu = True

		Local $pencere = ("Knight OnLine Client")
		Local $koord = WinGetPos($pencere)

		wolf()

		;ConsoleWrite($koord[0] & " / " & $koord9[1] & @CRLF)
	WEnd
WEnd

Func wolf()
	Local $_Image_1 = @ScriptDir & "\foto\wolf.png"
	Local $return = _ImageSearch_Area($_Image_1, $koord[0]+274, $koord[1]+26, $koord[0]+740, $koord[1]+60, 150)
	If $return[0] = 0 Then
		Send("9")
		Sleep(1000)
	Else
		ConsoleWrite("found" & @CRLF)
	EndIf
EndFunc

Func HP_pot() ; koordinat = 30, 62 ==== 220, 62 __ color = 0xFF0C10 = 190 + 30 pixel 'in % 'leri alinacak.
	Local $90_hp = PixelSearch($koord[0]+201, $koord[1]+62, $koord[0]+201, $koord[1]+62, 0xFF0C10)
	Local $80_hp = PixelSearch($koord[0]+182, $koord[1]+62, $koord[0]+182, $koord[1]+62, 0xFF0C10)
	Local $70_hp = PixelSearch($koord[0]+163, $koord[1]+62, $koord[0]+163, $koord[1]+62, 0xFF0C910)
	Local $60_hp = PixelSearch($koord[0]+144, $koord[1]+62, $koord[0]+144, $koord[1]+62, 0xFF0C10)
	Local $50_hp = PixelSearch($koord[0]+215, $koord[1]+62, $koord[0]+215, $koord[1]+62, 0xFF0C10)
	If $80_hp = False Then
		Send("1")
		Sleep(1000)
	EndIf
EndFunc

Func MP_pot() ; koordinat = 30, 79 ==== 220, 79 __ color = 0x174DFF = 190 + 30 pixel 'in % 'leri alinacak.
	Local $90_mp = PixelSearch($koord[0]+201, $koord[1]+79, $koord[0]+201, $koord[1]+79, 0x174DFF)
	Local $80_mp = PixelSearch($koord[0]+182, $koord[1]+79, $koord[0]+182, $koord[1]+79, 0x174DFF)
	Local $70_mp = PixelSearch($koord[0]+163, $koord[1]+79, $koord[0]+163, $koord[1]+79, 0x174DFF)
	Local $60_mp = PixelSearch($koord[0]+144, $koord[1]+79, $koord[0]+144, $koord[1]+79, 0x174DFF)
	Local $50_mp = PixelSearch($koord[0]+215, $koord[1]+79, $koord[0]+215, $koord[1]+79, 0x174DFF)
	If $80_mp = False Then
		Send("2")
		Sleep(1000)
	EndIf
EndFunc

Func RPR()
EndFunc

Func TS()
EndFunc

Func Party_bozulursa()
EndFunc

Func Event_FT()
	Local $FT_pixel_anounce = PixelSearch($koord[0] + "707", $koord[1] + "34", $koord[0] + "707", $koord[1] + "34", 0x917752)
	If $FT_pixel_anounce = False Then
			ToolTip('Script(Mouse) Aktif',0,0)
			ConsoleWrite($koord[0] & " / " & $koord[1] & @CRLF)
			MouseDown("Left") ; FT bildirisi gecmeden once mouse basili tutuyor.
		Else
			MouseUp("Left") 								  ; FT bildirisi gectiginde, bildirinin ciktigi ilk pixel'i almaniz gerekir ki,
			ConsoleWrite("FT Anouncement Gecildi..." & @CRLF) ; bildirinin gectigi anlasilsin ve en yakin surede butonu biraksin.
			$Dongu = False
			ToolTip('Script(Mouse) Pasif',0,0)
		EndIf
EndFunc

Func Event_JR()
EndFunc

Func Event_BorderDW()
EndFunc

Func Attack()
EndFunc



Func TogglePause()
    If $Dongu = True Then
        $Dongu = False
		ToolTip('Script(Mouse) Pasif',0,0)
    Else
        $Dongu = True
		ToolTip('Script(Mouse) Aktif',0,0)
    EndIf
EndFunc   ;==>TogglePause

Func Terminate()
    Exit 0
EndFunc   ;==>Terminate
