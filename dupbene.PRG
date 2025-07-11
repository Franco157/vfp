USE bonos
PACK
reindex
SET ORDER TO BONOS   && CUPON*100+ORDEN
*MESSAGEBOX('BORRANDO DUBLICADOS')
MESSAGE('BORRANDO DUPLICADOS')
bb=0
GO TOP 
DO WHILE !EOF()
	IF bb=cupon*100+orden
		DELETE
	ENDIF
	bb=cupon*100+orden
	SKIP
ENDDO
PACK
REINDEX 


a=0
use padbene
set order to documento
do while !eof()
	if documento=a
		dele
	endif
	a=documento
	skip
enddo
pack
reindex
