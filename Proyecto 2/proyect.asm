; llama a las macros
include macros1.asm
.model Large ; define el modelo de memoria

; ==================== segmento de pila ====================
.stack

; ==================== segmento de datos ====================
; ------- Variables a utilizar -------
.data

; ========================================= VARIABLES EXTRA ========================================
;Salto de linea mas espacio
skip db 0ah,0dh, ' ', '$'
;Salto de linea
saltolinea db 10,'$'
;Maneja la entrada del teclado
handlerentrada dw ?

; ===================================== MENUS ===========================================
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
infoinicial10 db 0ah,0dh, '  :: PROYECTO 2                                     ::', '$'

;MENU INICIAL  
menuVideo1 db 'F1 - Iniciar sesion' , '$'
menuVideo2 db 'F2 - Registrar nuevo usuario' , '$'
menuVideo3 db 'F3 - Salir ' , '$'


; ======================================== MENSAJES DE ERROR ========================================
mesajeError0 db 'ERROR: Opcion invalida','$'
mesajeError1 db 'ERROR: Contrasena incorrecta' , '$'
mesajeError2 db 'ERROR: Usuario bloqueado' , '$'
mesajeError3 db 'ERROR: Usuario no existe' , '$'
mesajeError4 db 'ERROR: Problema al buscar datos' , '$'
mesajeError5 db 'ERROR: Usuario ya existe' , '$'
mesajeError7 db  'ERROR: al abrir el archivo ' , '$'
mesajeError8 db  'ERROR: al cerrar el archivo' , '$'
mesajeError9 db  'ERROR: al escribir en el archivo' , '$'
mesajeError10 db 'ERROR: al crear en el archivo' , '$'
mesajeError11 db 'ERROR: al leer en el archivo' , '$'

; ========================= VARIABLES PARA REGISTRO E INICIO SESION=========================
mensajeintento db 'Intentos restantes: ' , '$'
menuIngresoDato1 db 'Ingrese Nombre: ' , '$'
menuIngresoDato2 db 'Ingrese password: ' , '$'

nombreuser db 20 dup ('$'), '$'
contraseniauser db 25 dup ('$'), '$'

opcion db 0

; =============================== VARIABLES PARA EL ARCHIVO =============================== 
; PARA REPORTE
nombreArchivo db 'SYS.HTML',0
reporte db 30000 dup(' '), '$'
ruta db 50 dup('$'), '00h'
handler0 dw ?

; PARA LEER ARCHIVO DE USUARIO Y PUNTOS
rute db 'c:/masm611/bin/USRS.ACE' ,'00h'
handler1 dw ?
rute1 db 'c:/masm611/bin/PUNTOS.ACE' ,'00h'
handler2 dw ?
buffer db 1000 dup('$'), '$'

contadorlect dw 0
aux db 0
datosEncont db 2000 dup('$'), '$'
datoUser db 30 dup('$') , '$'
datoPass db 30 dup('$') , '$'
Ro1 db 'Admino' , '$'
Ro2 db 'Admin' , '$'
Ro3 db 'User' , '$'
RolAr db 50 dup('$') , '$'
datoAr db 50 dup('$') , '$'
punteoAr db 50 dup('$') , '$'

intentos db 3
; =============================== VARIABLES PARA EL JUEGO ===============================
conver db 100 dup('$') , '$'
;---------------------------------VARIABLES PARA MODO VIDEO---------------------------------
columna db 0
fila db 0
contador db 0
posicionX dw 0
posicionY dw 0

;Para dibujar el tablero
posicionTableroX dw 0
posicionTableroY dw 0

;Para dibujar los carriles
posicionCarrilesX dw 0
posicionCarrilesY dw 0

;Manejar la posicion del personaje
posicionPersonajeX dw 0
posicionPersonajeY dw 0

;Manejar la posicion del carro
posicionCarroX dw 0
posicionCarroY dw 0
contadorPosicionCarro db 0

;Para dibujar la division de los carriles
posicionDivisionCarrilesX dw 0
posicionDivisionCarrilesY dw 0
contadorPixelesSeparacion dw 0

