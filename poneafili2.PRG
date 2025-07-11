SELECT 1
USE \proyectos\ammba\borafili
INDEX on documen TO \proyectos\ammba\borfamilia
SELECT 2
USE \proyectos\ammba\borcupones
SCAN 
	SELECT a
	SEEK b->beneficia
	IF FOUND()
		SELECT b
		REPLACE grupo WITH STR(a->afiliado,1)
	ENDIF
ENDSCAN 