#declare newline CHR(13)+CHR(10)
local lCantErr, lIndice, lTxtErr
local array aListErr[1,5]
lCantErr = aerror(aListErr)
lTxtErr = ""
for lIndice = 1 to lCantErr
	lTxtErr = lTxtErr + padl(aListErr[lIndice,1],8)+": "+aListErr[lIndice,2] + newline
next
messagebox(lTxtErr,48,"Error de grabacion")
