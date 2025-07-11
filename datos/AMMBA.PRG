* *********************************************************
* *
* * 04/22/05              AMMBA.DBC              09:02:37
* *
* *********************************************************
* *
* * Descripción:
* * Este programa lo ha generado automáticamente GENDBC
* * Versión 2.26.67
* *
* *********************************************************


DisplayStatus([Creando base de datos...])
CLOSE DATA ALL
CREATE DATABASE 'AMMBA.DBC'
DisplayStatus([Creando tabla BONOS...])
MakeTable_BONOS()
DisplayStatus([Creando tabla CTACTE...])
MakeTable_CTACTE()
DisplayStatus([Creando tabla PADBENE...])
MakeTable_PADBENE()
DisplayStatus([Creando tabla PADPREST...])
MakeTable_PADPREST()
DisplayStatus([Creando tabla PADPROFE...])
MakeTable_PADPROFE()
DisplayStatus([Creando tabla TABLAS...])
MakeTable_TABLAS()
DisplayStatus([Creando tabla MENSAJE...])
MakeTable_MENSAJE()
DisplayStatus([Creando vista VTABLA...])
MakeView_VTABLA()
DisplayStatus([Creando vista VBONO...])
MakeView_VBONO()
DisplayStatus([Creando vista VREPORTE...])
MakeView_VREPORTE()
DisplayStatus([Terminado.])


********* Volver a crear el procedimiento *********
IF !FILE([AMMBA.krt])
    ? [¡Advertencia! No se ha encontrado ningún archivo de procedimientos.]
ELSE
	CLOSE DATABASE
	USE 'AMMBA.DBC'
	g_SetSafety = SET('SAFETY')
	SET SAFETY OFF
	LOCATE FOR Objectname = 'StoredProceduresSource'
	IF FOUND()
        APPEND MEMO Code FROM [AMMBA.krt] OVERWRITE
	    REPLACE Code WITH SUBSTR(Code, 87, 173)
	ENDIF
	LOCATE FOR Objectname = 'StoredProceduresObject'
	IF FOUND()
        APPEND MEMO Code FROM [AMMBA.krt] OVERWRITE
        REPLACE Code WITH SUBSTR(Code, 260)
	ENDIF
    SET SAFETY &g_SetSafety
	USE
	OPEN DATABASE [AMMBA.DBC]
ENDIF

FUNCTION MakeTable_BONOS
***** Configuración de tabla para BONOS *****
CREATE TABLE 'BONOS.DBF' NAME 'BONOS' (CUPON N(8, 0) NOT NULL, ;
                    ORDEN N(2, 0) NOT NULL, ;
                    BENEFICIA N(8, 0) NOT NULL, ;
                    PRESTADOR N(4, 0) NOT NULL, ;
                    FECPRES D NOT NULL, ;
                    FECCARGA D NOT NULL, ;
                    MMLIQ N(2, 0) NOT NULL, ;
                    AAAALIQ N(4, 0) NOT NULL, ;
                    PRESTACION N(6, 0) NOT NULL, ;
                    SISTEMA C(1) NOT NULL, ;
                    TIPOPRES C(1) NOT NULL, ;
                    ZONA C(2) NOT NULL, ;
                    GASTOS N(12, 2) NOT NULL, ;
                    GALENO N(12, 2) NOT NULL, ;
                    CANTIDAD N(2, 0) NOT NULL, ;
                    LIQUIDADO C(1) NOT NULL, ;
                    DERIVO N(4, 0) NOT NULL, ;
                    AMMBA C(1) NOT NULL)

***** Crear cada índice para BONOS *****
SET COLLATE TO 'MACHINE'
INDEX ON CUPON*100+ORDEN TAG BONOS
INDEX ON STR(PRESTADOR,4)+DTOS(FECPRES) TAG FECHA

***** Cambiar propiedades para BONOS *****
ENDFUNC

FUNCTION MakeTable_CTACTE
***** Configuración de tabla para CTACTE *****
CREATE TABLE 'CTACTE.DBF' NAME 'CTACTE' (PRESTADOR N(4, 0) NOT NULL, ;
                     FECHA D NOT NULL, ;
                     TIPOMOV C(2) NOT NULL, ;
                     DESCMOV C(30) NOT NULL, ;
                     COMPRO N(8, 0) NOT NULL, ;
                     IMPORTE N(12, 2) NOT NULL)

