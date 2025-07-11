sele 1
use padprest order prestacion
sele 2
use bonos
sele 2
do while !eof()
    sele 1
    seek a->prestacion
    if found()
       sele 2
       repl gastos with gastos
    endif
    sele 2
    skip
enddo
