function EstadProm
parameters lSumaEst, lPromEst
lSumaEst = 0
lPromEst = 0
FOR campos=2 to 13
	if type(field(campos))="N"
		lSumaEst = lSumaEst + evaluate(field(campos))
		lPromEst = lPromEst + 1
	endif
next
RETURN (round(lSumaEst/lPromEst,2))

