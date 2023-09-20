; llama a las macros
include macros1.asm
.model Large ; define el modelo de memoria

; ==================== segmento de pila ====================
.stack

; ==================== segmento de datos ====================
; ------- Variables a utilizar -------
.data

;Salto de linea 
skip db 0ah,0dh, ' ', '$'

;Salto de linea
saltolinea db 10,'$'
; Informacion de desarrollador
espacioinicial db 2 dup(' '),'$'
decoinicio db 0ah,0dh, '  .*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*','$'
infoinicial1 db 0ah,0dh, '  ::                                                ::', '$'
infoinicial2 db 0ah,0dh, '  :: UNIVERSIDAD SAN CARLOS DE GUATEMALA            ::', '$'
infoinicial3 db 0ah,0dh, '  :: FACULTAD DE INGENIERIA                         ::', '$'
infoinicial4 db 0ah,0dh, '  :: ARQUITECTURA DE COMPUTADORAS Y ENSAMBLADORES 1 ::', '$'   
infoinicial5 db 0ah,0dh, '  :: SECCION B                                      ::', '$'    
infoinicial6 db 0ah,0dh, '  ::                                                ::', '$'  
infoinicial7 db 0ah,0dh, '  :: NOMBRE: DAMARIS JULIZZA MURALLES VELIZ         ::', '$'   
infoinicial8 db 0ah,0dh, '  :: CARNE: 202100953                               ::', '$'
infoinicial9 db 0ah,0dh, '  ::                                                ::', '$'
decofin db 0ah,0dh, '  *..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*.','$'

; Menu de opciones principal
menu1 db 0ah,0dh, '  :: (\_(\ ...*...*...*...*...*...*...*...*...*...*...', '$'
menu2 db 0ah,0dh, '  *: (='':'') ::::::::  MENU PRINCIPAL  ::::::::::::::::','$'
menu3 db 0ah,0dh, '  *: (,(")(")...*...*...*...*...*...*...*...*...*...','$'
menu4 db 0ah,0dh,'  *..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*.','$'
menu5 db 0ah,0dh,'  ::                                                ::','$'
menu6 db 0ah,0dh,'  ::            1. Jugador vs. Jugador              ::','$'
menu7 db 0ah,0dh,'  ::            2. Jugador vs. Computadora          ::','$'
menu8 db 0ah,0dh,'  ::            3. Cargar partida                   ::','$'
menu9 db 0ah,0dh,'  ::            4. Ayuda                            ::','$'
menu10 db 0ah,0dh,'  ::            5. Salir                            ::','$'
menu11 db 0ah,0dh,'  ::                                                ::','$'

; Mensaje de presionar tecla
presionarTecla db 0ah,0dh, '  Presione ''Enter'' para continuar...','$'

; Mensaje para escoger opcion
mensajeOpcion db 0ah,0dh, '  --> Ingrese una opcion: ','$'
; Informacion de ayuda
ayuda1 db 0ah,0dh, '    Colocar fichas: nombres de columnas  Guardar: w','$'
ayuda2 db 0ah,0dh, '   Continuar: n  Salir: q','$'

; -------------------------Mensaje de entradas y salida------------------------------
dibujoingreso1 db 0ah,0dh, '  (\(\ ','$'
dibujoingreso2 db 0ah,0dh, '  ( ^.^) -> ','$'
dibujoingreso3 db 0ah,0dh, '  o_(")(") ','$'

mensajeEntrada1 db 'Ingrese el nombre del jugador 1: ','$'
mensajeEntrada2 db 'Ingrese el nombre del jugador 2: ','$'
mensajeEntrada3 db ' Ingrese el nombre para el archivo: ','$'

mensajeSalida1 db ' Gracias por jugar!','$'
mensajeSalida4 db 0ah,0dh,'              Guardando datos de la partida!','$'
mensajeSalida2 db ' Es un empate!','$'
mensajeSalida3 db ' Gana el jugador:  ','$'

; ----------------------------------mensajes de incio partida----------------------------
dibpart1 db 0ah,0dh,'                    (\__/)','$'
dibpart2 db 0ah,0dh,'                    (=''.''=)','$'
dibpart3 db 0ah,0dh,'                    (")__(")','$'

mensajeinicio1 db 0ah,0dh, '              NUEVA PARTIDA: ','$'
mensajeinicio2 db' VS ','$'


; -----------------------------------Mensaje de error---------------------------------------
Errord1 db 0ah,0dh, '  (\(\ ','$'
Errord2 db 0ah,0dh, '  ( X.X) -> ERROR:','$'
Errord3 db 0ah,0dh, '  o_(")(") ','$'

mesajeError1 db 'Opcion invalida','$'
mesajeError2 db 'Solo puede presionar Enter ingresar al menu','$'
mesajeError3 db 'Ocurrio un problema mientras se ejecutaba el juego','$'