;Seleccionar pagina 
pagina db 0


; ============================================== segmento de codigo ===================================

.code
main proc far	
mov ax,@data
mov ds,ax
mov es,ax


MenuInfo:
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

		delay 80 ;Tiempo de espera
		clear


Video:
	;Iniciamos el modo video
	CALL modoVideoIniciar

	;Iniciamos la pagina a escribir
	mov pagina, 0

	jmp MenuInicial
; ================================ etiquetas para control de menu principal ==============================
MenuInicial:
	call limpiarEnColorNegro
	;Limpiamos los registros
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
	;reestablecer variables
	limpiar nombreuser, SIZEOF nombreuser,'$'
	limpiar contraseniauser, SIZEOF contraseniauser,'$'
	limpiar datoUser, SIZEOF datoUser,'$'
	limpiar datoPass, SIZEOF datoPass,'$'
	limpiar RolAr, SIZEOF RolAr,'$'
	limpiar datoAr, SIZEOF datoAr,'$'
	limpiar conver, SIZEOF conver,'$'
	limpiar buffer, SIZEOF buffer,'$'
	mov opcion,0
	mov intentos,3


	;Necesitamos colocar en una posicion el cursor
	mov columna, 6
	mov fila, 10
	call colocarCursor
	print menuVideo1

	;Necesitamos colocar en una posicion el cursor
	mov columna, 6
	mov fila, 11
	call colocarCursor
	print menuVideo2

	;Necesitamos colocar en una posicion el cursor
	mov columna, 6
	mov fila, 12
	call colocarCursor
	print menuVideo3

	getChar
	
	cmp al,59 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je InicioSesion
	cmp al,60 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je InicioRegistro
	cmp al,61 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je salirPrograma
	; si no saltar a error
	
	
	;jmp error0
	jmp MenuInicial

InicioSesion:
	call limpiarEnColorNegro
	mov columna, 4
	mov fila, 9
	call colocarCursor
	print mensajeintento
	ConverString intentos,conver
	print conver
	
	mov columna, 4
	mov fila, 11
	call colocarCursor
	print menuIngresoDato1
	ObtenerTexto nombreuser

	mov columna, 4
	mov fila, 13
	call colocarCursor
	print menuIngresoDato2
	ObtenerTexto contraseniauser
	limpiar conver, SIZEOF conver,'$' 
	mov opcion,0
	
	jmp userArchivo
InicioRegistro:
	call limpiarEnColorNegro
	
	mov columna, 3
	mov fila, 11
	call colocarCursor
	print menuIngresoDato1
	ObtenerTexto nombreuser

	mov columna, 3
	mov fila, 13
	call colocarCursor
	print menuIngresoDato2
	ObtenerTexto contraseniauser
	limpiar conver, SIZEOF conver,'$' 
	mov opcion,1

	jmp salirPrograma

salirPrograma:
	CALL modoVideoFinalizar
	jmp salir

salir:
    close
; ---------- lectura de archivo de usuario buscando datos  ----------
userArchivo:

	abrir rute,handler1  ;le mandamos la ruta y el handler,que será la referencia al fichero 
	limpiar buffer, SIZEOF buffer,24h  ;limpiamos la variable donde guardaremos los datos del archivo 
	leer handler1, buffer, SIZEOF buffer ;leemos el archivo
	cerrar handler1 
	limpiar datoUser, SIZEOF datoUser,'$' 
	limpiar datoAr, SIZEOF datoAr,'$' 
	limpiar RolAr, SIZEOF RolAr,'$' 
	limpiar datoPass, SIZEOF datoPass,'$' 
	mov si,0
	;Limpieza de los registros
	xor bx,bx
	xor cx,cx
	
	jmp encontraruser


encontraruser:
	
	mov al,buffer[bx]
	cmp al,58 ;simbolo comillas ASCII
	je encontrado
	mov datoUser[si],al
	
	cmp al,36
	je emergencia1
	cmp bx,800
	je emergencia

	;Incrementamos el indice
	inc bx 
	inc si
	;Si no es el que buscamos volvemos a buscar 
	jmp encontraruser
