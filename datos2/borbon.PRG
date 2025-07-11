set dele on
sele 1
use c:\ammba\datos\bonos
inde on str(cupon,8)+str(orden,2) to borrar
sele 2
use c:\ammba\datos\bonnue
do while !eof()
	sele 1
	seek str(b->cupon,8)+str(b->orden,2)
	if found()
		sele 2
		dele
	endif
	sele 2
	skip
enddo