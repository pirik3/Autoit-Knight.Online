#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include "_ImageSearch_UDF.au3"

;========================================================================================================================================
;
; 1] Knight Online 'in "Window Mode" 'da calismasi lazim
; 2] Scite script editorun veya .exe haline compile yaptiysaniz, herhangibirinin
;     "Admin" alarak calistirilmasi gerek.
; 3] Kodlar calisiyor, eger sizde calismadiysa koordinatlarin degismesi gerekecektir,
;     koordinatlarinizi "Autoit Window Info" programi ile kontrol edebilirsiniz,
; 3.1] "Autoit Window Info" acin, [ Options -> Coord Mode -> Window ] ayarini ve
;       [ Options -> Mahnify ] ayarini seciniz. "Autoit Window Info" penceresinde,
;       SAG <-> SOL oklar araciligi ile tabbar 'i "Mouse" secenegine getiriniz.
;       Daha sonra "Autoit Window Info" penceresinde
;       "Finder Tool" araciligi ile koordinatlariniz kontrol edebilirsiniz.
; 4] Script 'in bulundugu dizinde "icons" klasoru aciniz, iconlar buradan taranacak.
; 5] Script "_ImageSearch_UDF.au3" kullanmakta image_search yapabilmek icin, bu dosyanin
;     Script ile ayni klasorde bulunmasi gerekiyor.
; 6] Calistimak istediginiz fonksiyonu "While $Dongu" 'sunun icine ekleyiniz, fonksiyonu editlemeniz gerekebilir calistirdiktan sonra.
; 7] Bazi fonksiyonlari tamamlayamadim denemek icin zamanim olmadigindan, ilerleyen zamanlarda umarim tamamlayabilirim.
; 8] GUI eklemeyi dusunmuyorum ama eklemek isteyen olursa, ornek ekliyorum dosyanin icine hem fikir olur hemde belki gelistiren olabilir.
; 9] Autoit kod yazmaya yeni baslayanlar icin bence hem cok zevkli hemde basit bir script dilidir, dokumasyonlari cok fazla.
;    Otomasyon isleri benim osuma gidiyor.
;
;;;;;;;;;;;;;;;;;;;;;;;__ OnlineHile.com __ pirik3 __;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; **** Esc butonu ile Script 'i kapat, "pause/break" butonu ile Script 'i "durdur/baslat". ****
;=========================================================================================================================================

Global $Dongu = True

HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
;=======================================
Local $_Image_1 = @ScriptDir & "\icons\char-koordinat.png"
Local $_Image_2 = @ScriptDir & "\icons\charnick.png"
Local $_Image_3 = @ScriptDir & "\icons\town.png"
;=======================================
MsgBox(0, 'Bilgilendirme?', "Esc butonu ile Script 'i kapat, [pause/break] butonu ile Script 'i (durdur/baslat).")

MsgBox(0, 'Char Koordinat?', 'Charin bulundugu koordinat bolgesini, olabilecek en kucuk sekilde cerceveleyiniz.')
_ImageSearch_Create_BMP($_Image_1)

MsgBox(0, 'Char Nick/ID?', 'Charin Nick/ID kisimini "SARI" renkli iken aliniz, [char uzerinde yazan] -> [Partyden cikarsa kullanilacak], olabilecek en kucuk sekilde cerceveleyiniz.')
_ImageSearch_Create_BMP($_Image_2)
;=======================================


While 1

	While $Dongu = True

		Local $pencere = ("Knight OnLine Client")
		Local $koord = WinGetPos($pencere)

		;HP_pot()
		;MP_pot()
		;Party_bozulursa()
		Koordinat_degisirse()

	WEnd
WEnd

Func wolf()
	Local $_Image_1 = @ScriptDir & "\icons\wolf.png"
	Local $return = _ImageSearch_Area($_Image_1, $koord[0] + 274, $koord[1] + 26, $koord[0] + 740, $koord[1] + 60, 150)
	If $return[0] = 0 Then
		Send("9")
		Sleep(1000)
	Else
		ConsoleWrite("Wolf var." & @CRLF)
	EndIf
EndFunc   ;==>wolf

Func HP_pot() ; koordinat = 30, 62 ==== 220, 62 __ color = 0xFF0C10 = 190 pixel 'in % 'leri alinacak. Daha sonra + 30 pixel from edge '0' dan dolayi eklemesi gerek/
	Local $90_hp = PixelSearch($koord[0] + 201, $koord[1] + 62, $koord[0] + 201, $koord[1] + 62, 0xFF0C10)
	Local $80_hp = PixelSearch($koord[0] + 182, $koord[1] + 62, $koord[0] + 182, $koord[1] + 62, 0xFF0C10)
	Local $70_hp = PixelSearch($koord[0] + 163, $koord[1] + 62, $koord[0] + 163, $koord[1] + 62, 0xFF0C910)
	Local $60_hp = PixelSearch($koord[0] + 144, $koord[1] + 62, $koord[0] + 144, $koord[1] + 62, 0xFF0C10)
	Local $50_hp = PixelSearch($koord[0] + 215, $koord[1] + 62, $koord[0] + 215, $koord[1] + 62, 0xFF0C10)
	If $80_hp = False Then
		Send("1")
		Sleep(1000)
	EndIf