mesajeError4 db 'No se puede colocar la ficha en este lugar','$'

mesajeError5 db 'No se debe colocar la extension','$'

mesajeError7 db 'No se pudo crear el archivo ','$'

mesajeError8 db 'No se pudo leer el archivo','$'

mesajeError9 db 'No se pudo abrir el archivo, puede que no exista','$'

mesajeError10 db 'No se pudo escribir en el archivo','$'

mesajeError11 db 'No se pudo cerrar el archivo','$'




;-----------------------------------Variables de juego---------------------------------------
nombre1 db 100 dup ('$'), '$'
nombre2 db 100 dup ('$'), '$'
nombre db 'Computadora', '$' ; nombre de la computadora
jugador1 db 'X','$' ; Carácter de ficha del jugador 1
jugador2 db 'O', '$' ; Carácter de ficha del jugador 2
computadora db ' ','$' ; si es computadora
; variables de control de juego
ganajugador1 db ' ', '$'
ganajugador2 db ' ', '$'
vacio db ' ', '$'
turno db 'X','$'
simbolo db ' ','$'
; mensaje para los turnos de jugadores y el random de la computadora
turno0 db " , ficha ",'$'
turno1 db " : ",'$'
turno2 db '  Turno de ','$'
numrandom db 0,'$'
columnasr db 'zxcvbnm','$'

;Maneja la entrada del teclado
handlerentrada dw ?

;--------------------- Variables para manejar los archivos dentro del juego ---------------------
nombreArchivo1 db 100 dup ('$'), '$'
nombreArchivo db 'PAR.SAV', 0; nombre del archivo
extensionsave db '.SAV','$'

rute db  'c:/masm611/bin/AYUDA.TXT' ,'00h'
handler dw ?

;--------------------------------archivo para guardar---------------------------
linea1 db 0ah,0dh, "jugador1: ",'$'
linea2 db 0ah,0dh, "jugador2: ",'$'
linea3 db 0ah,0dh,"turno: ", '$'
linea4 db 0ah,0dh,"modalidad: ",'$'
linea5 db 0ah,0dh,"celdas:"   


;--------------------------- Celdas columnas------------------------------------
margen db 10 dup(' '),'$'   ; Carácter para celdas vacías
celda11 db ' ', '$'
celda12 db ' ', '$'
celda13 db ' ', '$'
celda14 db ' ', '$'
celda15 db ' ', '$'
celda16 db ' ', '$'
celda21 db ' ', '$'
celda22 db ' ', '$'
celda23 db ' ', '$'
celda24 db ' ', '$'
celda25 db ' ', '$'
celda26 db ' ', '$'
celda31 db ' ', '$'
celda32 db ' ', '$'
celda33 db ' ', '$'
celda34 db ' ', '$'
celda35 db ' ', '$'
celda36 db ' ', '$'
celda41 db ' ', '$'
celda42 db ' ', '$'
celda43 db ' ', '$'
celda44 db ' ', '$'
celda45 db ' ', '$'
celda46 db ' ', '$'
celda51 db ' ', '$'
celda52 db ' ', '$'
celda53 db ' ', '$'
celda54 db ' ', '$'
celda55 db ' ', '$'
celda56 db ' ', '$'
celda61 db ' ', '$'
celda62 db ' ', '$'
celda63 db ' ', '$'
celda64 db ' ', '$'
celda65 db ' ', '$'
celda66 db ' ', '$'
celda71 db ' ', '$'
celda72 db ' ', '$'
celda73 db ' ', '$'
celda74 db ' ', '$'
celda75 db ' ', '$'
celda76 db ' ', '$'


; --------------------------- Variables para el reporte ---------------------------
nombrerep db 'REP.HTML',0
; Variables para el reporte
reporte db 40000 dup(' '), '$'
aGuardar db 4000 dup(' '), '$'
buffer db 3000 dup(' '), '$' ;
; ============================Lineas del reporte============================
linea111 db  '<html><head><title>Reporte</title>','$'
linea112 db 0ah,0dh, '<style>body {background-color: #40839b;text-align: center;','$'
linea113 db 0ah,0dh, 'font-family: Arial, sans-serif;}h1 {color: #080335;} table {','$'
linea114 db 0ah,0dh, 'margin: 20px auto; border-collapse: collapse;}','$'
linea115 db 0ah,0dh, 'table, th, td {border: 1px solid #f9f2f2; } th, td {','$'
linea116 db 0ah,0dh, 'width: 40px;height: 40px;text-align: center;vertical-align: middle;}','$'
linea117 db 0ah,0dh, '.fondocelda {background-color: #afc0d1;}','$'
linea118 db 0ah,0dh, '.ganador {background-color: #5b88d1;}','$'
linea119 db 0ah,0dh, '</style></head>','$'
linea10 db 0ah,0dh, '<body><h1>======== Reporte ========</h1><p >Partida:</p>','$'
linea11 db 0ah,0dh, '<p>','$'
linea12 db  '</p>','$'
linea13 db 0ah,0dh, '<table>','$'
linea14 db 0ah,0dh, '<tr>','$'
linea15 db 0ah,0dh, '<td class="fondocelda">','$'
linea16 db  '</td>','$'
linea17 db 0ah,0dh, '<td class="ganador">','$'
linea18 db 0ah,0dh, '</tr>','$'
linea19 db 0ah,0dh, '</table></body></html>','$'
finnum db 0 ,'$'



