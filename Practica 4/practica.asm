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
mensajeGuardar db 0ah,0dh, '  --> Desea guardar (s/n): ','$'


; ======================================== MENSAJES SALIDAS  ========================================
mensajeResultado db 0ah,0dh, '  --> El resultado es: ','$'
mensajeResultado1 db 0ah,0dh, '  --> Operacion: ','$'
; ======================================== MENSAJES DE ERROR ========================================
mesajeError0 db 'Solo puede presionar Enter ingresar al menu','$'
mesajeError1 db 'Opcion invalida','$'
mesajeError2 db 'Operador invalido','$'
mesajeError3 db 'No puede sobrepasar los 10 operandos','$'
mesajeError4 db 'Se llego al maximo de operaciones que se pueden guardar','$'
mesajeError5 db 0ah,0dh, 'ERROR: Opcion invalida','$'
mesajeError6 db 'El numero es muy grande para calcular el factorial','$'

; ======================================== VARIABLES DE CONTROL  ========================================
;Maneja la entrada del teclado
handlerentrada dw ?

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
;Convertida
conver db 100 dup('$') , '$'

operandos db 0
operacionactual db 100 dup('$'), '$'
; ================================ VARIABLES PARA EL FACTORIAL ================================
numfact db 8 dup('$'), '$'
operacionfactorial db 100 dup('$'), '$'
simbolofactorial db '!', '$'
simboloigual db '=', '$'
multisimbolo db '*', '$'
espaciosep db ' ', '$'
; ================================ VARIABLES PARA REPORTES ================================
id1 db 'Op1', '$'
op1 db 200 dup('$'), '$'
res1 db 100 dup('$'), '$'
id2 db 'Op2', '$'
op2 db 200 dup('$'), '$'
res2 db 100 dup('$'), '$'
id3 db 'Op3', '$'
op3 db 200 dup('$'), '$'
res3 db 100 dup('$'), '$'
id4 db 'Op4', '$'
op4 db 200 dup('$'), '$'
res4 db 100 dup('$'), '$'
id5 db 'Op5', '$'
op5 db 200 dup('$'), '$'
res5 db 100 dup('$'), '$'
id6 db 'Op6', '$'
op6 db 200 dup('$'), '$'
res6 db 100 dup('$'), '$'
id7 db 'Op7', '$'
op7 db 200 dup('$'), '$'
res7 db 100 dup('$'), '$'
id8 db 'Op8', '$'
op8 db 200 dup('$'), '$'
res8 db 100 dup('$'), '$'
id9 db 'Op9', '$'
op9 db 200 dup('$'), '$'
res9 db 100 dup('$'), '$'
id10 db 'Op10', '$'
op10 db 200 dup('$'), '$'
res10 db 100 dup('$'), '$'
; =============================== VARIABLES PARA EL ARCHIVO =============================== 
; ==================== segmento de codigo ====================

.code
main proc far
mov ax,@data
mov ds,ax
mov es,ax
begin:
    mov si,0
    push si
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
    limpiar operacionactual, SIZEOF operacionactual,'$'
    limpiar simbolo, SIZEOF simbolo,'$'
    limpiar numero1, SIZEOF numero1,'$'
    limpiar numero2, SIZEOF numero2,'$'
    limpiar conver, SIZEOF conver,'$'
    limpiar resultado2, SIZEOF resultado2,'$'
    limpiar operacionfactorial, SIZEOF operacionfactorial,'$'
    mov si,0
    push si
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
    concatenarCadena numero1,operacionactual
    concatenarCadena simbolo,operacionactual
    concatenarCadena numero2,operacionactual
    ;Revisamos que operacion es
    jmp veroperacion

factorial:
    mov si,0
    push si
    mov resultado2,1
    print saltolinea
    print mensajeIngresonum
    ObtenerTexto numero1
    extractorCompleto numero1,num1,num2,signo,test1
    conversor num1,resul,num2
    concatenarCadena num1,operacionfactorial
    concatenarCadena simbolofactorial,operacionfactorial
    concatenarCadena simboloigual,operacionfactorial
    mov al, 1
    cmp resul,0
    je cerofactorial
    ConverString resultado2,conver
    concatenarCadena conver,operacionfactorial
    mov al, 1
    cmp resul,1
    je proceFactorial
    cmp resul,2
    je proceFactorial
    cmp resul,3
    je proceFactorial
    cmp resul,4
    je proceFactorial
    jmp error6
