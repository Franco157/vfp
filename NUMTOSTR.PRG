parameters PVALOR
priv LVALOR, LLARGO, LLETRA
LLETRA = ''
LVALOR = alltrim(str(int(PVALOR)))
LLARGO = len(LVALOR)
LLARGO = iif(mod(LLARGO,3)=0,LLARGO,(int(LLARGO/3)+1)*3)
LVALOR = padl(LVALOR,LLARGO)

for BUCLE = 1 to LLARGO step 3
	LPARTE = val(substr(LVALOR,BUCLE,3))
	do case
	case LPARTE > 100
		do PROCNUMC
	case LPARTE = 100
		LLETRA = LLETRA + " CIEN"
	endcase
	LPARTE = LPARTE - int(LPARTE/100)*100
	if LPARTE>0
		LLETRA = LLETRA + " "
		do case
		case LPARTE = 1
			LLETRA = LLETRA + iif(BUCLE+2=LLARGO,"UNO","UN")
		case between(LPARTE,1,29)
			do PROCNUMU
		case LPARTE>29
			do PROCNUMD
		endcase
	endif
	do case
	case LLARGO-BUCLE-2 = 3
		LLETRA = LLETRA + iif(val(substr(LVALOR,BUCLE,3))=0,""," MIL")
	case LLARGO-BUCLE-2=6
		LLETRA = LLETRA + iif(val(substr(LVALOR,BUCLE,3))=1," MILLON"," MILLONES")
	endcase
endfor
if int(PVALOR)#PVALOR
	LLETRA = LLETRA + " CON " + str((PVALOR-int(PVALOR))*100,2)+" CTVOS"
endif
return (LLETRA)


procedure PROCNUMU
do while LPARTE>0
	if LPARTE<10
		do case
		case LPARTE = 1
			LLETRA = LLETRA+"UNO"
		case LPARTE = 2
			LLETRA = LLETRA+"DOS"
		case LPARTE = 3
			LLETRA = LLETRA+"TRES"
		case LPARTE = 4
			LLETRA = LLETRA+"CUATRO"
		case LPARTE = 5
			LLETRA = LLETRA+"CINCO"
		case LPARTE = 6
			LLETRA = LLETRA+"SEIS"
		case LPARTE = 7
			LLETRA = LLETRA+"SIETE"
		case LPARTE = 8
			LLETRA = LLETRA+"OCHO"
		case LPARTE = 9
			LLETRA = LLETRA+"NUEVE"
		endcase
		LPARTE=0
	else
		if LPARTE<20
			do case
			case LPARTE=10
				LLETRA = LLETRA + "DIEZ"
			case LPARTE=11
				LLETRA = LLETRA + "ONCE"
			case LPARTE=12
				LLETRA = LLETRA + "DOCE"
			case LPARTE=13
				LLETRA = LLETRA + "TRECE"
			case LPARTE=14
				LLETRA = LLETRA + "CATORCE"
			case LPARTE=15
				LLETRA = LLETRA + "QUINCE"
			other
				LLETRA = LLETRA + "DIECI"
			endcase
			if LPARTE<16
				LPARTE=0
			else
				LPARTE=LPARTE-10
			endif
		else
			do case
			case LPARTE=20
				LLETRA=LLETRA+"VEINTE"
			case LPARTE=21
				LLETRA=LLETRA+"VEINTIUN"
				LLETRA = LLETRA + iif(BUCLE+2=LLARGO,"O","")
			other
				LLETRA = LLETRA+"VEINTI"
			endcase
			if LPARTE<22
				LPARTE=0
			else
				LPARTE=LPARTE-20
			endif
		endif
	endif
enddo
return

procedure  PROCNUMD
do case
case int(LPARTE/10)=3
	LLETRA=LLETRA+"TREINTA"
case int(LPARTE/10)=4
	LLETRA=LLETRA+"CUARENTA"
case int(LPARTE/10)=5
	LLETRA=LLETRA+"CINCUENTA"
case int(LPARTE/10)=6
	LLETRA=LLETRA+"SESENTA"
case int(LPARTE/10)=7
	LLETRA=LLETRA+"SETENTA"
case int(LPARTE/10)=8
	LLETRA=LLETRA+"OCHENTA"
case int(LPARTE/10)=9
	LLETRA=LLETRA+"NOVENTA"
endcase
if int(LPARTE/10)#LPARTE/10
	LLETRA = LLETRA + " Y "
	LPARTE=LPARTE-int(LPARTE/10)*10
	do PROCNUMU
endif
return

procedure PROCNUMC
do case
case int(LPARTE/100)=1
	LLETRA=LLETRA+" CIENTO"
case int(LPARTE/100)=2
	LLETRA=LLETRA+" DOSCIENTOS"
case int(LPARTE/100)=3
	LLETRA=LLETRA+" TRESCIENTOS"
case int(LPARTE/100)=4
	LLETRA=LLETRA+" CUATROCIENTOS"
case int(LPARTE/100)=5
	LLETRA=LLETRA+" QUINIENTOS"
case int(LPARTE/100)=6
	LLETRA=LLETRA+" SEISCIENTOS"
case int(LPARTE/100)=7
	LLETRA=LLETRA+" SETECIENTOS"
case int(LPARTE/100)=8
	LLETRA=LLETRA+" OCHOCIENTOS"
case int(LPARTE/100)=9
	LLETRA=LLETRA+" NOVECIENTOS"
endcase
return