; ==================== segmento de codigo ====================

.code
main proc far
mov ax,@data
mov ds,ax
mov es,ax

begin:
        mov si,0
        push si
       
        jmp inicio


inicio:
    clear
    print decoinicio
    print infoinicial1
    print infoinicial2
    print infoinicial3
    print infoinicial4
    print infoinicial5
    print infoinicial6
    print infoinicial7
    print infoinicial8
    print infoinicial9
    print decofin
    print presionarTecla
    getChar
    print saltolinea

    cmp al,13 ; Enter
    je menu

    jmp error0


menu:
    clear
    
    limpiar reporte, SIZEOF reporte,' '
    mov al, ' '
    mov celda11,al
    mov celda12,al
    mov celda13,al
    mov celda14,al
    mov celda15,al
    mov celda16,al
    mov celda21,al
    mov celda22,al
    mov celda23,al
    mov celda24,al
    mov celda25,al
    mov celda26,al
    mov celda31,al
    mov celda32,al
    mov celda33,al
    mov celda34,al
    mov celda35,al
    mov celda36,al
    mov celda41,al
    mov celda42,al
    mov celda43,al
    mov celda44,al
    mov celda45,al
    mov celda46,al
    mov celda51,al
    mov celda52,al
    mov celda53,al
    mov celda54,al
    mov celda55,al
    mov celda56,al
    mov celda61,al
    mov celda62,al
    mov celda63,al
    mov celda64,al
    mov celda65,al
    mov celda66,al
    mov celda71,al
    mov celda72,al
    mov celda73,al
    mov celda74,al
    mov celda75,al
    mov celda76,al
    limpiar nombre1, SIZEOF nombre1,' '
    limpiar nombre2, SIZEOF nombre2,' '
    mov ganajugador1,al
    mov ganajugador2,al
    mov vacio,al
    mov turno,'X'
    mov simbolo,al
    mov computadora,al
    print decoinicio
    print menu1
    print menu2
    print menu3
    print menu4
    print menu5
    print menu6
    print menu7
    print menu8
    print menu9
    print menu10
    print menu11
    print decofin
    print mensajeOpcion
    getChar
    print saltolinea

    cmp al,49 ; opcion 1
    je jugadorvsjugador

    cmp al,50 ; opcion 2    
    je jugadorvscomputadora

    cmp al,51 ; opcion 3
    je cargarpartida

    cmp al,52 ; opcion 4
    je ayuda
    
    cmp al,53 ; opcion 5
    je salir

    jmp error1


jugadorvsjugador:
    clear
    print decoinicio
    print saltoLinea
    print dibujoingreso1
    print dibujoingreso2
    print mensajeEntrada1
    print dibujoingreso3
    ObtenerTexto nombre1
    print saltolinea
    clear
    print decoinicio
    print saltoLinea
    print dibujoingreso1
    print dibujoingreso2
    print mensajeEntrada2
    print dibujoingreso3
    ObtenerTexto nombre2
    print saltolinea
    clear 
    print dibpart1
    print dibpart2
    print dibpart3
    print saltolinea
    print decoinicio
    print mensajeinicio1
    print nombre1
    print mensajeinicio2
    print nombre2
    print decofin
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
   

    delay 45
    jmp imprimir_tablero

jugadorvscomputadora:
    clear
    mov computadora,'C'
    mov al,nombre
    mov nombre2,al
    print decoinicio
    print saltoLinea
    print dibujoingreso1
    print dibujoingreso2
    print mensajeEntrada1
    print dibujoingreso3
    ObtenerTexto nombre1
    print saltolinea
    clear 
    print dibpart1
    print dibpart2
    print dibpart3
    print saltolinea
    print decoinicio
    print mensajeinicio1
    print nombre1
    print mensajeinicio2
    print nombre
    print decofin
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
    print saltolinea
   
    ; agregar datos a reporteiliar
    delay 45
    jmp imprimir_tablero

cargarpartida:
    clear
    print menu8
    delay 40
    jmp menu

ayuda:
    clear
    limpiar buffer, SIZEOF buffer,24h  ;limpiamos la variable donde guardaremos los datos del archivo
    abrir rute,handlerentrada  ;le mandamos la ruta y el handler,que será la referencia al fichero 
    limpiar buffer, SIZEOF buffer,24h  ;limpiamos la variable donde guardaremos los datos del archivo 
    leer handlerentrada, buffer, SIZEOF buffer ;leemos el archivo
    cerrar handlerentrada

    print buffer
    delay 150
    jmp menu

