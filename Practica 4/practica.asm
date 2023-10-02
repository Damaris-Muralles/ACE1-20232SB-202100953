; llama a las macros
include macros1.asm
.model Large ; define el modelo de memoria

; ==================== segmento de pila ====================
.stack

; ==================== segmento de datos ====================
; ------- Variables a utilizar -------
.data

; ================================ VARIABLES EXTRA PARA EL JUEGO ================================
;Salto de linea mas espacio
skip db 0ah,0dh, ' ', '$'

;Salto de linea
saltolinea db 10,'$'

; ============================================ CARTELES ===========================================
; PANTALLA DE INFORMACION INICIAL
decoinicio db 0ah,0dh, '  .*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*','$'
decofin db 0ah,0dh, '  *..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*.','$'

infoinicial1 db 0ah,0dh, '  ::                                                ::', '$'
infoinicial2 db 0ah,0dh, '  :: UNIVERSIDAD SAN CARLOS DE GUATEMALA            ::', '$'
infoinicial3 db 0ah,0dh, '  :: FACULTAD DE INGENIERIA                         ::', '$'
infoinicial4 db 0ah,0dh, '  :: ESCUELA DE CIENCIAS Y SISTEMAS                 ::', '$'
infoinicial5 db 0ah,0dh, '  :: ARQUITECTURA DE COMPUTADORAS Y ENSAMBLADORES 1 ::', '$'   
infoinicial6 db 0ah,0dh, '  :: SECCION B                                      ::', '$'    
infoinicial7 db 0ah,0dh, '  :: SEGUNDO SEMESTRE 2023                          ::', '$'  
infoinicial8 db 0ah,0dh, '  :: NOMBRE: DAMARIS JULIZZA MURALLES VELIZ         ::', '$'   
infoinicial9 db 0ah,0dh, '  :: CARNE: 202100953                               ::', '$'
infoinicial10 db 0ah,0dh, '  :: PRACTICA 4                                     ::', '$'

; PANTALLA DE MENU PRINCIPAL
menu1 db 0ah,0dh, '  :: (\_(\ ...*...*...*...*...*...*...*...*...*...*...', '$'
menu2 db 0ah,0dh, '  *: (='':'') ::::::::  MENU PRINCIPAL  ::::::::::::::::','$'
menu3 db 0ah,0dh, '  *: (,(")(")...*...*...*...*...*...*...*...*...*...*.','$'
menu4 db 0ah,0dh,'  *..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*..*"*.','$'
menu5 db 0ah,0dh,'  ::                                                ::','$'
menu6 db 0ah,0dh,'  ::            1. Cargar archivo                   ::','$'
menu7 db 0ah,0dh,'  ::            2. Modo calculadora                 ::','$'
menu8 db 0ah,0dh,'  ::            3. Factorial                        ::','$'
menu9 db 0ah,0dh,'  ::            4. Crear reporte                    ::','$'
menu10 db 0ah,0dh,'  ::            5. Salir                            ::','$'
menu11 db 0ah,0dh,'  ::                                                ::','$'

; ERRORES 

Errord1 db 0ah,0dh, '  (\(\ ','$'
Errord2 db 0ah,0dh, '  ( X.X) -> ERROR:','$'
Errord3 db 0ah,0dh, '  o_(")(") ','$'

; INGRESO DE DATOS

dibujoingreso1 db 0ah,0dh, '  (\(\ ','$'
dibujoingreso2 db 0ah,0dh, '  ( ^.^) -> ','$'
dibujoingreso3 db 0ah,0dh, '  o_(")(") ','$'


; ======================================== MENSAJES ENTRADAS ========================================


; Mensaje de presionar tecla
presionarTecla db 0ah,0dh, '  Presione ''Enter'' para continuar...','$'

; Mensaje para escoger opcion
mensajeOpcion db 0ah,0dh, '  --> Ingrese una opcion: ','$'
mensajeIngresonum db 0ah,0dh, '  --> Ingrese un numero: ','$'
mensajeOp db 0ah,0dh, '  --> Ingrese un operador: ','$'
mensajeOperacion db 0ah,0dh, '  --> Ingrese un operador o "=" para finalizar: ','$'
mensajeGuardar db 0ah,0dh, '  --> Desea guardar (S/N): ','$'


; ======================================== MENSAJES SALIDAS  ========================================
mensajeResultado db 0ah,0dh, '  --> El resultado es: ','$'
; ======================================== MENSAJES DE ERROR ========================================
mesajeError0 db 'Solo puede presionar Enter ingresar al menu','$'
mesajeError1 db 'Opcion invalida','$'
mesajeError2 db 'Operador invalido','$'
mesajeError3 db 'No puede sobrepasar los 10 operandos','$'
; ======================================== VARIABLES DE CONTROL  ========================================
;Maneja la entrada del teclado
handlerentrada dw ?


;Donde se guardar las operaciones
operaciones db 800 dup('$'), '$'