***** Crear cada índice para CTACTE *****
SET COLLATE TO 'MACHINE'
INDEX ON STR(PRESTADOR,4)+DTOS(FECHA) TAG CTACTE

***** Cambiar propiedades para CTACTE *****
ENDFUNC

FUNCTION MakeTable_PADBENE
***** Configuración de tabla para PADBENE *****
CREATE TABLE 'PADBENE.DBF' NAME 'PADBENE' (DOCUMENTO N(8, 0) NOT NULL, ;
                      NOMBRE C(30) NOT NULL)

***** Crear cada índice para PADBENE *****
SET COLLATE TO 'MACHINE'
INDEX ON DOCUMENTO TAG DOCUMENTO
INDEX ON NOMBRE TAG NOMBRE

***** Cambiar propiedades para PADBENE *****
DBSETPROP('PADBENE.NOMBRE', 'Field', 'Format', "!")
ENDFUNC

FUNCTION MakeTable_PADPREST
***** Configuración de tabla para PADPREST *****
CREATE TABLE 'PADPREST.DBF' NAME 'PADPREST' (PRESTACION N(6, 0) NOT NULL, ;
                       DESCRIP C(30) NOT NULL, ;
                       GALENO N(10, 3) NOT NULL, ;
                       GASTOS N(10, 3) NOT NULL)

***** Crear cada índice para PADPREST *****
SET COLLATE TO 'MACHINE'
INDEX ON PRESTACION TAG PRESTACION
INDEX ON DESCRIP TAG DESCRIP

***** Cambiar propiedades para PADPREST *****
DBSETPROP('PADPREST.DESCRIP', 'Field', 'Format', "!")
ENDFUNC

FUNCTION MakeTable_PADPROFE
***** Configuración de tabla para PADPROFE *****
CREATE TABLE 'PADPROFE.DBF' NAME 'PADPROFE' (PRESTADOR N(4, 0) NOT NULL, ;
                       NOMBRE C(30) NOT NULL, ;
                       DOMICILIO C(30) NOT NULL, ;
                       LOCALIDAD C(30) NOT NULL, ;
                       TELEFONO C(20) NOT NULL, ;
                       TIPOPRES C(1) NOT NULL, ;
                       ESPECIAL C(2) NOT NULL, ;
                       TIPOMAT C(2) NOT NULL, ;
                       MATRICULA N(7, 0) NOT NULL, ;
                       DESCJUBI N(5, 2) NOT NULL, ;
                       DESCADMI N(5, 2) NOT NULL, ;
                       DESCOTR3 N(5, 2) NOT NULL, ;
                       DESCOTR4 N(5, 2) NOT NULL, ;
                       MENFIJA N(12, 2) NOT NULL, ;
                       SALDO N(12, 2) NOT NULL)

***** Crear cada índice para PADPROFE *****
SET COLLATE TO 'MACHINE'
INDEX ON NOMBRE TAG NOMBRE
INDEX ON PRESTADOR TAG PRESTADOR

***** Cambiar propiedades para PADPROFE *****
DBSETPROP('PADPROFE.NOMBRE', 'Field', 'Format', "!")
ENDFUNC

FUNCTION MakeTable_TABLAS
***** Configuración de tabla para TABLAS *****
CREATE TABLE 'TABLAS.DBF' NAME 'TABLAS' (PREFIJO C(1) NOT NULL, ;
                     CLAVE C(2) NOT NULL, ;
                     DESCRIP C(30) NOT NULL)

***** Crear cada índice para TABLAS *****
SET COLLATE TO 'MACHINE'
INDEX ON PREFIJO+CLAVE TAG TABLA

***** Cambiar propiedades para TABLAS *****
ENDFUNC

FUNCTION MakeTable_MENSAJE
***** Configuración de tabla para MENSAJE *****
CREATE TABLE 'MENSAJE.DBF' NAME 'MENSAJE' (ACTIVO L NOT NULL, ;
                      PUESTO C(30) NOT NULL, ;
                      USUARIO C(30) NOT NULL, ;
                      MENSAJE C(80) NOT NULL, ;
                      DIA_SOL D NOT NULL, ;
                      HORA_SOL C(5) NOT NULL, ;
                      DIA_INI D NOT NULL, ;
                      HORA_INI C(5) NOT NULL, ;
                      DIA_FIN D NOT NULL, ;
                      HORA_FIN C(5) NOT NULL, ;
                      CLAVE_ID C(12) NOT NULL)