; SALIR DEL PROGRAMA    
salir:
    print decoinicio
    print saltoLinea
    print dibujoingreso1
    print dibujoingreso2
    print mensajeSalida1
    print dibujoingreso3
    print decofin
    print saltolinea
    print saltolinea
    close



;===================== ERRORES DENTRO DEL PROGRAMA ======================
error0:
    print Errord1
    print Errord2
    print mesajeError2
    print Errord3
    print saltolinea
    print saltolinea
    print saltolinea
    delay 35
    clear
    jmp inicio

error1:
    print Errord1
    print Errord2
    print mesajeError1
    print Errord3
    print saltolinea
    print saltolinea
    print saltolinea
    delay 35
    clear
    jmp menu

error2:
    print Errord1
    print Errord2
    print mesajeError3
    print Errord3
    print saltolinea
    print saltolinea
    print saltolinea
    delay 35
    clear
    jmp menu

error3:
    mov al, simbolo
    mov turno,al
    mov simbolo,' '
    print Errord1
    print Errord2
    print mesajeError4
    print Errord3
    print saltolinea
    print saltolinea
    print saltolinea
    delay 35
    clear
    jmp imprimir_tablero

error4:
    print Errord1
    print Errord2
    print mesajeError5
    print Errord3
    print saltolinea
    print saltolinea
    print saltolinea
    delay 40
    clear
    jmp guardarpartida
error5:
    print Errord1
    print Errord2
    print mesajeError7
    print Errord3
    print saltolinea
    print saltolinea
    print saltolinea
    delay 40
    clear
    jmp menu

error6:
    print Errord1
    print Errord2
    print mesajeError8
    print Errord3
    print saltolinea
    print saltolinea
    print saltolinea
    delay 40
    clear
    jmp menu

error7:
    print Errord1
    print Errord2
    print mesajeError9
    print Errord3
    print saltolinea
    print saltolinea
    print saltolinea
    delay 40
    clear
    jmp menu

error8:
    print Errord1
    print Errord2
    print mesajeError10
    print Errord3
    print saltolinea
    print saltolinea
    print saltolinea
    delay 40
    clear
    jmp menu

error9:
    print Errord1
    print Errord2
    print mesajeError11
    print Errord3
    print saltolinea
    print saltolinea
    print saltolinea
    delay 40
    clear
    jmp menu


; ==================== PROCEDIMIENTOS DENTRO DEL JEUGO ====================
imprimir_tablero:
    ; Imprimir el tablero
    mov al,32
    mov simbolo,al
    clear
    print decoinicio
    print saltolinea
    print dibpart1
    print dibpart2
    print dibpart3
    print saltolinea
    print decofin
    print saltolinea
    print margen
    imprimircelda 'z',20h,20h
    imprimircelda 'x',20h,20h
    imprimircelda 'c',20h,20h
    imprimircelda 'v',20h,20h
    imprimircelda 'b',20h,20h
    imprimircelda 'n',20h,20h
    imprimircelda 'm',20h,20h 
    print saltolinea
    ; imprimientdo diseño de tablero borde
    print margen
    imprimircelda '-',20h,2dh
    imprimircelda '-',20h,2dh
    imprimircelda '-',20h,2dh
    imprimircelda '-',20h,2dh
    imprimircelda '-',20h,2dh
    imprimircelda '-',20h,2dh
    imprimircelda '-',20h,2dh
    print saltolinea
    ; imprimiendo diseño de tablero interno
    print margen
    imprimircelda celda11,7ch,20h
    imprimircelda celda21,7ch,20h
    imprimircelda celda31,7ch,20h
    imprimircelda celda41,7ch,20h
    imprimircelda celda51,7ch,20h
    imprimircelda celda61,7ch,20h
    imprimircelda celda71,7ch,20h
    imprimircelda ' ',7ch,20h
    print saltolinea
    print margen
    imprimircelda celda12,7ch,20h
    imprimircelda celda22,7ch,20h
    imprimircelda celda32,7ch,20h
    imprimircelda celda42,7ch,20h
    imprimircelda celda52,7ch,20h
    imprimircelda celda62,7ch,20h
    imprimircelda celda72,7ch,20h
    imprimircelda ' ',7ch,20h
    print saltolinea
    print margen
    imprimircelda celda13,7ch,20h
    imprimircelda celda23,7ch,20h
    imprimircelda celda33,7ch,20h
    imprimircelda celda43,7ch,20h
    imprimircelda celda53,7ch,20h
    imprimircelda celda63,7ch,20h
    imprimircelda celda73,7ch,20h
    imprimircelda ' ',7ch,20h
    print saltolinea
    print margen
    imprimircelda celda14,7ch,20h
    imprimircelda celda24,7ch,20h
    imprimircelda celda34,7ch,20h
    imprimircelda celda44,7ch,20h
    imprimircelda celda54,7ch,20h
    imprimircelda celda64,7ch,20h
    imprimircelda celda74,7ch,20h
    imprimircelda ' ',7ch,20h
    print saltolinea
    print margen
    imprimircelda celda15,7ch,20h
    imprimircelda celda25,7ch,20h
    imprimircelda celda35,7ch,20h
    imprimircelda celda45,7ch,20h
    imprimircelda celda55,7ch,20h
    imprimircelda celda65,7ch,20h
    imprimircelda celda75,7ch,20h
    imprimircelda ' ',7ch,20h
    print saltolinea
    print margen
    imprimircelda celda16,7ch,20h
    imprimircelda celda26,7ch,20h
    imprimircelda celda36,7ch,20h
    imprimircelda celda46,7ch,20h
    imprimircelda celda56,7ch,20h
    imprimircelda celda66,7ch,20h
    imprimircelda celda76,7ch,20h
    imprimircelda ' ',7ch,20h
    print saltolinea
    print margen
    ; imprimientdo diseño de tablero borde
    imprimircelda '-',20h,2dh
    imprimircelda '-',20h,2dh
    imprimircelda '-',20h,2dh
    imprimircelda '-',20h,2dh
    imprimircelda '-',20h,2dh
    imprimircelda '-',20h,2dh
    imprimircelda '-',20h,2dh
    print saltolinea
    print ayuda1
    print saltolinea
    jmp verificar_fin_juego
