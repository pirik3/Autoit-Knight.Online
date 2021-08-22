#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

;__ OnlineHile.com __ pirik3 __

; Esc butonu ile Script 'i kapat, "pause/break" butonu ile Script 'i "durdur/baslat".

Global $Dongu = True

HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")

While 1

	While $Dongu = True

		$pencere = ("Knight OnLine Client")
		$koord = WinGetPos($pencere)

		ConsoleWrite($koord[0] & " / " & $koord[1] & @CRLF)
		Sleep(1000)

		; $FT_pixel_anounce fonsiyonunu editlemelisiniz.

		$FT_pixel_anounce = PixelSearch($koord[0] + "707", $koord[1] + "34", $koord[0] + "707", $koord[1] + "34", 0x917752)

		; $FT_pixel_anounce pixelleri dogru degil, ben bunu FT olmadan yazdigimdan pixeli bulamadim, editlemeniz gerekiyor.
		; "Autoit v3 Window info" ile Bildirinin gectigi ilk pixeli almaniz gerek, en hizli sekilde mouse 'u birakmasi icin.
		; Script 'i baslatmadan once, KO 'da ekrani FT ye girilecek butona ayarlayiniz,
		; Script 'i baslatirken hemen KO penceresinde FT ye tiklanacak ve sonra birakilacak butona getirin imleci.
		; FT bildirisi gectiginde pixeli dogru aldiysaniz mouse sol click kendini birakcaktir.
		; Global pause/Exit ayarlamaya calistim ama KO penceresinde calismiyor,
		; belki key press algilama fonsiyonu ekleyebilirseniz isinizi gorecektir.

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
	WEnd

	Sleep(1000)
WEnd

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
    Exit
EndFunc   ;==>Terminate