***** Crear cada índice para MENSAJE *****

***** Cambiar propiedades para MENSAJE *****
ENDFUNC

FUNCTION MakeView_VTABLA
***************** Ver la configuración para VTABLA ***************

CREATE SQL VIEW "VTABLA" ; 
   AS SELECT Tablas.clave, Tablas.descrip FROM ammba!tablas WHERE Tablas.prefijo = ?critPrefijo

DBSetProp('VTABLA', 'View', 'UpdateType', 1)
DBSetProp('VTABLA', 'View', 'WhereType', 3)
DBSetProp('VTABLA', 'View', 'FetchMemo', .T.)
DBSetProp('VTABLA', 'View', 'SendUpdates', .F.)
DBSetProp('VTABLA', 'View', 'UseMemoSize', 255)
DBSetProp('VTABLA', 'View', 'FetchSize', 100)
DBSetProp('VTABLA', 'View', 'MaxRecords', -1)
DBSetProp('VTABLA', 'View', 'Tables', 'ammba!tablas')
DBSetProp('VTABLA', 'View', 'Prepared', .F.)
DBSetProp('VTABLA', 'View', 'CompareMemo', .T.)
DBSetProp('VTABLA', 'View', 'FetchAsNeeded', .F.)
DBSetProp('VTABLA', 'View', 'FetchSize', 100)
DBSetProp('VTABLA', 'View', 'Comment', "")
DBSetProp('VTABLA', 'View', 'BatchUpdateCount', 1)
DBSetProp('VTABLA', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for VTABLA
* Props for the VTABLA.clave field.
DBSetProp('VTABLA.clave', 'Field', 'KeyField', .F.)
DBSetProp('VTABLA.clave', 'Field', 'Updatable', .T.)
DBSetProp('VTABLA.clave', 'Field', 'UpdateName', 'ammba!tablas.clave')
DBSetProp('VTABLA.clave', 'Field', 'DataType', "C(2)")
* Props for the VTABLA.descrip field.
DBSetProp('VTABLA.descrip', 'Field', 'KeyField', .F.)
DBSetProp('VTABLA.descrip', 'Field', 'Updatable', .T.)
DBSetProp('VTABLA.descrip', 'Field', 'UpdateName', 'ammba!tablas.descrip')
DBSetProp('VTABLA.descrip', 'Field', 'DataType', "C(30)")
ENDFUNC
 
FUNCTION MakeView_VBONO
***************** Ver la configuración para VBONO ***************

CREATE SQL VIEW "VBONO" ; 
   AS SELECT * FROM ammba!bonos WHERE Bonos.cupon = ?crCupon   AND Bonos.orden = ?crOrden

DBSetProp('VBONO', 'View', 'UpdateType', 1)
DBSetProp('VBONO', 'View', 'WhereType', 3)
DBSetProp('VBONO', 'View', 'FetchMemo', .T.)
DBSetProp('VBONO', 'View', 'SendUpdates', .T.)
DBSetProp('VBONO', 'View', 'UseMemoSize', 255)
DBSetProp('VBONO', 'View', 'FetchSize', 100)
DBSetProp('VBONO', 'View', 'MaxRecords', -1)
DBSetProp('VBONO', 'View', 'Tables', 'ammba!bonos')
DBSetProp('VBONO', 'View', 'Prepared', .F.)
DBSetProp('VBONO', 'View', 'CompareMemo', .T.)
DBSetProp('VBONO', 'View', 'FetchAsNeeded', .F.)
DBSetProp('VBONO', 'View', 'FetchSize', 100)
DBSetProp('VBONO', 'View', 'Comment', "")
DBSetProp('VBONO', 'View', 'BatchUpdateCount', 1)
DBSetProp('VBONO', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for VBONO
* Props for the VBONO.cupon field.
DBSetProp('VBONO.cupon', 'Field', 'KeyField', .T.)
DBSetProp('VBONO.cupon', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.cupon', 'Field', 'UpdateName', 'ammba!bonos.cupon')
DBSetProp('VBONO.cupon', 'Field', 'DataType', "N(8)")
* Props for the VBONO.orden field.
DBSetProp('VBONO.orden', 'Field', 'KeyField', .T.)
DBSetProp('VBONO.orden', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.orden', 'Field', 'UpdateName', 'ammba!bonos.orden')
DBSetProp('VBONO.orden', 'Field', 'DataType', "N(2)")
* Props for the VBONO.beneficia field.
DBSetProp('VBONO.beneficia', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.beneficia', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.beneficia', 'Field', 'UpdateName', 'ammba!bonos.beneficia')
DBSetProp('VBONO.beneficia', 'Field', 'DataType', "N(8)")
* Props for the VBONO.prestador field.
DBSetProp('VBONO.prestador', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.prestador', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.prestador', 'Field', 'UpdateName', 'ammba!bonos.prestador')
DBSetProp('VBONO.prestador', 'Field', 'DataType', "N(4)")
* Props for the VBONO.fecpres field.
DBSetProp('VBONO.fecpres', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.fecpres', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.fecpres', 'Field', 'UpdateName', 'ammba!bonos.fecpres')
DBSetProp('VBONO.fecpres', 'Field', 'DataType', "D")
* Props for the VBONO.feccarga field.
DBSetProp('VBONO.feccarga', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.feccarga', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.feccarga', 'Field', 'UpdateName', 'ammba!bonos.feccarga')
DBSetProp('VBONO.feccarga', 'Field', 'DataType', "D")
* Props for the VBONO.mmliq field.
DBSetProp('VBONO.mmliq', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.mmliq', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.mmliq', 'Field', 'UpdateName', 'ammba!bonos.mmliq')
DBSetProp('VBONO.mmliq', 'Field', 'DataType', "N(2)")
* Props for the VBONO.aaaaliq field.
DBSetProp('VBONO.aaaaliq', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.aaaaliq', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.aaaaliq', 'Field', 'UpdateName', 'ammba!bonos.aaaaliq')
DBSetProp('VBONO.aaaaliq', 'Field', 'DataType', "N(4)")
* Props for the VBONO.prestacion field.
DBSetProp('VBONO.prestacion', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.prestacion', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.prestacion', 'Field', 'UpdateName', 'ammba!bonos.prestacion')
DBSetProp('VBONO.prestacion', 'Field', 'DataType', "N(6)")
* Props for the VBONO.sistema field.
DBSetProp('VBONO.sistema', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.sistema', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.sistema', 'Field', 'UpdateName', 'ammba!bonos.sistema')
DBSetProp('VBONO.sistema', 'Field', 'DataType', "C(1)")
* Props for the VBONO.tipopres field.
DBSetProp('VBONO.tipopres', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.tipopres', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.tipopres', 'Field', 'UpdateName', 'ammba!bonos.tipopres')
DBSetProp('VBONO.tipopres', 'Field', 'DataType', "C(1)")
* Props for the VBONO.zona field.
DBSetProp('VBONO.zona', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.zona', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.zona', 'Field', 'UpdateName', 'ammba!bonos.zona')
DBSetProp('VBONO.zona', 'Field', 'DataType', "C(2)")
* Props for the VBONO.gastos field.
DBSetProp('VBONO.gastos', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.gastos', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.gastos', 'Field', 'UpdateName', 'ammba!bonos.gastos')
DBSetProp('VBONO.gastos', 'Field', 'DataType', "N(12,2)")
* Props for the VBONO.galeno field.
DBSetProp('VBONO.galeno', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.galeno', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.galeno', 'Field', 'UpdateName', 'ammba!bonos.galeno')
DBSetProp('VBONO.galeno', 'Field', 'DataType', "N(12,2)")
* Props for the VBONO.cantidad field.
DBSetProp('VBONO.cantidad', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.cantidad', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.cantidad', 'Field', 'UpdateName', 'ammba!bonos.cantidad')
DBSetProp('VBONO.cantidad', 'Field', 'DataType', "N(2)")
* Props for the VBONO.liquidado field.
DBSetProp('VBONO.liquidado', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.liquidado', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.liquidado', 'Field', 'UpdateName', 'ammba!bonos.liquidado')
DBSetProp('VBONO.liquidado', 'Field', 'DataType', "C(1)")
* Props for the VBONO.derivo field.
DBSetProp('VBONO.derivo', 'Field', 'KeyField', .F.)
DBSetProp('VBONO.derivo', 'Field', 'Updatable', .T.)
DBSetProp('VBONO.derivo', 'Field', 'UpdateName', 'ammba!bonos.derivo')
DBSetProp('VBONO.derivo', 'Field', 'DataType', "N(4)")
ENDFUNC
 
FUNCTION MakeView_VREPORTE
***************** Ver la configuración para VREPORTE ***************

CREATE SQL VIEW "VREPORTE" ; 
   AS SELECT Bonos.cupon, Bonos.orden, Bonos.beneficia, Bonos.prestador,  Bonos.fecpres, Bonos.feccarga, Bonos.mmliq, Bonos.aaaaliq,  Bonos.prestacion, Bonos.sistema, Bonos.tipopres, Bonos.zona, Bonos.gastos,  Bonos.galeno, Bonos.cantidad, Bonos.liquidado,  Padprest.descrip AS nomprac, Padbene.nombre AS nombene,  Padprofe.tipopres AS tipoprof, Padprofe.especial,  Padprofe.nombre AS nomprof FROM  ammba!bonos INNER JOIN ammba!padprest    INNER JOIN ammba!padbene    INNER JOIN ammba!padprofe    ON  Bonos.prestador = Padprofe.prestador    ON  Bonos.beneficia = Padbene.documento    ON  Bonos.prestacion = Padprest.prestacion

DBSetProp('VREPORTE', 'View', 'UpdateType', 1)
DBSetProp('VREPORTE', 'View', 'WhereType', 3)
DBSetProp('VREPORTE', 'View', 'FetchMemo', .T.)
DBSetProp('VREPORTE', 'View', 'SendUpdates', .F.)
DBSetProp('VREPORTE', 'View', 'UseMemoSize', 255)
DBSetProp('VREPORTE', 'View', 'FetchSize', 100)
DBSetProp('VREPORTE', 'View', 'MaxRecords', -1)
DBSetProp('VREPORTE', 'View', 'Tables', 'ammba!bonos,ammba!padprest,ammba!padbene,ammba!padprofe')
DBSetProp('VREPORTE', 'View', 'Prepared', .F.)
DBSetProp('VREPORTE', 'View', 'CompareMemo', .T.)
DBSetProp('VREPORTE', 'View', 'FetchAsNeeded', .F.)
DBSetProp('VREPORTE', 'View', 'FetchSize', 100)
DBSetProp('VREPORTE', 'View', 'Comment', "")
DBSetProp('VREPORTE', 'View', 'BatchUpdateCount', 1)
DBSetProp('VREPORTE', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for VREPORTE
* Props for the VREPORTE.cupon field.
DBSetProp('VREPORTE.cupon', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.cupon', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.cupon', 'Field', 'UpdateName', 'ammba!bonos.cupon')
DBSetProp('VREPORTE.cupon', 'Field', 'DataType', "N(8)")
* Props for the VREPORTE.orden field.
DBSetProp('VREPORTE.orden', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.orden', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.orden', 'Field', 'UpdateName', 'ammba!bonos.orden')
DBSetProp('VREPORTE.orden', 'Field', 'DataType', "N(2)")
* Props for the VREPORTE.beneficia field.
DBSetProp('VREPORTE.beneficia', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.beneficia', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.beneficia', 'Field', 'UpdateName', 'ammba!bonos.beneficia')
DBSetProp('VREPORTE.beneficia', 'Field', 'DataType', "N(8)")
* Props for the VREPORTE.prestador field.
DBSetProp('VREPORTE.prestador', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.prestador', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.prestador', 'Field', 'UpdateName', 'ammba!bonos.prestador')
DBSetProp('VREPORTE.prestador', 'Field', 'DataType', "N(4)")
* Props for the VREPORTE.fecpres field.
DBSetProp('VREPORTE.fecpres', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.fecpres', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.fecpres', 'Field', 'UpdateName', 'ammba!bonos.fecpres')
DBSetProp('VREPORTE.fecpres', 'Field', 'DataType', "D")
* Props for the VREPORTE.feccarga field.
DBSetProp('VREPORTE.feccarga', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.feccarga', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.feccarga', 'Field', 'UpdateName', 'ammba!bonos.feccarga')
DBSetProp('VREPORTE.feccarga', 'Field', 'DataType', "D")
* Props for the VREPORTE.mmliq field.
DBSetProp('VREPORTE.mmliq', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.mmliq', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.mmliq', 'Field', 'UpdateName', 'ammba!bonos.mmliq')
DBSetProp('VREPORTE.mmliq', 'Field', 'DataType', "N(2)")
* Props for the VREPORTE.aaaaliq field.
DBSetProp('VREPORTE.aaaaliq', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.aaaaliq', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.aaaaliq', 'Field', 'UpdateName', 'ammba!bonos.aaaaliq')
DBSetProp('VREPORTE.aaaaliq', 'Field', 'DataType', "N(4)")
* Props for the VREPORTE.prestacion field.
DBSetProp('VREPORTE.prestacion', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.prestacion', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.prestacion', 'Field', 'UpdateName', 'ammba!bonos.prestacion')
DBSetProp('VREPORTE.prestacion', 'Field', 'DataType', "N(6)")
* Props for the VREPORTE.sistema field.
DBSetProp('VREPORTE.sistema', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.sistema', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.sistema', 'Field', 'UpdateName', 'ammba!bonos.sistema')
DBSetProp('VREPORTE.sistema', 'Field', 'DataType', "C(1)")
* Props for the VREPORTE.tipopres field.
DBSetProp('VREPORTE.tipopres', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.tipopres', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.tipopres', 'Field', 'UpdateName', 'ammba!bonos.tipopres')
DBSetProp('VREPORTE.tipopres', 'Field', 'DataType', "C(1)")
* Props for the VREPORTE.zona field.
DBSetProp('VREPORTE.zona', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.zona', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.zona', 'Field', 'UpdateName', 'ammba!bonos.zona')
DBSetProp('VREPORTE.zona', 'Field', 'DataType', "C(2)")
* Props for the VREPORTE.gastos field.
DBSetProp('VREPORTE.gastos', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.gastos', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.gastos', 'Field', 'UpdateName', 'ammba!bonos.gastos')
DBSetProp('VREPORTE.gastos', 'Field', 'DataType', "N(12,2)")
* Props for the VREPORTE.galeno field.
DBSetProp('VREPORTE.galeno', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.galeno', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.galeno', 'Field', 'UpdateName', 'ammba!bonos.galeno')
DBSetProp('VREPORTE.galeno', 'Field', 'DataType', "N(12,2)")
* Props for the VREPORTE.cantidad field.
DBSetProp('VREPORTE.cantidad', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.cantidad', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.cantidad', 'Field', 'UpdateName', 'ammba!bonos.cantidad')
DBSetProp('VREPORTE.cantidad', 'Field', 'DataType', "N(2)")
* Props for the VREPORTE.liquidado field.
DBSetProp('VREPORTE.liquidado', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.liquidado', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.liquidado', 'Field', 'UpdateName', 'ammba!bonos.liquidado')
DBSetProp('VREPORTE.liquidado', 'Field', 'DataType', "C(1)")
* Props for the VREPORTE.nomprac field.
DBSetProp('VREPORTE.nomprac', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.nomprac', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.nomprac', 'Field', 'UpdateName', 'ammba!padprest.descrip')
DBSetProp('VREPORTE.nomprac', 'Field', 'DataType', "C(30)")
* Props for the VREPORTE.nombene field.
DBSetProp('VREPORTE.nombene', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.nombene', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.nombene', 'Field', 'UpdateName', 'ammba!padbene.nombre')
DBSetProp('VREPORTE.nombene', 'Field', 'DataType', "C(30)")
* Props for the VREPORTE.tipoprof field.
DBSetProp('VREPORTE.tipoprof', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.tipoprof', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.tipoprof', 'Field', 'UpdateName', 'ammba!padprofe.tipopres')
DBSetProp('VREPORTE.tipoprof', 'Field', 'DataType', "C(1)")
* Props for the VREPORTE.especial field.
DBSetProp('VREPORTE.especial', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.especial', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.especial', 'Field', 'UpdateName', 'ammba!padprofe.especial')
DBSetProp('VREPORTE.especial', 'Field', 'DataType', "C(2)")
* Props for the VREPORTE.nomprof field.
DBSetProp('VREPORTE.nomprof', 'Field', 'KeyField', .F.)
DBSetProp('VREPORTE.nomprof', 'Field', 'Updatable', .T.)
DBSetProp('VREPORTE.nomprof', 'Field', 'UpdateName', 'ammba!padprofe.nombre')
DBSetProp('VREPORTE.nomprof', 'Field', 'DataType', "C(30)")
ENDFUNC
 

FUNCTION DisplayStatus(lcMessage)
WAIT WINDOW NOWAIT lcMessage
ENDFUNC