verificar_fin_juego:
    

    verificar_ganador ganajugador1,ganajugador2,celda11,celda21,celda31,celda41
    
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda21, celda31, celda41, celda51
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda31, celda41, celda51, celda61
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda41, celda51, celda61, celda71
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda12, celda22, celda32, celda42
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda22, celda32, celda42, celda52
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda32, celda42, celda52, celda62
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda42, celda52, celda62, celda72
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda13, celda23, celda33, celda43
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda23, celda33, celda43, celda53
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda33, celda43, celda53, celda63
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda43, celda53, celda63, celda73
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    
    verificar_ganador ganajugador1,ganajugador2,celda14, celda24, celda34, celda44
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda24, celda34, celda44, celda54
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda34, celda44, celda54, celda64
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda44, celda54, celda64, celda74
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '

    verificar_ganador ganajugador1,ganajugador2,celda15, celda25, celda35, celda45
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda25, celda35, celda45, celda55
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda35, celda45, celda55, celda65
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda45, celda55, celda65, celda75
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '

    verificar_ganador ganajugador1,ganajugador2,celda16, celda26, celda36, celda46
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda26, celda36, celda46, celda56
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda36, celda46, celda56, celda66
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda46, celda56, celda66, celda76
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda11, celda12, celda13, celda14
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda12, celda13, celda14, celda15
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda13, celda14, celda15, celda16
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '

    verificar_ganador ganajugador1,ganajugador2,celda21, celda22, celda23, celda24
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda22, celda23, celda24, celda25
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda23, celda24, celda25, celda26
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '

    verificar_ganador ganajugador1,ganajugador2,celda31, celda32, celda33, celda34
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda32, celda33, celda34, celda35
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda33, celda34, celda35, celda36
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '

    verificar_ganador ganajugador1,ganajugador2,celda41, celda42, celda43, celda44
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda42, celda43, celda44, celda45
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda43, celda44, celda45, celda46
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '

    verificar_ganador ganajugador1,ganajugador2,celda51, celda52, celda53, celda54
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda52, celda53, celda54, celda55
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda53, celda54, celda55, celda56
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '

    verificar_ganador ganajugador1,ganajugador2,celda61, celda62, celda63, celda64
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda62, celda63, celda64, celda65
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda63, celda64, celda65, celda66
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '

    verificar_ganador ganajugador1,ganajugador2,celda71, celda72, celda73, celda74
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda72, celda73, celda74, celda75
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda73, celda74, celda75, celda76
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '

    verificar_ganador ganajugador1,ganajugador2,celda13, celda24, celda35, celda46
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda12, celda23, celda34, celda45
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda23, celda34, celda45, celda56
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda11, celda22, celda33, celda44
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda22, celda33, celda44, celda55
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda33, celda44, celda55, celda66
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda21, celda32, celda43, celda54
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda32, celda43, celda54, celda65
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda43, celda54, celda65, celda76
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda31, celda42, celda53, celda64
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda42, celda53, celda64, celda75
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda41, celda52, celda63, celda74
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '

    verificar_ganador ganajugador1,ganajugador2,celda14, celda23, celda32, celda41
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda15, celda24, celda33, celda42
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda24, celda33, celda42, celda51
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda16, celda25, celda34, celda43
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda25, celda34, celda43, celda52
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda34, celda43, celda52, celda61
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda26, celda35, celda44, celda53
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda35, celda44, celda53, celda62
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda44, celda53, celda62, celda71
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda36, celda45, celda54, celda63 
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda45, celda54, celda63, celda72
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov ganaJugador1, ' '
    mov ganaJugador2, ' '
    verificar_ganador ganajugador1,ganajugador2,celda46, celda55, celda64, celda73
    cmp ganajugador1, 'G'
    je ganador
    cmp ganajugador2, 'G'
    je ganador
    mov al, ganajugador1
    cmp al, ganajugador2
    je posibleempate
    jmp salir
