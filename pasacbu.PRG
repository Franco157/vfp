SELECT 0
USE padprofe
*!*	SELECT 0
*!*	USE c:\red\ammbacbu1
*!*	SCAN
*!*		SELECT padprofe
*!*		LOCATE FOR STRTRAN(padprofe.cuit,'-','')$ammbacbu1.cuit
*!*		IF FOUND()
*!*			REPLACE cbu1 WITH ammbacbu1.cb1, cbu2 WITH ammbacbu1.cbu2, email WITH ammbacbu1.email IN padprofe
*!*		ENDIF
*!*	ENDSCAN 

SELECT 0
USE c:\red\ammbacbu6
SCAN
	SELECT padprofe
	LOCATE FOR STRTRAN(padprofe.cuit,'-','')$ammbacbu6.cuit
	IF FOUND()
		REPLACE cbu1 WITH ammbacbu6.cbu1, cbu2 WITH ammbacbu6.cbu2, email WITH ammbacbu6.email IN padprofe
	ELSE 
		MESSAGEBOX(ammbacbu6.prestador)
	ENDIF
ENDSCAN