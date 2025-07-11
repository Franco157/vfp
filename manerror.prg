LPARAMETERS pNroError, pTxtMensaje, pTxtAclara, pTxtPrograma, pNroLinea
ON error
pNroError = iif(type("pNroError")="N",pNroError,-1)
pTxtMensaje = iif(type("pTxtMensaje")="C",pTxtMensaje,"")
pTxtAclara = iif(type("pTxtAclara")="C",pTxtAclara,"")
pNroLinea = iif(type("pNroLinea")="N",pNroLinea,-1)
pTxtPrograma = iif(type("pTxtPrograma")="C",pTxtPrograma,"")
LOCAL nAreaActual, aListaERR, lIndicel, lPregRet
LOCAL array aListaERR[1,1]
lPregRet = ""
nAreaActual = select()
SELE 0
IF not file("LGERRGEN.DBF")
	CREATE TABLE lgerrgen FREE (;
		USUARIO C(3) NULL,;
		FECHA D(8) NULL,;
		HORA C(8) NULL,;
		ERRORID N(8,0) NULL,;
		MENSAJE C(50) NULL,;
		DETALLE C(50) NULL,;
		PROGRAMA C(30) NULL,;
		LINEA N(6,0) NULL)
ENDIF

IF not file("LGERRAUT.DBF")
	CREATE TABLE lgerraut FREE (;
		USUARIO C(3) NULL,;
		FECHA D(8) NULL,;
		HORA C(8) NULL,;
		ERRORID N(8,0) NULL,;
		MENSAJE C(50) NULL,;
		DETALLE C(50) NULL,;
		PROGRAMA C(30) NULL,;
		LINEA N(6,0) NULL)
ENDIF

IF not file("LGERRSYS.DBF")
	CREATE TABLE lgerrsys FREE (;
		NUMERO C(30) NULL,;
		MENSAJE C(40) NULL,;
		ACLARA C(40) NULL,;
		DETALLE1 C(60) NULL,;
		DETALLE2 C(60) NULL,;
		DETALLE3 C(60) NULL,;
		NOTA C(40) NULL,;
		FECHA D(8) NULL,;
		HORA C(8) NULL)
ENDIF
USE

INSERT into lgerrgen (FECHA, HORA, ERRORID, MENSAJE, DETALLE, PROGRAMA,LINEA) ;
	values ;
	(date(), time(), pNroError, pTxtMensaje, pTxtAclara, pTxtPrograma, pNroLinea)
IF used("LGERRGEN")
	USE in lgerrgen
ENDIF

SELE (nAreaActual)

* Errores contemplados
DO case
CASE pNroError = 108
	lPregRet = 'Hay Otra Persona Usando el Archivo (108)'
	INSERT into lgerraut (FECHA, HORA, ERRORID, MENSAJE, DETALLE, PROGRAMA,LINEA) ;
		values ;
		(date(), time(), pNroError, pTxtMensaje, pTxtAclara, pTxtPrograma, pNroLinea)
	IF used("LGERRAUT")
		USE in lgerraut
	ENDIF
CASE pNroError = 109
	lPregRet = 'Hay Otra Persona Usando el Registro (109)'
	INSERT into lgerraut (FECHA, HORA, ERRORID, MENSAJE, DETALLE, PROGRAMA,LINEA) ;
		values ;
		(date(), time(), pNroError, pTxtMensaje, pTxtAclara, pTxtPrograma, pNroLinea)
	IF used("LGERRAUT")
		USE in lgerraut
	ENDIF
CASE pNroError = 110
	lPregRet = 'Hay Otra Persona Usando el Archivo (110)'
	INSERT into lgerraut (FECHA, HORA, ERRORID, MENSAJE, DETALLE, PROGRAMA,LINEA) ;
		values ;
		(date(), time(), pNroError, pTxtMensaje, pTxtAclara, pTxtPrograma, pNroLinea)
	IF used("LGERRAUT")
		USE in lgerraut
	ENDIF