ganador:
    concatenarCadena linea111,reporte
    concatenarCadena linea112,reporte
    concatenarCadena linea113,reporte
    concatenarCadena linea114,reporte
    concatenarCadena linea115,reporte
    concatenarCadena linea116,reporte
    concatenarCadena linea117,reporte
    concatenarCadena linea118,reporte
    concatenarCadena linea119,reporte
    concatenarCadena linea10,reporte
    concatenarCadena linea11,reporte
    concatenarCadena nombre1,reporte
    concatenarCadena turno1,reporte
    concatenarCadena jugador1,reporte
    concatenarCadena linea12,reporte
    concatenarCadena linea11,reporte
    concatenarCadena nombre2,reporte
    concatenarCadena turno1,reporte
    concatenarCadena jugador2,reporte
    concatenarCadena linea12,reporte
    ; interrupcion para obtener la hora y agregarla
   
    concatenarCadena linea13,reporte
    concatenarCadena linea14,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda11,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda21,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda31,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda41,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda51,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda61,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda71,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea18,reporte
    
    concatenarCadena linea14,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda12,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda22,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda32,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda42,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda52,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda62,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda72,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea18,reporte

    concatenarCadena linea14,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda13,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda23,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda33,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda43,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda53,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda63,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda73,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea18,reporte

    concatenarCadena linea14,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda14,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda24,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda34,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda44,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda54,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda64,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda74,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea18,reporte

    concatenarCadena linea14,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda15,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda25,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda35,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda45,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda55,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda65,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda75,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea18,reporte

    concatenarCadena linea14,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda16,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda26,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda36,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda46,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda56,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda66,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda76,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea18,reporte
    concatenarCadena linea19,reporte
   
   

    limpiar buffer, SIZEOF buffer,24h ;limpiamos el arreglo bufferentrada con $

    ;ObtenerTexto nombreArchivo (Por alguna razon aveces no se obtiene bien el nombre del archivo
    ;Y lo pueden ingresar manual en caso de cualquier error)
    mov nombrerep[0],82 ;R
    mov nombrerep[1],69 ;E
    mov nombrerep[2],80 ;P
    mov nombrerep[3],46  ;.
    mov nombrerep[4],72 ;h
    mov nombrerep[5],84 ;t
    mov nombrerep[6],77 ;m
    mov nombrerep[7],76 ;l

    ;Interrupcion para crear el archivo
    crear nombrerep, handler
    ;Interrupcion para escribir el archivo
    escribir handler, reporte, SIZEOF reporte
    ;Interrupcion para cerrar como que el buffer que se utilizo para escribir
    cerrar handler

    cmp ganajugador1, 'G'
    je jugador1gana
    cmp ganajugador2, 'G'
    je jugador2gana
jugador1gana:
    print saltolinea
    print dibujoingreso1
    print dibujoingreso2
    print mensajeSalida3
    print nombre1
    print dibujoingreso3
    print saltolinea
    print decofin 
    delay 150
    jmp menu
jugador2gana:
    cmp computadora, 'C'
    je jugador2gana2
    print saltolinea
    print dibujoingreso1
    print dibujoingreso2
    print mensajeSalida3
    print nombre2
    print dibujoingreso3
    print saltolinea
    print decofin 
    delay 150
    jmp menu

jugador2gana2:
    print saltolinea
    print dibujoingreso1
    print dibujoingreso2
    print mensajeSalida3
    print nombre
    print dibujoingreso3
    print saltolinea
    print decofin 
    delay 150
    jmp menu
posibleempate:
    cmp celda11, ' '
    je manejarturno
    cmp celda21, ' '
    je manejarturno
    cmp celda31, ' '
    je manejarturno
    cmp celda41, ' '
    je manejarturno
    cmp celda51, ' '
    je manejarturno
    cmp celda61, ' '
    je manejarturno
    cmp celda71, ' '
    je manejarturno
    jmp empate