reportecalc:
    print menu9
    delay 50
    jmp menu


salir:
    close


; ================================ funciones para modo calculadora ===============================
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
    imprimirDecimal resultado2,conver
    print saltolinea
    print mensajeGuardar
    getChar
    cmp al,115 ; S
    je guardarop
    cmp al,110 ; N
    je menu
    jmp error5
guardarop:
    mov si,0
    push si
    cmp op1,'$'
    je guardar1
    cmp op2,'$'
    je guardar2
    cmp op3,'$'
    je guardar3
    cmp op4,'$'
    je guardar4
    cmp op5,'$'
    je guardar5
    cmp op6,'$'
    je guardar6
    cmp op7,'$'
    je guardar7
    cmp op8,'$'
    je guardar8
    cmp op9,'$'
    je guardar9
    cmp op10,'$'
    je guardar10
    jmp error4
guardar1:
    concatenarCadena operacionactual,op1
    mov si,0
    push si
    concatenarCadena signo3,res1
    concatenarCadena conver,res1
    print saltolinea
    print op1
    print saltolinea
    print res1
    delay 160
    jmp menu
guardar2:
    concatenarCadena operacionactual,op2
    mov si,0
    push si
    concatenarCadena signo3,res2
    concatenarCadena conver,res2
    jmp menu
guardar3:
    concatenarCadena operacionactual,op3
    mov si,0
    push si
    concatenarCadena signo3,res3
    concatenarCadena conver,res3
    jmp menu
guardar4:
    concatenarCadena operacionactual,op4
    mov si,0
    push si
    concatenarCadena signo3,res4
    concatenarCadena conver,res4
    jmp menu
guardar5:
    concatenarCadena operacionactual,op5
    mov si,0
    push si
    concatenarCadena signo3,res5
    concatenarCadena conver,res5
    jmp menu
guardar6:
    concatenarCadena operacionactual,op6
    mov si,0
    push si
    concatenarCadena signo3,res6
    concatenarCadena conver,res6
    jmp menu
guardar7:
    concatenarCadena operacionactual,op7
    mov si,0
    push si
    concatenarCadena signo3,res7
    concatenarCadena conver,res7
    jmp menu
guardar8:
    concatenarCadena operacionactual,op8
    mov si,0
    push si
    concatenarCadena signo3,res8
    concatenarCadena conver,res8
    jmp menu
guardar9:
    concatenarCadena operacionactual,op9
    mov si,0
    push si
    concatenarCadena signo3,res9
    concatenarCadena conver,res9
    jmp menu
guardar10:
    concatenarCadena operacionactual,op10
    mov si,0
    push si
    concatenarCadena signo3,res10
    concatenarCadena conver,res10
    jmp menu
; ================================ funciones para el factorial ===============================
proceFactorial:
    mov numfact,al
    ConverString numfact,conver
    concatenarCadena espaciosep,operacionfactorial
    concatenarCadena conver,operacionfactorial
    concatenarCadena simbolofactorial,operacionfactorial
    concatenarCadena simboloigual,operacionfactorial
    concatenarCadena conver,operacionfactorial
    concatenarCadena multisimbolo,operacionfactorial
    ConverString resultado2,conver
    concatenarCadena conver,operacionfactorial
    concatenarCadena simboloigual,operacionfactorial
    mov al, numfact
    factorialm al,resultado2,conver
    concatenarCadena conver,operacionfactorial
   
    mov al, numfact
    cmp al,resul
    je terminadofactorial
    
    inc al
    
    jmp proceFactorial
cerofactorial:
    ConverString resultado2,conver
    concatenarCadena conver,operacionfactorial
    print mensajeResultado1
    print operacionfactorial
    print mensajeResultado
    print conver
    delay 150
    jmp menu
terminadofactorial:
    print mensajeResultado1
    print operacionfactorial
    print mensajeResultado
    print conver
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
error4:
    print Errord1
    print Errord2
    print mesajeError4
    print Errord3
    print saltolinea
    delay 35
    clear
    jmp menu
error5:
    print mesajeError5
    jmp imprimirResultado
error6:
    print Errord1
    print Errord2
    print mesajeError6
    print Errord3
    print saltolinea
    delay 35
    clear
    jmp menu
main endp
end main