EndFunc   ;==>HP_pot

Func MP_pot() ; koordinat = 30, 79 ==== 220, 79 __ color = 0x174DFF = 190 pixel 'in % 'leri alinacak. + 30 pixel from edge '0' dan dolayi eklemesi gerek.
	Local $90_mp = PixelSearch($koord[0] + 201, $koord[1] + 79, $koord[0] + 201, $koord[1] + 79, 0x174DFF)
	Local $80_mp = PixelSearch($koord[0] + 182, $koord[1] + 79, $koord[0] + 182, $koord[1] + 79, 0x174DFF)
	Local $70_mp = PixelSearch($koord[0] + 163, $koord[1] + 79, $koord[0] + 163, $koord[1] + 79, 0x174DFF)
	Local $60_mp = PixelSearch($koord[0] + 144, $koord[1] + 79, $koord[0] + 144, $koord[1] + 79, 0x174DFF)
	Local $50_mp = PixelSearch($koord[0] + 215, $koord[1] + 79, $koord[0] + 215, $koord[1] + 79, 0x174DFF)
	If $80_mp = False Then
		Send("2")
		Sleep(1000)
	EndIf
EndFunc   ;==>MP_pot

Func Party_bozulursa()

	Local $nick = _ImageSearch_Area($_Image_2, $koord[0]+410, $koord[1]+334, $koord[0]+607, $koord[1]+394, 100)
	;Local $town = _ImageSearch($_Image_3)

	If $nick[0] = 1 Then
		ConsoleWrite("Char OK.." & @CRLF)
	Else
		ConsoleWrite("Partiden cikildi." & @CRLF)
		;MouseMove($town[1], $town[2])
		;MouseDown("Left") ;Knight online'da mouseclick islemiyor, o nedenle mousedown ve mouseup kullaniyorum.
		;Sleep(10)
		;MouseUp("Left")
		Send("!{TAB}")  ; ALT + TAB -> Gonder.
		$Dongu = False ; Donguyu durdur
		Send("{ESC}") ; Script kapat
	EndIf

EndFunc   ;==>Party_bozulursa

Func Koordinat_degisirse()

	Local $char_koordinat = _ImageSearch_Area($_Image_1, $koord[0]+59, $koord[1]+96, $koord[0]+200, $koord[1]+120, 150)
	Local $town = _ImageSearch($_Image_3)

	If $char_koordinat[0] = 1 Then
		ConsoleWrite("Char Koordinatlari Ayni.." & @CRLF)
	Else
		ConsoleWrite("Koordinatlar degisti, Town atilacak veya Script durdurulacak." & @CRLF)
		Sleep(100)
		;MouseMove($town[1], $town[2])
		Sleep(100)
		;MouseDown("Left") ; Knight online'da mouseclick islemiyor, o nedenle mousedown ve mouseup kullaniyorum.
		Sleep(10)
		;MouseUp("Left")

		$Dongu = False ; Donguyu durdur
		Send("{ESC}") ; Script kapat

	EndIf
EndFunc   ;==>Koordinat_degisirse

Func Event_FT()
	Local $FT_pixel_anounce = PixelSearch($koord[0] + "707", $koord[1] + "34", $koord[0] + "707", $koord[1] + "34", 0x917752)
	If $FT_pixel_anounce = False Then
		ToolTip('Script(Mouse) Aktif', 0, 0)
		ConsoleWrite($koord[0] & " / " & $koord[1] & @CRLF)
		MouseDown("Left")     ; FT bildirisi gecmeden once mouse basili tutuyor.
	Else
		MouseUp("Left")                                       ; FT bildirisi gectiginde, bildirinin ciktigi ilk pixel'i almaniz gerekir ki,
		ConsoleWrite("FT Anouncement Gecildi..." & @CRLF)     ; bildirinin gectigi anlasilsin ve en yakin surede butonu biraksin.
		$Dongu = False
		ToolTip('Script(Mouse) Pasif', 0, 0)
	EndIf
EndFunc   ;==>Event_FT

Func Event_JR()
EndFunc   ;==>Event_JR

Func Event_BorderDW()
EndFunc   ;==>Event_BorderDW

Func Attack()
EndFunc   ;==>Attack

Func Priest_AC_Buff_CureAl()
EndFunc   ;==>Priest_AC_Buff_CureAl

Func RPR()
EndFunc   ;==>RPR

Func TS()
EndFunc   ;==>TS


Func TogglePause()
	If $Dongu = True Then
		$Dongu = False
		ToolTip('Script(Mouse) Pasif', 0, 0)
	Else
		$Dongu = True
		ToolTip('Script(Mouse) Aktif', 0, 0)
	EndIf
EndFunc   ;==>TogglePause

Func Terminate()
	Exit 0
EndFunc   ;==>Terminate