empate:
    concatenarCadena linea111,reporte
    concatenarCadena linea112,reporte
    concatenarCadena linea113,reporte
    concatenarCadena linea114,reporte
    concatenarCadena linea115,reporte
    concatenarCadena linea116,reporte
    concatenarCadena linea117,reporte
    concatenarCadena linea118,reporte
    concatenarCadena linea119,reporte
    concatenarCadena linea10,reporte
    concatenarCadena linea11,reporte
    concatenarCadena nombre1,reporte
    concatenarCadena turno1,reporte
    concatenarCadena jugador1,reporte
    concatenarCadena linea12,reporte
    concatenarCadena linea11,reporte
    concatenarCadena nombre2,reporte
    concatenarCadena turno1,reporte
    concatenarCadena jugador2,reporte
    concatenarCadena linea12,reporte
    ; interrupcion para obtener la hora y a
    ; agregar la hora al reporte
 
    concatenarCadena linea13,reporte
    concatenarCadena linea14,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda11,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda21,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda31,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda41,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda51,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda61,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda71,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea18,reporte
    
    concatenarCadena linea14,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda12,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda22,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda32,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda42,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda52,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda62,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda72,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea18,reporte

    concatenarCadena linea14,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda13,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda23,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda33,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda43,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda53,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda63,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda73,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea18,reporte

    concatenarCadena linea14,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda14,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda24,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda34,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda44,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda54,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda64,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda74,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea18,reporte

    concatenarCadena linea14,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda15,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda25,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda35,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda45,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda55,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda65,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda75,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea18,reporte

    concatenarCadena linea14,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda16,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda26,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda36,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda46,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda56,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda66,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea15,reporte
    concatenarCadena celda76,reporte
    concatenarCadena linea16,reporte
    concatenarCadena linea18,reporte
    concatenarCadena linea19,reporte
   

    ;Limpiamos variables que utilizamos para escribir
    limpiar buffer, SIZEOF buffer,24h ;limpiamos el arreglo bufferentrada con $

    ;ObtenerTexto nombreArchivo (Por alguna razon aveces no se obtiene bien el nombre del archivo
    ;Y lo pueden ingresar manual en caso de cualquier error)
    mov nombrerep[0],82 ;R
    mov nombrerep[1],69 ;E
    mov nombrerep[2],80 ;P
    mov nombrerep[3],46  ;.
    mov nombrerep[4],72 ;h
    mov nombrerep[5],84 ;t
    mov nombrerep[6],77 ;m
    mov nombrerep[7],76 ;l

    ;Interrupcion para crear el archivo
    crear nombrerep, handler
    ;Interrupcion para escribir el archivo
    escribir handler, reporte, SIZEOF reporte
    ;Interrupcion para cerrar como que el buffer que se utilizo para escribir
    cerrar handler
    print saltolinea
    print dibujoingreso1
    print dibujoingreso2
    print mensajeSalida2
    print dibujoingreso3
    print saltolinea
    print decofin
    delay 100
    jmp menu
manejarturno:
    mov al, ' '
    mov vacio, al
    mov al, turno
    cmp al, jugador1
    je turnojugador1
    cmp al, jugador2
    je turnojugador2
    jmp error2

turnojugador1:
    
    mov al, turno
    mov simbolo, al
    mov al, jugador2
    mov turno, al
    print saltolinea
    print saltolinea
    print turno2
    print nombre1
    print turno0
    print jugador1
    print turno1
    getChar
    delay 5
    cmp al, 'z'
    je columna1
    cmp al, 'x'
    je columna2
    cmp al, 'c'
    je columna3
    cmp al, 'v'
    je columna4
    cmp al, 'b'
    je columna5
    cmp al, 'n'
    je columna6
    cmp al, 'm'
    je columna7
    cmp al, 'w'
    je guardarpartida
    jmp error3
turnojugador2:
    mov al, turno
    mov simbolo, al
    mov al, jugador1
    mov turno, al
    cmp computadora,'C'
    je turnocomputador
    print saltolinea
    print saltolinea
    print turno2
    print nombre2
    print turno0
    print jugador2
    print turno1
    getChar
    delay 5
    cmp al, 'z'
    je columna1
    cmp al, 'x'
    je columna2
    cmp al, 'c'
    je columna3
    cmp al, 'v'
    je columna4
    cmp al, 'b'
    je columna5
    cmp al, 'n'
    je columna6
    cmp al, 'm'
    je columna7
    cmp al, 'w'
    je guardarpartida
    jmp error3
turnocomputador:
    print saltolinea
    print saltolinea
    print saltolinea
    generarrandom columnasr
    delay 20
    cmp al, 'z'
    je columna1
    cmp al, 'x'
    je columna2
    cmp al, 'c'
    je columna3
    cmp al, 'v'
    je columna4
    cmp al, 'b'
    je columna5
    cmp al, 'n'
    je columna6
    cmp al, 'm'
    je columna7
    cmp al, 'w'
    je guardarpartida
    jmp error3
columna1:
    columnavacia vacio, celda16, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda15, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda14, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda13, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda12, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda11, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    jmp error3
