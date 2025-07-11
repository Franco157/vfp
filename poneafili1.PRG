SELECT 1
USE \proyectos\ammba\borafili
INDEX on cuil TO \proyectos\ammba\borfamilia
SELECT 2
USE \proyectos\ammba\borfamilia
SCAN 
	SELECT a
	SEEK b->cuil
	IF FOUND()
		SELECT b
		REPLACE afiliado WITH a->afiliado
	ENDIF
ENDSCAN 