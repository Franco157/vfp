*!*****************************************************************
*!
*!      Procedure: IMPCHEQ
*!
*!*****************************************************************
lParameters lNumero, lImporte, lOrden, lFecha, lVenci
priv lpag, saltpag
ndet = ALLTRIM(numtostr(lImporte))+' ------- '
IF LEN(ndet)>40
	npos = 40
	DO WHILE !SUBSTR(ndet,npos,1)=' '
		npos = npos - 1
	ENDDO
	ndet1 = LEFT(ndet,npos)
	ndet2 = RIGHT(ndet,LEN(ndet)-npos)
ELSE
	ndet1 = ndet
	ndet2 = ''
ENDIF

	lpag=24
	do DividTxt with ndet, ndet1, ndet2, 40
	margenizq = space(18)
	orden1 = left(lOrden,rat(" ",left(lOrden,30)))
	orden2 = padr(substr(lOrden,len(Orden1)),20)
	??? CHR(27)+'0'+CHR(27)+'C'+chr(LPAG)
	??? CHR(27)+'x'+CHR(1)    && 0 para DRAFT; 1 para NLQ
	??? CHR(27)+'k'+CHR(0) && 0 para ROMAN; 1 para SANS SERIF
	??? mastimpr('E')+margenizq+SPACE(47)+transf(lImporte,'#,###,###.##')+CHR(13)+CHR(10)
	??? CHR(27)+'x'+CHR(0)    && 0 para DRAFT; 1 para NLQ
	??? mastimpr('E')+margenizq+SPACE(11)+PADL(DAY(lFecha),2,'0')+SPACE(1)+;
		PADR(nomMes(MONTH(lFecha)),3)+space(4)+str(year(lFecha),4)+CHR(13)+CHR(10)
	??? mastimpr('E')+CHR(13)+CHR(10)
	??? mastimpr('E')+margenizq+space(3)+PADL(DAY(lVenci),2,'0')+SPACE(5)+;
		PADR(nomMes(MONTH(lVenci)),17)+str(year(lVenci),4)+SPACE(11)+mastimpr('C')+CHR(13)+CHR(10)
	??? mastimpr('E')+CHR(13)+CHR(10)
	??? mastimpr('C')+margenizq+space(20)+lOrden+CHR(13)+CHR(10)
	??? mastimpr('E')+CHR(13)+CHR(10)
	??? mastimpr('C')+margenizq+SPACE(31)+ALLTRIM(m.ndet1)+CHR(13)+CHR(10)
	??? mastimpr('C')+margenizq+SPACE(12)+ALLTRIM(m.ndet2)+CHR(13)+CHR(10)
	??? mastimpr('E')+CHR(13)+CHR(10)
	??? mastimpr('E')+CHR(13)+CHR(10)


??? CHR(12)

RETURN


procedure DividTxt
parameters pLinea, pDet1, pDet2, pLong
IF LEN(pLinea)>pLong
	npos = pLong
	DO WHILE !SUBSTR(pLinea,npos,1)=' '
		npos = npos - 1
	ENDDO
	pDet1 = LEFT(pLinea,npos)
	pDet2 = RIGHT(pLinea,LEN(pLinea)-npos)
ELSE
	pDet1 = pLinea
	pDet2 = ''
ENDIF
return