;Donde donde un simbolo 
simbolo db 5 dup ('$'), '$'

;Variables para numero 1
numero1 db 50 dup ('$'), '$'
test1  db 0
num1 db 50 dup ('$'), '$'
num2 db 50 dup ('$'), '$'
resul db 0
signo db 5 dup('$'), '$'   

;Variables para  numero 2
numero2 db 50 dup ('$'), '$'
resul2 db 0000
num3 db 100 dup('$'), '$'
num4 db 100 dup('$'), '$'
test2  db 0
signo2 db 5 dup('$'), '$'

; variables para el resultado
resultado2 db 100 dup('$') , '$'
signo3 db 5 dup('$'), '$'

operandos db 0



;Convertida
operacionactual db 100 dup('$') , '$'

; ==================== segmento de codigo ====================

.code
main proc far
mov ax,@data
mov ds,ax
mov es,ax

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
    print infoinicial10
    print infoinicial1
    print decofin
    print presionarTecla
    getChar
    print saltolinea

    cmp al,13 ; Enter
    je menu

    jmp error0


menu:
    clear
    mov operandos,0
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
    je cargarArchivo

    cmp al,50 ; opcion 2    
    je calculadora

    cmp al,51 ; opcion 3
    je factorial

    cmp al,52 ; opcion 4
    je reportecalc
    
    cmp al,53 ; opcion 5
    je salir

    jmp error1

cargarArchivo:
    print menu6
    delay 50
    jmp menu
calculadora:
    print saltolinea
    print mensajeIngresonum
    ObtenerTexto numero1
    print mensajeOp
    ObtenerTexto simbolo
    print mensajeIngresonum
    ObtenerTexto numero2
    ;Extraemos los numeros y los convertimos
    extractorCompleto numero1,num1,num2,signo,test1
    conversor num1,resul,num2
    inc operandos
    extractorCompleto numero2,num3,num4,signo2,test2
    conversor num3,resul2,num4
    inc operandos
    print numero1
    print simbolo
    print numero2
    concatenarCadena numero1,operacionactual
    print saltolinea
    print operacionactual
    ;Revisamos que operacion es
    jmp veroperacion

factorial:
    print menu8
    delay 50
    jmp menu
reportecalc:
    print menu9
    delay 50
    jmp menu


salir:
    close


; ================================ funciones para modo calculadora y factorial ===============================
veroperacion:
   ;Empezamos a leer cual tipo de operacion es 
    mov al,simbolo
    cmp al,43 ;sumar ASCII
    je sum
    cmp al,45 ;restar ASCII
    je res
    cmp al,42 ;multiplicar ASCII
    je multip
    cmp al,47 ;dividir ASCII
    je division

    jmp error2
sum:
    ;Ejecutamos una suma
    sumar resul,test1,resul2,test2,resultado2,signo3
    
    jmp otroOperando
   
    

res:
    restar resul,test1,resul2,test2,resultado2,signo3
    
    jmp otroOperando

multip:
    ;Ejecutamos una multiplicacion
    multiplicar resul,test1,resul2,test2,resultado2,signo3
    jmp otroOperando
    

division:
    
    dividir resul,test1,resul2,test2,resultado2,signo3
    jmp otroOperando

otroOperando:
    ;pedimos otro operando
    print mensajeOperacion
    ObtenerTexto simbolo

    ; revisamos si es un igual
    mov al,simbolo
    cmp al,61 ;igual ASCII
    je imprimirResultado
    mov al,operandos
    cmp al,10 ; si ya hay 10 operaciones no se puede agregar otro
    je error3

    ; si no lo es, pedimos otro numero
    print mensajeIngresonum
    ObtenerTexto numero2
    inc operandos
    print numero2
    concatenarCadena simbolo,operacionactual
    concatenarCadena numero2,operacionactual
    ; extraemos el numero y lo convertimos
    extractorCompleto numero2,num3,num4,signo2,test2
    conversor num3,resul2,num4
    ; colocamos el resultado del numero anterior en el primer numero
    mov al,resultado2
    mov resul,al
    ; revisamos que operacion es
    jmp veroperacion

imprimirResultado:
    print saltolinea
    print mensajeResultado
    print signo3
    imprimirDecimal resultado2
    print saltolinea
    print mensajeGuardar
    getChar
    cmp al,115 ; S
    je guardarop
    cmp al,110 ; N
    je menu
    jmp error1
guardarop:
    print saltolinea
    print operacionactual
    delay 150
    jmp menu
;=============================== errores ===============================
error0:
    print Errord1
    print Errord2
    print mesajeError0
    print Errord3
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
    delay 35
    clear
    jmp menu
error2:
    print Errord1
    print Errord2
    print mesajeError2
    print Errord3
    print saltolinea
    delay 35
    clear
    jmp menu
error3:
    print Errord1
    print Errord2
    print mesajeError3
    print Errord3
    print saltolinea
    delay 35
    clear
    jmp menu




main endp
end main

