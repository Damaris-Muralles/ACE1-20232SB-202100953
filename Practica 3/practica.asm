; llama a las macros
include macros1.asm
.model Large ; define el modelo de memoria

; ==================== segmento de pila ====================
.stack

; ==================== segmento de datos ====================
; ------- Variables a utilizar -------
.data

; Informacion de desarrollador
decoinicio db 0ah,0dh, '.*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*','$'
infoinicial1 db 0ah,0dh, '::                                                ::', '$'
infoinicial2 db 0ah,0dh, ':: UNIVERSIDAD SAN CARLOS DE GUATEMALA            ::', '$'
infoinicial3 db 0ah,0dh, ':: FACULTAD DE INGENIERIA                         ::', '$'
infoinicial4 db 0ah,0dh, ':: ARQUITECTURA DE COMPUTADORAS Y ENSAMBLADORES 1 ::', '$'   
infoinicial5 db 0ah,0dh, ':: SECCION B                                      ::', '$'    
infoinicial6 db 0ah,0dh, '::                                                ::', '$'  
infoinicial7 db 0ah,0dh, ':: NOMBRE: DAMARIS JULIZZA MURALLES VELIZ         ::', '$'   
infoinicial8 db 0ah,0dh, ':: CARNE: 202100953                               ::', '$'
infoinicial9 db 0ah,0dh, '::                                                ::', '$'
decofin db 0ah,0dh, '*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*.','$'

; Menu de opciones principal
menu1 db 0ah,0dh, ':: (\_(\ ...*...*...*...*...*...*...*...*...*...*...', '$'
menu2 db 0ah,0dh, '*: (='':'') ::::::::  MENU PRINCIPAL  ::::::::::::::::','$'
menu3 db 0ah,0dh, '*: (,(")(")...*...*...*...*...*...*...*...*...*...','$'
menu4 db 0ah,0dh,'*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*.','$'
menu5 db 0ah,0dh,'::                                                ::','$'
menu6 db 0ah,0dh,'::            1. Jugador vs. Jugador              ::','$'
menu7 db 0ah,0dh,'::            2. Jugador vs. Computadora          ::','$'
menu8 db 0ah,0dh,'::            3. Cargar partida                   ::','$'
menu9 db 0ah,0dh,'::            4. Ayuda                            ::','$'
menu10 db 0ah,0dh,'::            5. Salir                            ::','$'
menu11 db 0ah,0dh,'::                                                ::','$'

; Mensaje de presionar tecla
presionarTecla db 0ah,0dh, 'Presione ''Enter'' para continuar...','$'

; Mensaje para escoger opcion
mensajeOpcion db 0ah,0dh, '--> Ingrese una opcion: ','$'
; Informacion de ayuda
ayuda2 db 0ah,0dh, ' Continuar: n  Salir: q','$'

; Mensaje de entradas y salida
dibujoingreso1 db 0ah,0dh, '(\(\ ','$'
dibijoingreso2 db 0ah,0dh, '( ^.^) -> ','$'
dibujoingreso3 db 0ah,0dh, 'o_(")(") ','$'

mensajeEntrada1 db 'Ingrese el nombre del jugador 1: ','$'
mensajeEntrada2 db 'Ingrese el nombre del jugador 2: ','$'
mensajeSalida1 db ' Gracias por jugar!','$'

; mensajes de incio partida
mensajeinicio1 db 0ah,0dh, '          NUEVA PARTIDA: ','$'
mensajeinicio2 db' VS ','$'



; Mensaje de error
Errord1 db 0ah,0dh, '(\(\ ','$'
Errord2 db 0ah,0dh, '( X.X) -> ERROR:','$'
Errord3 db 0ah,0dh, 'o_(")(") ','$'

mesajeError1 db 'Opcion invalida','$'
mesajeError2 db 'Solo puede presionar Enter ingresar al menu','$'
mesajeError3 db 'No se puede realizar la accion','$'





;Salto de linea 
skip db 0ah,0dh, ' ', '$'

;Salto de linea
saltolinea db 10,'$'


;Variables para los nombres
nombre1 db 100 dup ('$'), '$'
nombre2 db 100 dup ('$'), '$'
jugador1 db 'X' ; Carácter de ficha del jugador 1
jugador2 db 'O' ; Carácter de ficha del jugador 2
vacio db ' '   ; Carácter para celdas vacías

;Maneja la entrada del teclado
handlerentrada dw ?


tablero db 7 dup (6 dup('$')),'$'
columnas db 'z','x','c','v','b','n','m', '$'
bordestablero db '-','-','-','-','-','-','-', '$'

; ==================== segmento de codigo ====================

.code
main proc far
mov ax,@data
mov ds,ax
mov es,ax


inicio:
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
    print dibijoingreso2
    print mensajeEntrada1
    print dibujoingreso3
    ObtenerTexto nombre1
    print saltolinea
    clear
    print decoinicio
    print saltoLinea
    print dibujoingreso1
    print dibijoingreso2
    print mensajeEntrada2
    print dibujoingreso3
    ObtenerTexto nombre2
    print saltolinea
    clear 
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
    
    delay 55
    jmp juego

jugadorvscomputadora:
    clear
    print decoinicio
    print saltoLinea
    print dibujoingreso1
    print dibijoingreso2
    print mensajeEntrada1
    print dibujoingreso3
    ObtenerTexto nombre1
    print saltolinea
    jmp salir

cargarpartida:
    clear
    print menu8
    jmp salir

ayuda:
    clear
    print menu9
    jmp salir


juego:
    clear
        ; Imprimir el tablero
    imprimirtablero columnas,20h,20h
    print saltolinea
    print saltolinea
    print decoinicio
    imprimirtablero bordestablero,20h,20h

    ; Pedir al usuario que ingrese una columna
    ;call leer_entrada

    ; Verificar si la entrada es válida y obtener la columna correspondiente
    ;call validar_entrada
    ;jc juego ; Si la entrada no es válida, volver al inicio del juego

    ; Colocar la ficha en la columna
    ;call colocar_ficha
    ;jc juego ; Si la columna está llena, volver al inicio del juego

    ; Verificar si el juego ha terminado
    ;call verificar_fin_juego
    ;jnc juego ; Si el juego no ha terminado, volver al inicio del juego
    print decofin

    jmp salir
    





; ERRORES DENTRO DEL PROGRAMA
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





    ; SALIR DEL PROGRAMA    
    salir:
        print decoinicio
        print saltoLinea
        print dibujoingreso1
        print dibijoingreso2
        print mensajeSalida1
        print dibujoingreso3
        print decofin
        print saltolinea
        print saltolinea
        

        close

main endp
end main