encontrado:
	mov si,0
	push si
	mov si,0
	inc bx
	jmp encontrarpass
	

encontrarpass:
	mov al,buffer[bx]
	cmp al,58 ;simbolo comillas ASCII
	je encontrado1
	mov datoPass[si],al
	
	
	cmp bx,800
	je emergencia


	;Incrementamos el indice
	inc bx
	inc si
	;Si no es el que buscamos volvemos a buscar 
	jmp encontrarpass

encontrado1:
	mov si,0
	push si
	mov si,0
	inc bx
	jmp encontrarrol



encontrarrol:
	mov al,buffer[bx]
	cmp al,58 ;simbolo comillas ASCII
	je encontrado2
	mov RolAr[si],al
	
	;(Tener cuidado ya que si no hay condicion de salida se encicla)
	;Salida de emergencia mas de 200 de llegada del indice, pueden poner un mayor
	cmp bx,800
	je emergencia


	;Incrementamos el indice
	inc bx
	inc si
	;Si no es el que buscamos volvemos a buscar 
	jmp encontrarrol
encontrado2:
	mov si,0
	push si
	mov si,0
	inc bx
	jmp encontrarbloqueo

encontrarbloqueo:
	mov al,buffer[bx]
	cmp al,44 ;simbolo comillas ASCII
	je encontrado3
	mov datoAr[si],al
	
	;(Tener cuidado ya que si no hay condicion de salida se encicla)
	;Salida de emergencia mas de 200 de llegada del indice, pueden poner un mayor
	cmp bx,800
	je emergencia


	;Incrementamos el indice
	inc bx
	inc si
	;Si no es el que buscamos volvemos a buscar 
	jmp encontrarbloqueo
encontrado3:
	
	mov al,opcion
	cmp al,0
	je buscarCoincidencia
	jmp buscarNoCoincidencia

buscarCoincidencia:
	mov si,0
	push si
	compararcadena nombreuser,datoUser,aux
	mov si,0
	dec bx
	mov al,aux
	cmp al,1
	je comprobandocredencial
	mov si,0
	inc bx
	inc bx
	jmp encontraruser
buscarNoCoincidencia:
	mov si,0
	push si
	compararcadena nombreuser,datoUser,aux
	mov si,0
	inc bx
	mov al,aux
	cmp al,0
	je encontraruser
	jmp error5
emergencia:
	jmp error4
emergencia1:
	mov al,opcion
	cmp al,1
	je salirPrograma
	jmp error3

comprobandocredencial:
	mov si,0
	push si
	compararcadena contraseniauser,datoPass,aux
	mov si,0
	mov al,aux
	cmp al,0
	je error1
	mov al,datoAr[0]
	cmp al,49
	je error2
	jmp menus 
menus:
	mov si,0
	push si
	compararcadena RolAr,Ro1,aux
	mov si,0
	mov al,aux
	cmp al,1
	je menuAdminOriginal
	mov si,0
	push si
	compararcadena RolAr,Ro2,aux
	mov si,0
	mov al,aux
	cmp al,1
	je menuAdministrador
	mov si,0
	push si
	compararcadena RolAr,Ro3,aux
	mov si,0
	mov al,aux
	cmp al,1
	je 	MenuUsuario
    jmp error4
RepeirIntento:
	limpiar contraseniauser, SIZEOF contraseniauser,'$'
	dec intentos
	mov al,intentos
	cmp al,0
	je error2
	call limpiarEnColorNegro
	mov columna, 4
	mov fila, 9
	call colocarCursor
	print mensajeintento
	ConverString intentos,conver
	print conver
	
	mov columna, 4
	mov fila, 11
	call colocarCursor
	print menuIngresoDato1
	print nombreuser

	mov columna, 4
	mov fila, 13
	call colocarCursor
	print menuIngresoDato2
	ObtenerTexto contraseniauser

	mov si,0
	push si
	compararcadena contraseniauser,datoPass,aux
	
	mov si,0
	mov al,aux
	cmp al,0
	je error1

	jmp menus

