function EstadSuma
parameters lSumaEst
lSumaEst = 0
FOR campos=2 to 13
	if type(field(campos))="N"
		lSumaEst = lSumaEst + evaluate(field(campos))
	endif
next
RETURN (lSumaEst)

