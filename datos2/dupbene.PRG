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