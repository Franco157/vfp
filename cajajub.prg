SELECT * FROM aaa WHERE retencion>0 ORDER BY nombre INTO CURSOR bbb
COPY TO c:\red\ammba TYPE xls
SELECT ctacte.prestador, nombre, padprofe.matricula, aaaaliq, mmliq, SUM(IIF(tipomov$'LGLH',importe,000000.00)) as honorario, SUM(IIF(tipomov='DJ',importe,000000.00)) as retencion;
FROM ctacte, padprofe WHERE aaaaliq=2015 AND mmliq=8 AND ctacte.prestador=padprofe.prestador GROUP BY ctacte.prestador INTO CURSOR aaa
SELECT * FROM aaa WHERE retencion>0 ORDER BY nombre INTO CURSOR bbb
BROWSE
COPY TO c:\red\ammba TYPE xls