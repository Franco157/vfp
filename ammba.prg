* Programa Principal del Sistema Prestacional
set safe off
set talk off
clear all
close all

_Screen.Caption = "AMMBA"
_Screen.Icon = "AMMBAjor.ico"
_screen.picture="AMMBA.JPG"

ON ERROR DO manerror WITH ;
	ERROR(), MESSAGE(), MESSAGE(1), PROGRAM(), LINENO()
set classlib to Marco
set procedure to clases, rutinas
SET PATH TO DATOS\;SISTEMA\
oApp = createObject("aplicacion","ammba",.F.,"AMMBA")
on shutdown oApp.Terminar()
oApp.Iniciar()
on shutdown
set classlib to
set procedure to
_Screen.Icon = ""
_Screen.Caption = "Microsoft Visual FoxPro"
ON ERROR
return


