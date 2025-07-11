
OPEN DATABASE C:\proyectos\ammba\datos\AMMBA.DBC
USE bonos
GO bott
BROWSE
SELECT * FROM bonos GROUP BY sistema
SET ENGINEBEHAVIOR 70
SELECT * FROM bonos GROUP BY sistema
SELECT SUM(1), * FROM bonos GROUP BY sistema
SELECT SUM(1), * FROM bonos WHERE aaaaliq*100+mmliq>=200801 GROUP BY sistema INTO CURSOR cupones
SELECT ' ' as grupo, * FROM bonos WHERE aaaaliq*100+mmliq>=200801 INTO CURSOR cupones
BROWSE
SET DELETED ON
SELECT ' ' as grupo, * FROM bonos WHERE aaaaliq*100+mmliq>=200801 INTO CURSOR cupones
COPY TO \proyectos\ammba\borcupones
USE \proyectos\ammba\borcupones
BROWSE
SELECT * FROM bonos GROUP BY sistema
USE \proyectos\ammba\borcupones
SELECT borcupones
DELETE FOR sistema=' '
DELETE FOR sistema='T'
PACK
USE
USE \proyectos\ammba\borcupones EXCLUSIVE
PACK
EDIT
REPLACE grupo WITH 'M' FOR sistema='M'
BROWSE
OPEN DATABASE C:\proyectos\ceco-afili\datos\CECO.DBC
USE afiliados
EDIT
BROWSE
GO bott
BROWSE
MODIFY STRUCTURE
SELECT cuil, VAL(SUBSTR(cuil,4,8)), ALLTRIM(apellido)+', '+ALLTRIM(nombre) as nombre, afiliado FROM afilidos
SELECT cuil, VAL(SUBSTR(cuil,4,8)), ALLTRIM(apellido)+', '+ALLTRIM(nombre) as nombre, afiliado FROM afiliados
SELECT cuil, VAL(SUBSTR(STR(cuil,13),4,8)), ALLTRIM(apellido)+', '+ALLTRIM(nombre) as nombre, afiliado FROM afiliados
SELECT cuil, INT(VAL(SUBSTR(STR(cuil,13),4,8))), ALLTRIM(apellido)+', '+ALLTRIM(nombre) as nombre, afiliado FROM afiliados
SELECT cuil, INT(VAL(SUBSTR(STR(cuil,13),3,8))), ALLTRIM(apellido)+', '+ALLTRIM(nombre) as nombre, afiliado FROM afiliados
SELECT cuil, INT(VAL(SUBSTR(STR(cuil,11),3,8))), ALLTRIM(apellido)+', '+ALLTRIM(nombre) as nombre, afiliado FROM afiliados
SELECT cuil, INT(VAL(SUBSTR(STR(cuil,11),3,8))) as documen, ALLTRIM(apellido)+', '+ALLTRIM(nombre) as nombre, afiliado FROM afiliados
MODIFY STRUCTURE
SELECT cuil, INT(VAL(SUBSTR(STR(cuil,11),3,8))) as documen, ALLTRIM(apellido)+', '+ALLTRIM(nombre) as nombre, afiliado FROM afiliados INTO CURSOR afili
COPY TO \proyectos\ammba\borafili
USE familiares
EDIT
SELECT cuil, documento as documen, ALLTRIM(apellido)+', '+ALLTRIM(nombre) as nombre, 0 as afiliado FROM familiares INTO CURSOR famili
SELECT cuil_empl as cuil, documento as documen, ALLTRIM(apellido)+', '+ALLTRIM(nombre) as nombre, 0 as afiliado FROM familiares INTO CURSOR famili
BROWSE
COPY TO \proyectos\ammba\borfamilia
MODIFY comm \proyectos\ammba\poneafili1
do \proyectos\ammba\poneafili1
BROWSE
SELECT a
APPEND FROM  \proyectos\ammba\borfamilia
BROWSE
MODIFY comm \proyectos\ammba\poneafili2
do \proyectos\ammba\poneafili1
MODIFY comm \proyectos\ammba\poneafili1
USE \proyectos\ammba\borcupones
EDIT
do \proyectos\ammba\poneafili2
USE \proyectos\ammba\borcupones
EDIT
MODIFY comm \proyectos\ammba\poneafili2
do \proyectos\ammba\poneafili2
MODIFY comm \proyectos\ammba\poneafili2
do \proyectos\ammba\poneafili2
BROWSE
OPEN DATABASE C:\proyectos\ammba\datos\AMMBA.DBC
BROWSE
USE ammba!padbene
EDIT
EDIT FOR documento=17132903
OPEN DATABASE C:\proyectos\ceco-afili\datos\CECO.DBC
USE afiliados EXCLUSIVE
USE
USE afiliados EXCLUSIVE
CLOSE ALL
OPEN DATABASE C:\proyectos\ceco-afili\datos\CECO.DBC
USE afiliados EXCLUSIVE
MODIFY STRUCTURE
CLOSE ALL
OPEN DATABASE C:\proyectos\ammba\datos\AMMBA.DBC
USE ammba!padbene
EDIT FOR documento=17132903
EDIT FOR documento=45433582
EDIT FOR documento=45423582
USE \proyectos\ammba\borcupones
SELECT SUM(1), * FROM \proyectos\ammba\borcupones GROUP BY grupo
SELECT SUM(1), * FROM \proyectos\ammba\borcupones GROUP BY grupo WHERE cupon>0
SELECT SUM(1), * FROM \proyectos\ammba\borcupones GROUP BY grupo WHERE orden>0
SELECT SUM(1), * FROM \proyectos\ammba\borcupones GROUP BY grupo WHERE orden>1
SELECT SUM(1), * FROM \proyectos\ammba\borcupones GROUP BY grupo WHERE orden<1
SELECT SUM(1), * FROM \proyectos\ammba\borcupones GROUP BY grupo WHERE orden>1
SELECT SUM(1), * FROM \proyectos\ammba\borcupones GROUP BY grupo, tipopres WHERE orden<1
SELECT SUM(1) as veces, * FROM \proyectos\ammba\borcupones GROUP BY grupo, tipopres, aaaaliq, mmliq, beneficia WHERE orden<1 ORDER BY veces
SELECT SUM(1) as veces, * FROM \proyectos\ammba\borcupones GROUP BY grupo, tipopres, aaaaliq, mmliq, beneficia WHERE orden<1 ORDER BY veces desc
SELECT SUM(1) as veces, * FROM \proyectos\ammba\borcupones GROUP BY grupo, tipopres, aaaaliq, mmliq, beneficia WHERE orden<1 ORDER BY beneficia, veces desc
SELECT aaaaliq, mmliq, grupo, SUM(1) as total, SUM(IIF(grupo=' ',1,0)) as sindefinir, SUM(IIF(grupo='1',1,0)) as afiliados, SUM(IIF(grupo='2',1,0)) as osecac,;
SUM(IIF(grupo='M',1,0)) as monotributos FROM \proyectos\ammba\borcupones GROUP BY aaaaliq, mmliq WHERE orden<1
