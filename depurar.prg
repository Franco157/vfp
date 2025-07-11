* Programa Para depurar la aplicacion
set safe off
set talk off
clear all
close all

_Screen.Caption = "DEPURAR"

ON ERROR DO manerror WITH ;
	ERROR(), MESSAGE(), MESSAGE(1), PROGRAM(), LINENO()
set classlib to Marco
set procedure to clases, rutinas
SET PATH TO DATOS\
oApp = createObject("aplicacion","ammba",.F.,"AMMBA")
return
modi 