; ================================ etiquetas para control de menu administrador original ==============================
;<=>?@ABCD133134
menuAdminOriginal:
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 9
	call colocarCursor
	print menuVideo1
	delay 100
	jmp salirPrograma
; ================================ etiquetas para control de menu administrador ==============================

menuAdministrador:
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 9
	call colocarCursor
	print menuVideo2
	delay 100
	jmp menuAdministrador
; ================================ etiquetas para control de menu usuario ==============================
MenuUsuario:
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 9
	call colocarCursor
	print menuVideo3
	delay 100
	jmp MenuUsuario
; ================================ funciones para manejo del archivo ===============================

entrada1:
    abrir rute1,handler2  ;le mandamos la ruta y el handler,que será la referencia al fichero 
    limpiar buffer, SIZEOF buffer,24h  ;limpiamos la variable donde guardaremos los datos del archivo 
    leer handler2, buffer, SIZEOF buffer ;leemos el archivo
    cerrar handler2
    mov si,0
    ;Limpieza de los registros
    xor bx,bx
    xor cx,cx
	print saltolinea
	print buffer
    jmp salir

;=============================== errores ===============================
error0:
   	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
    print mesajeError0
   	delay 100
	jmp MenuInicial
error1:
	call limpiarEnColorNegro
	mov columna, 4
	mov fila, 12
	call colocarCursor
	print mesajeError1
   	delay 100

	jmp RepeirIntento
error2:
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
	print mesajeError2
   	delay 100
	jmp MenuInicial
error3:
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
	print mesajeError3
   	delay 100
	jmp MenuInicial
error4:
	call limpiarEnColorNegro
	mov columna, 3
	mov fila, 12
	call colocarCursor
	print mesajeError4
   	delay 100
	jmp MenuInicial
error5:
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
	print mesajeError5
   	delay 100
	jmp MenuInicial
error7:
   call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
    print mesajeError7
   	delay 50
	jmp MenuInicial
error8:
   call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
    print mesajeError8
   	delay 50
	jmp MenuInicial
error9:
    call limpiarEnColorNegro
	mov columna, 5
	mov fila, 12
	call colocarCursor
    print mesajeError9
   	delay 50
	jmp MenuInicial
error10:
   call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
    print mesajeError10
   	delay 50
	jmp MenuInicial
error11:
    call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
    print mesajeError11
   	delay 50
	jmp MenuInicial
; ================================ procedimientos ===============================

graficarPixel proc


graficarPixel endp

modoVideoIniciar proc
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx

	iniciar:
		mov ah, 0
		mov al, 0Dh
		int 10h
		jmp fin

	fin: 
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx
		ret
modoVideoIniciar endp

limpiarPantalla proc
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx

	iniciar:
		mov ah, 06
		mov al, 00
		mov bh, 07
		mov ch, 00
		mov cl, 00
		mov dh, 24
		mov dl, 79
		int 10h
		jmp fin

	fin:
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx
		ret
limpiarPantalla endp

limpiarEnColorNegro proc
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx

		mov ah,06h
		mov al,0
		xor cx,cx
		mov dx,184FH
		mov bh,pagina
		int 10h 
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx
		ret 

limpiarEnColorNegro endp

modoVideoFinalizar proc
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx

	iniciar:
		mov al, 0003h
		int 10h
		jmp fin

	fin:
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx
		ret 
modoVideoFinalizar endp

colocarCursor proc
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx

	iniciar:
		mov bh, pagina
		mov dl, columna
		mov dh, fila
		mov ah, 2 
		int 10h
		jmp fin

	fin:
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx
		ret 

colocarCursor endp 

cambiarPagina proc
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx

	iniciar:
		mov ah, 05h
		mov al, pagina
		int 10h
		jmp fin

	fin:
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx
		ret 

cambiarPagina endp 




main endp
end main