CASE pNroError = 3        && ya se efectuo el USE del archivo
	lPregRet = 'Hay Otra Persona Usando el Archivo (3)'
	INSERT into lgerraut (FECHA, HORA, ERRORID, MENSAJE, DETALLE, PROGRAMA,LINEA) ;
		values ;
		(date(), time(), pNroError, pTxtMensaje, pTxtAclara, pTxtPrograma, pNroLinea)
	IF used("LGERRAUT")
		USE in lgerraut
	ENDIF
CASE pNroError = 1705     && atributo de read only
	lPregRet = 'Hay Otra Persona Usando el Archivo (1705)'
	INSERT into lgerraut (FECHA, HORA, ERRORID, MENSAJE, DETALLE, PROGRAMA,LINEA) ;
		values ;
		(date(), time(), pNroError, pTxtMensaje, pTxtAclara, pTxtPrograma, pNroLinea)
	IF used("LGERRAUT")
		USE in lgerraut
	ENDIF
CASE pNroError = 125
	lPregRet = 'La Impresora no est  lista. (125)'
	INSERT into lgerraut (FECHA, HORA, ERRORID, MENSAJE, DETALLE, PROGRAMA,LINEA) ;
		values ;
		(date(), time(), pNroError, pTxtMensaje, pTxtAclara, pTxtPrograma, pNroLinea)
	IF used("LGERRAUT")
		USE in lgerraut
	ENDIF
OTHERWISE
ENDCASE
*
AERROR(aListaERR)
IF type("aListaERR[1,1]") = "N"
	FOR lIndice = 1 to ALEN(aListaERR,1)
		m.NUMERO = iif(inlist(type("aListaERR["+alltrim(str(lIndice))+",1]"),"N","C"),padl(aListaERR[lIndice,1],30),"")
		m.MENSAJE = iif(inlist(type("aListaERR["+alltrim(str(lIndice))+",2]"),"N","C"),padl(aListaERR[lIndice,2],40),"")
		m.ACLARA = iif(inlist(type("aListaERR["+alltrim(str(lIndice))+",3]"),"N","C"),padl(aListaERR[lIndice,3],40),"")
		m.DETALLE1 = iif(inlist(type("aListaERR["+alltrim(str(lIndice))+",4]"),"N","C"),padl(aListaERR[lIndice,4],60),"")
		m.DETALLE2 = iif(inlist(type("aListaERR["+alltrim(str(lIndice))+",5]"),"N","C"),padl(aListaERR[lIndice,5],60),"")
		m.DETALLE3 = iif(inlist(type("aListaERR["+alltrim(str(lIndice))+",6]"),"N","C"),padl(aListaERR[lIndice,6],60),"")
		m.nota = iif(inlist(type("aListaERR["+alltrim(str(lIndice))+",7]"),"N","C"),padl(aListaERR[lIndice,7],40),"")
		m.FECHA = date()
		m.HORA = time()
		INSERT into lgerrsys (NUMERO, MENSAJE, ACLARA, DETALLE1, DETALLE2, DETALLE3, ;
			NOTA, FECHA, HORA)  VALUES (m.NUMERO, m.MENSAJE, m.ACLARA, ;
			m.DETALLE1, m.DETALLE2, m.DETALLE3, m.nota, m.FECHA, m.HORA)
	NEXT
ENDIF
IF used("lgerrsys")
	USE in lgerrsys
ENDIF



SELE (nAreaActual)
ON ERROR DO manerror WITH ;
	ERROR(), MESSAGE(), MESSAGE(1), PROGRAM(), LINENO()
IF empty(lPregRet)
	MESSAGEBOX(alltrim(str(pNroError))+": "+pTxtMensaje+" (El error esta registrado, Avise a sistemas)",0,"Seguimiento de Errores")
	IF type("_Screen.ActiveForm") = "O"
		_SCREEN.ActiveForm.Release
	ENDIF
&&	RETURN to master
	on shutdown
	clear events
ELSE
	IF messageBox(lPregRet,5,"Seguimiento de Errores") = 1
		RETRY
	ELSE
		IF type("_Screen.ActiveForm") = "O"
			_SCREEN.ActiveForm.Release
		ENDIF
&&		RETURN to master
		on shutdown
		clear events
	ENDIF
ENDIF
RETURN