columna2:

    columnavacia vacio, celda26, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda25, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda24, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda23, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda22, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda21, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    jmp error3
columna3:   
    columnavacia vacio, celda36, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda35, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda34, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda33, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda32, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda31, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    jmp error3
columna4:
    columnavacia vacio, celda46, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda45, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda44, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda43, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda42, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda41, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    jmp error3
columna5:
    columnavacia vacio, celda56, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda55, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda54, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda53, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda52, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda51, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    jmp error3
columna6:
    columnavacia vacio, celda66, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda65, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda64, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda63, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda62, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda61, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    jmp error3
columna7:
    columnavacia vacio, celda76, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda75, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda74, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda73, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda72, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    columnavacia vacio, celda71, simbolo
    cmp vacio, ' '
    jne imprimir_tablero
    jmp error3
guardarpartida:
    
    print decoinicio
    print saltolinea
    print mensajeSalida4
    print saltolinea
    print dibujoingreso1
    print dibujoingreso2
    print mensajeEntrada3
    print dibujoingreso3
    print espacioinicial
    Obtenernombre nombreArchivo1
    print saltolinea
    print decofin
    concatenarCadena extensionsave, nombreArchivo
    concatenarCadena finnum, nombreArchivo   
    concatenarCadena linea1, aGuardar
    concatenarCadena nombre1, aGuardar
    concatenarCadena turno1, aGuardar
    concatenarCadena jugador1,aGuardar
    concatenarCadena linea2,aGuardar
    concatenarCadena nombre2, aGuardar
    concatenarCadena turno1, aGuardar
    concatenarCadena jugador2,aGuardar
    concatenarCadena linea3,aGuardar
    concatenarCadena turno,aGuardar
    concatenarCadena linea4, aGuardar
    concatenarCadena computadora,aGuardar
    concatenarCadena linea5,aGuardar
    concatenarCadena skip,aGuardar
    concatenarCadena celda11,aGuardar
    concatenarCadena celda21,aGuardar
    concatenarCadena celda31,aGuardar
    concatenarCadena celda41,aGuardar
    concatenarCadena celda51,aGuardar
    concatenarCadena celda61,aGuardar
    concatenarCadena celda71,aGuardar
    concatenarCadena skip,aGuardar
    concatenarCadena celda12,aGuardar
    concatenarCadena celda22,aGuardar
    concatenarCadena celda32,aGuardar
    concatenarCadena celda42,aGuardar
    concatenarCadena celda52,aGuardar
    concatenarCadena celda62,aGuardar
    concatenarCadena celda72,aGuardar
    concatenarCadena skip,aGuardar
    concatenarCadena celda13,aGuardar
    concatenarCadena celda23,aGuardar
    concatenarCadena celda33,aGuardar
    concatenarCadena celda43,aGuardar
    concatenarCadena celda53,aGuardar
    concatenarCadena celda63,aGuardar
    concatenarCadena celda73,aGuardar
    concatenarCadena skip,aGuardar
    concatenarCadena celda14,aGuardar
    concatenarCadena celda24,aGuardar
    concatenarCadena celda34,aGuardar
    concatenarCadena celda44,aGuardar
    concatenarCadena celda54,aGuardar
    concatenarCadena celda64,aGuardar
    concatenarCadena celda74,aGuardar
    concatenarCadena skip,aGuardar
    concatenarCadena celda15,aGuardar
    concatenarCadena celda25,aGuardar
    concatenarCadena celda35,aGuardar
    concatenarCadena celda45,aGuardar
    concatenarCadena celda55,aGuardar
    concatenarCadena celda65,aGuardar
    concatenarCadena celda75,aGuardar
    concatenarCadena skip,aGuardar
    concatenarCadena celda16,aGuardar
    concatenarCadena celda26,aGuardar
    concatenarCadena celda36,aGuardar
    concatenarCadena celda46,aGuardar
    concatenarCadena celda56,aGuardar
    concatenarCadena celda66,aGuardar
    concatenarCadena celda76,aGuardar
    concatenarCadena skip,aGuardar
    



    ;Limpiamos variables que utilizamos para escribir
    limpiar buffer, SIZEOF buffer,24h ;limpiamos el arreglo bufferentrada con $
    mov nombreArchivo[0],80 ;p
    mov nombreArchivo[1],65 ;a
    mov nombreArchivo[2],82 ;r
    mov nombreArchivo[3],46  ;.
    mov nombreArchivo[4],83 ;s
    mov nombreArchivo[5],65 ;a
    mov nombreArchivo[6],86 ;v

    ;Interrupcion para crear el archivo
    crear nombreArchivo, handler
    ;Interrupcion para escribir el archivo
    escribir handler, aGuardar, SIZEOF aGuardar
    ;Interrupcion para cerrar como que el buffer que se utilizo para escribir
    cerrar handler
    
    delay 50
    jmp menu


main endp
end main

