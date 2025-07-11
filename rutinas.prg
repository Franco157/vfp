
FUNCTION basearba()
PARAMETERS pcuit, prespons, pimporte
nporcrete=0

pclave=STR(YEAR(DATE()),4)+STR(MONTH(DATE()),2)+STRTRAN(pcuit,'-','')
pclave=STRTRAN(pclave,' ','0')
IF INDEXSEEK(pclave,.t.,'basearba','percuit')
	a=basearba.desde
	pdesde=CTOD(SUBSTR(a,1,2)+'/'+SUBSTR(a,3,2)+'/'+SUBSTR(a,5,4))
	a=basearba.hasta
	phasta=CTOD(SUBSTR(a,1,2)+'/'+SUBSTR(a,3,2)+'/'+SUBSTR(a,5,4))
	IF !BETWEEN(DATE(),pdesde,phasta)
		MESSAGEBOX('La fecha esta fuera del rango del archivo de ARBA')
	ENDIF
	nporcrete=basearba.alicuota	
ELSE
	MESSAGEBOX('CUIT no encontrado en base ARBA, no se hace la retención')
	RETURN 0.00
ENDIF

IF VAL(prespons)=1 AND pimporte>entorno.minarba*1.21
	RETURN ROUND(ROUND(pimporte/1.21,2)*nporcrete/100,2)
ELSE
	IF VAL(prespons)#1 AND pimporte>entorno.minarba
		RETURN ROUND(pimporte*nporcrete/100,2)
	ENDIF 
ENDIF 
RETURN 0.00

FUNCTION seekunid
PARAMETERS lcodigo, lprestad, lobrasoc
lobrasoc = IIF(TYPE("lObraSoc")="N",lobrasoc,_nros)
PRIVATE rvalor
rvalor = IIF(SEEK(STR(lobrasoc,4)+STR(lprestad,5)+lcodigo,"unidpre"),unidpre.val_unid,IIF(SEEK(lcodigo,"unidadnom"),unidadnom.valor,0))
RETURN (rvalor)


FUNCTION seekindex
PARAMETERS pexpresion, pbase, porden
USE (pbase) AGAIN NOUPDATE shared ALIAS indexseek ORDE (porden) IN 0
rexiste = SEEK(pexpresion,"indexseek")
USE IN indexseek
RETURN (rexiste)


FUNCTION seekvalue
PARAMETERS pexpresion, pbase, porden, pvalor
USE (pbase) AGAIN NOUPDATE shared ALIAS indexseek ORDE (porden) IN 0
rexiste = iif(SEEK(pexpresion,"indexseek"),evaluate("indexseek."+pvalor),iif(type("indexseek."+pvalor)="C","",iif(type("indexseek."+pvalor)="N",0,iif(type("indexseek."+pvalor)="D",{},.f.))))
USE IN indexseek
RETURN (rexiste)

FUNCTION NOMMES
lParameters lNumMes
do case
case lNumMes = 1
	txtMes = "Enero"
case lNumMes = 2
	txtMes = "Febrero"
case lNumMes = 3
	txtMes = "Marzo"
case lNumMes = 4
	txtMes = "Abril"
case lNumMes = 5
	txtMes = "Mayo"
case lNumMes = 6
	txtMes = "Junio"
case lNumMes = 7
	txtMes = "Julio"
case lNumMes = 8
	txtMes = "Agosto"
case lNumMes = 9
	txtMes = "Setiembre"
case lNumMes = 10
	txtMes = "Octubre"
case lNumMes = 11
	txtMes = "Noviembre"
case lNumMes = 12
	txtMes = "Diciembre"
other
	txtMes = ""
endcase
RETURN (txtMes)


function ShortDate
parameters lFecha
return iif(type("lFecha")="D",left(dtoc(lFecha),6)+right(dtoc(lFecha),2),"")

FUNCTION ValidarCBU(tcCBU)
  LOCAL lcCBU, lcBloque1, lcBloque2
  lcCBU = CHRTRAN(tcCBU,CHRTRAN(tcCBU,"1234567890",""),"")
  IF LEN(lcCBU) = 22
    lcBloque1 = SUBSTR(lcCBU, 1, 8)
    lcBloque2 = SUBSTR(lcCBU, 9, 14)
    RETURN ValidarDigito(lcBloque1) ;
     AND ValidarDigito(lcBloque2)
  ELSE
    RETURN .F. && Largo de CBU incorrecto
  ENDIF
ENDFUNC

*------------------------------------------------------------
* FUNCTION ValidarDigito(tcBloque)
*------------------------------------------------------------
* Valida Dígito Verificador
*------------------------------------------------------------
FUNCTION ValidarDigito(tcBloque)
  *-- Ponderador '9713'
  #DEFINE Pond '9713'
  LOCAL lnSuma, lnLargo, ln, lcDigito, lcBloque
  lnSuma = 0
  lnLargo = LEN(tcBloque)
  lcDigito = SUBSTR(tcBloque, lnLargo, 1)
  lcBloque = SUBSTR(tcBloque, 1, lnLargo - 1)
  FOR ln = 1 TO lnLargo - 1
    lnSuma = lnSuma + ;
      VAL(SUBSTR(lcBloque, lnLargo - ln, 1)) * ;
      VAL(SUBSTR(Pond, MOD(4-ln,4) + 1, 1))
  ENDFOR
  RETURN lcDigito = RIGHT(STR(10 - MOD(lnSuma, 10)),1)
ENDFUNC
*------------------------------------------------------------