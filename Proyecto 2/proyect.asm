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

infoinicial2 db 0ah,0dh, 'UNIVERSIDAD SAN CARLOS DE GUATEMALA', '$'
infoinicial3 db 0ah,0dh, 'FACULTAD DE INGENIERIA', '$'
infoinicial4 db 0ah,0dh, 'ESCUELA DE CIENCIAS Y SISTEMAS', '$'
infoinicial5 db 0ah,0dh, 'ARQUITECTURA COMPUTADORAS Y ENSAMBLADORES 1', '$'   
infoinicial6 db 0ah,0dh, 'SECCION B', '$'    
infoinicial7 db 0ah,0dh, 'SEGUNDO SEMESTRE 2023', '$'  
infoinicial8 db 0ah,0dh, 'NOMBRE: DAMARIS JULIZZA MURALLES VELIZ', '$'   
infoinicial9 db 0ah,0dh, 'CARNE: 202100953', '$'
infoinicial10 db 0ah,0dh, 'PROYECTO 2', '$'

;MENU INICIAL  
menuVideo1 db 'F1 - Iniciar sesion' , '$'
menuVideo2 db 'F2 - Registrar nuevo usuario' , '$'
menuVideo3 db 'F3 - Salir ' , '$'
;MENU USUARIOS
menuUser1 db 'F1 - Nueva partida' , '$'
menuUser2 db 'F2 - Resumen de partidas' , '$'
menuUser3 db 'F3 - Cerrar sesion ' , '$'
;MENU ADMINISTRADOR
menuAdmin1 db 'F1 - Datos y estadisticas' , '$'
menuAdmin2 db 'F2 - Ordenamientos' , '$'
menuAdmin3 db 'F3 - Bloquear usuario ' , '$'
menuAdmin4 db 'F4 - Desbloquear usuario ' , '$'
menuAdmin5 db 'F5 - Reporte del sistema ' , '$'
menuAdmin6 db 'F6 - Nueva partida ' , '$'
menuAdmin7 db 'F7 - Ultimas partidas ' , '$'
menuAdmin8 db 'F8 - Cerrar sesion ' , '$'
;MENU ADMINISTRADOR ORIGINAL
menuAdmino1 db 'F1 - Datos y estadisticas' , '$'
menuAdmino2 db 'F2 - Ordenamiento de puntajes' , '$'
menuAdmino3 db 'F3 - Bloquear usuario ' , '$'
menuAdmino4 db 'F4 - Desbloquear usuario ' , '$'
menuAdmino5 db 'F5 - Promover usuario ' , '$'
menuAdmino6 db 'F6 - Degradar usuario ' , '$'
menuAdmino7 db 'F7 - Reporte del sistema ' , '$'
menuAdmion8 db 'F8 - Nueva partida' , '$'
menuAdmino9 db 'F9 - Ultimas partidas' , '$'
menuAdmino10 db 'F10 - Cerrar sesion' , '$'
;pausa
menuPausa1 db 'F1 - Salir' , '$'
menuPausa2 db 'F2 - Continuar' , '$'

; ======================================== MENSAJES DE ERROR ========================================
mesajeError0 db 'ERROR: Opcion invalida','$'
mesajeError1 db 'ERROR: Contrasena incorrecta' , '$'
mesajeError2 db 'ERROR: Usuario bloqueado' , '$'
mesaje21 db 'ERROR: Su usuario fue bloqueado' , '$'
mesaje22 db 'Espero 10s para volver al menu' , '$'
mesajeError3 db 'ERROR: Usuario no existe' , '$'
mesajeError4 db 'ERROR: Problema al buscar datos' , '$'
mesajeError5 db 'ERROR: Usuario ya existe' , '$'
mesajeError6 db  'ERROR: Rol de usuario no valido' , '$'
mesajeError7 db  'ERROR: al abrir el archivo ' , '$'
mesajeError8 db  'ERROR: al cerrar el archivo' , '$'
mesajeError9 db  'ERROR: al escribir en el archivo' , '$'
mesajeError10 db 'ERROR: al crear en el archivo' , '$'
mesajeError11 db 'ERROR: al leer en el archivo' , '$'
mesajeError12 db 'ERROR: Nombre de usuario muy corto' , '$'
mesajeError13 db 'ERROR: Nombre de usuario muy largo' , '$'
mesajeError14 db 'ERROR: Contrasena muy corta' , '$'
mesajeError15 db 'ERROR: Contrasena muy larga' , '$'
mesajeError16 db 'ERROR: Caracter invalido ingresado' , '$'
mesajeError17 db 'ERROR:Contrasena no cumple requisitos' , '$'
mesajeError18 db 'ERROR: No se pudo registrar' , '$'

; ======================================== MENSAJES DE EXITO ========================================
mesajeExito1 db 'EXITO: Usuario registrado' , '$'
mesajeExito2 db 'EXITO: Usuario desbloqueado' , '$'
mesajeExito3 db 'EXITO: Usuario bloqueado' , '$'
mesajeExito4 db 'EXITO: Reporte Generado' , '$'
mesajeExito5 db 'EXITO: Usuario promovido' , '$'
mesajeExito6 db 'EXITO: Usuario degradado' , '$'
prestecla db 'Presione una tecla para continuar' , '$'

; ================================ VARIABLES PARA FECHA Y HORA ================================
fechaCreacion db 50 dup('$'), '$'
horaCreacion db 50 dup('$'), '$'
fecha1 db 50 dup('$'), '$'
hora1 db 50 dup('$'), '$'
temp16 db '2023', '$'
temp1 db 50 dup('$'), '$'
temp2 db 50 dup('$'), '$'
temp3 db 50 dup('$'), '$'
simbolose db '/', '$'
simbolopp db ':', '$'


; ========================= VARIABLES PARA REGISTRO E INICIO SESION=========================
mensajeintento db 'Intentos restantes: ' , '$'
menuIngresoDato1 db 'Ingrese Nombre: ' , '$'
menuIngresoDato2 db 'Ingrese password: ' , '$'

nombreuser db 20 dup ('$'), '$'
contraseniauser db 25 dup ('$'), '$'
ensesion db 20 dup ('$'), '$'
rolensesion db '$' , '$'
opcion db 0
sdospuntos db ':', '$'
scoma db ',', '$'
scero db '0', '$'
sdos db '2', '$'

; =============================== VARIABLES PARA EL ARCHIVO =============================== 
; PARA REPORTE
nombreArchivo db 'SYS.HTM',0
reporte db 30000 dup(' '), '$'
ruta db 'c:/masm611/bin/SYS.HTM' ,0
handler0 dw  0001h

usuariosactivos db 2000 dup('$'), '$'
usuariosinactivos db 2000 dup('$'), '$'
mejorespuntajes db 2000 dup('$'), '$'
puntajesfinaless db 2000 dup('$'), '$'

rep1  db 0ah,0dh, '<html>', '$'
rep2  db 0ah,0dh, '<head>', '$'
rep3  db 0ah,0dh, '<title>REPORTE</title>', '$'
rep4  db 0ah,0dh, '</head>', '$'
rep5  db 0ah,0dh, '<body>', '$'
rep6  db 0ah,0dh, '<h1>Reporte de sistema</h1>', '$'
rep7  db 0ah,0dh, '<h3>Fecha de creacion: ', '$'
rep8  db 0ah,0dh, '<h3>Hora de creacion: ', '$'
rep9  db 0ah,0dh, '<h3>Usuario: ', '$'
rep10 db 0ah,0dh, '<h3>Fecha de acceso: ', '$'
rep11 db 0ah,0dh, '<h3>Hora de acceso: ', '$'
rep12 db 0ah,0dh, '<br>', '$'
rep13 db 0ah,0dh, '<h2>Usuarios registrados activos</h2>', '$'
rep14 db 0ah,0dh, '<br>', '$'
rep15 db 0ah,0dh, '<table border="1">', '$'
rep16 db 0ah,0dh, '<tr>', '$'
rep17 db 0ah,0dh, '<td>Usuario</td>', '$'
rep18 db 0ah,0dh, '<td>Contraseña</td>', '$'
rep19 db 0ah,0dh, '</tr>', '$'
rep20 db 0ah,0dh, '<td>', '$'
rep21 db 0ah,0dh, '</td>', '$'
rep22 db 0ah,0dh, '</table>', '$'
rep23 db 0ah,0dh, '<h2>Usuarios registrados inactivos</h2>', '$'
rep24 db 0ah,0dh, '<h2>Ultimas partidas iniciadas</h2>', '$'
rep25 db 0ah,0dh, '<td>Duracion</td>', '$'
rep26 db 0ah,0dh, '<td>Puntaje</td>', '$'
rep27 db 0ah,0dh, '<h2>Mejores puntajes</h2>', '$'
rep28 db 0ah,0dh, '</h3>', '$'
rep29 db 0ah,0dh, '</body>', '$'
rep30 db 0ah,0dh, '</html>', '$'









; PARA LEER ARCHIVO DE USUARIO Y PUNTOS
rute db 'c:/masm611/bin/USRS.ACE' ,0
handler1 dw 0002h
rpunto db 'c:/masm611/bin/PUNTOS.ACE' ,0
handler2 dw  0003h

buffer db 2000 dup('$'), '$'
registropuntaje db 2000 dup('$'), '$'
contadorlect dw 0

aux db 0
datoUser db 30 dup('$') , '$'
datoPass db 30 dup('$') , '$'
RolAr db '$' , '$'
datoAr db 10 dup('$') , '$'
intentos db 3
caracteres db 2 dup('$') , '$'


contadorlpuntos dw 0
punteouser db '0000000' , '$'
linea db 100 dup('$') , '$'
puntajejuego db 0
filapuntaje db 2
sresta db '-', '$'

; =============================== VARIABLES PARA EL JUEGO ===============================
conver db 100 dup('$') , '$'
puntuacionVideo db '038457' , '$'
vidasVideo db 'X X X' , '$'
;---------------------------------VARIABLES PARA MODO VIDEO---------------------------------

;--------------Variables para utiliza en modo video-----------------
columna db 0
fila db 0
contador db 0
posicionX dw 0
posicionY dw 0
;Seleccionar pagina 
pagina db 0
;Para dibujar el tablero
posicionTableroX dw 0
posicionTableroY dw 0

;Para dibujar los carriles
posicionCarrilesX dw 0
posicionCarrilesY dw 0
;Para dibujar la division de los carriles
posicionDivisionCarrilesX dw 0
posicionDivisionCarrilesY dw 0
contadorPixelesSeparacion dw 0



;Manejar la posicion del personaje
posicionPersonajeX dw 0
posicionPersonajeY dw 0

;Manejar la posicion del carro
posicionCarroX dw 0
posicionCarroY dw 0
cicloDuracion dw 0
colorpixel db 0

;Diseño carro #1
disenoCarro1 dw 0
posicionCarro1X dw 0
posicionCarro1Y dw 0
PosicionI1 dw 0
posicionCarro1X_Temp dw 0
posicionCarro1Y_Temp dw 0
velocidadCarro1 dw 0
OrientacionCarro1 dw 1



;Diseño carro #2
disenoCarro2 dw 0
posicionCarro2X dw 0
posicionCarro2Y dw 0
PosicionI2 dw 0
posicionCarro2X_Temp dw 0
posicionCarro2Y_Temp dw 0
velocidadCarro2 dw 0
OrientacionCarro2 dw 1

;Diseño carro #3
disenoCarro3 dw 0
posicionCarro3X dw 0
posicionCarro3Y dw 0
PosicionI3 dw 0
posicionCarro3X_Temp dw 0
posicionCarro3Y_Temp dw 0
velocidadCarro3 dw 0
OrientacionCarro3 dw 1

;Diseño carro #4
disenoCarro4 dw 0
posicionCarro4X dw 0
posicionCarro4Y dw 0
PosicionI4 dw 0
posicionCarro4X_Temp dw 0
posicionCarro4Y_Temp dw 0
velocidadCarro4 dw 0
OrientacionCarro4 dw 1

;Diseño carro #5
disenoCarro5 dw 0
posicionCarro5X dw 0
posicionCarro5Y dw 0
PosicionI5 dw 0
posicionCarro5X_Temp dw 0
posicionCarro5Y_Temp dw 0
velocidadCarro5 dw 0
OrientacionCarro5 dw 1
;Diseño carro #6
disenoCarro6 dw 0
posicionCarro6X dw 0
posicionCarro6Y dw 0
PosicionI6 dw 0
posicionCarro6X_Temp dw 0
posicionCarro6Y_Temp dw 0
velocidadCarro6 dw 0
OrientacionCarro6 dw 1

;Diseño carro #7
disenoCarro7 dw 0
posicionCarro7X dw 0
posicionCarro7Y dw 0
PosicionI7 dw 0
posicionCarro7X_Temp dw 0
posicionCarro7Y_Temp dw 0
velocidadCarro7 dw 0
OrientacionCarro7 dw 1

;Diseño carro #8
disenoCarro8 dw 0
posicionCarro8X dw 0
posicionCarro8Y dw 0
PosicionI8 dw 0
posicionCarro8X_Temp dw 0
posicionCarro8Y_Temp dw 0
velocidadCarro8 dw 0
OrientacionCarro8 dw 1

;Diseño carro #9
disenoCarro9 dw 0
posicionCarro9X dw 0
posicionCarro9Y dw 0
PosicionI9 dw 0
posicionCarro9X_Temp dw 0
posicionCarro9Y_Temp dw 0
velocidadCarro9 dw 0
OrientacionCarro9 dw 1

;Diseño carro #10
disenoCarro10 dw 0
posicionCarro10X dw 0
posicionCarro10Y dw 0
PosicionI10 dw 0
posicionCarro10X_Temp dw 0
posicionCarro10Y_Temp dw 0
velocidadCarro10 dw 0
OrientacionCarro10 dw 1

;Diseño carro #11
disenoCarro11 dw 0
posicionCarro11X dw 0
posicionCarro11Y dw 0
PosicionI11 dw 0
posicionCarro11X_Temp dw 0
posicionCarro11Y_Temp dw 0
velocidadCarro11 dw 0
OrientacionCarro11 dw 1

;Diseño carro #12
disenoCarro12 dw 0
posicionCarro12X dw 0
posicionCarro12Y dw 0
PosicionI12 dw 0
posicionCarro12X_Temp dw 0
posicionCarro12Y_Temp dw 0
velocidadCarro12 dw 0
OrientacionCarro12 dw 1


; ============================================== segmento de codigo ===================================

.code
main proc far	
mov ax,@data
mov ds,ax
mov es,ax

inicializar:
	mov contadorlect,0
	abrir rute,handler1  ;le mandamos la ruta y el handler,que será la referencia al fichero 
	limpiar buffer, SIZEOF buffer,24h  ;limpiamos la variable donde guardaremos los datos del archivo 
	leer handler1, buffer, SIZEOF buffer ;leemos el archivo
	cerrar handler1 
	mov si,0
	;Limpieza de los registros
	xor bx,bx
	xor cx,cx
	mov contadorlpuntos,0
	abrir rpunto,handler2  ;le mandamos la ruta y el handler,que será la referencia al fichero 
	limpiar registropuntaje, SIZEOF registropuntaje,24h  ;limpiamos la variable donde guardaremos los datos del archivo 
	leer handler2, registropuntaje, SIZEOF registropuntaje ;leemos el archivo
	cerrar handler2
	

Video:
	;Iniciamos el modo video
	CALL modoVideoIniciar

	;Iniciamos la pagina a escribir
	mov pagina, 0

	jmp MenuInfo
MenuInfo:
		mov ax,@data
		mov ds,ax
		mov es,ax
		call limpiarEnColorNegro
		mov columna, 2
		mov fila, 8
		call colocarCursor
		print infoinicial2

		mov columna, 2
		mov fila, 9
		call colocarCursor
		print infoinicial3

		mov columna, 2
		mov fila, 10
		call colocarCursor
		print infoinicial4

		mov columna, 2
		mov fila, 11
		call colocarCursor
		print infoinicial5

		mov columna, 2
		mov fila, 12
		call colocarCursor
		print infoinicial6

		mov columna, 2
		mov fila, 13
		call colocarCursor
		print infoinicial7

		mov columna, 2
		mov fila, 14
		call colocarCursor
		print infoinicial8

		mov columna, 2
		mov fila, 15
		call colocarCursor
		print infoinicial9

		mov columna, 2
		mov fila, 16
		call colocarCursor
		print infoinicial10
		delay 90 
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
	limpiar reporte, SIZEOF reporte,'$'
	limpiar conver, SIZEOF conver,'$'
	limpiar linea , SIZEOF linea,'$'
	limpiar ensesion, SIZEOF ensesion,'$'
	limpiar rolensesion, SIZEOF rolensesion,'$'

	mov opcion,0
	mov intentos,3
	mov aux,0
	mov contadorlect,0
	mov contadorlpuntos,0
	mov puntajejuego,0

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
	limpiar nombreuser, SIZEOF nombreuser,'$'
	limpiar contraseniauser, SIZEOF contraseniauser,'$'
	mov aux,0
	call limpiarEnColorNegro
	
	mov columna, 3
	mov fila, 11
	call colocarCursor
	print menuIngresoDato1
	ObtenerUser nombreuser,aux,caracteres
	contarLongitud nombreuser
	cmp al,8
	; Si es menor
	jl error12
	cmp al,20
	; Si es mayor
	jg error13

	
	mov aux,0
	mov columna, 3
	mov fila, 13
	call colocarCursor
	print menuIngresoDato2
	ObtenerContra contraseniauser,aux,caracteres
	contarLongitud contraseniauser
	cmp al,15
	; Si es menor
	jl error14
	cmp al,25
	; Si es mayor
	jg error15
	mov aux,0
	ContadorMayus contraseniauser,aux
	cmp aux,3
	;menor que 3
	jl error17
	mov aux,0
	ContadorMinus contraseniauser,aux
	cmp aux,4
	jl error17
	mov aux,0
	ContadorEspecial contraseniauser,aux
	cmp aux,1
	jl error17
	mov aux,0
	limpiar conver, SIZEOF conver,'$' 
	mov opcion,1

	jmp userArchivo

salirPrograma:
	CALL modoVideoFinalizar
	delay 400
	jmp salir

salir:
    close
; ---------- lectura de archivo de usuario buscando datos  ----------
userArchivo:
	mov contadorlect,0
	limpiar datoUser, SIZEOF datoUser,'$' 
	limpiar datoAr, SIZEOF datoAr,'$' 
	limpiar RolAr, SIZEOF RolAr,'$' 
	limpiar datoPass, SIZEOF datoPass,'$' 
	limpiar temp1, SIZEOF temp1,'$'
	limpiar temp2, SIZEOF temp2,'$'
	limpiar temp3, SIZEOF temp3,'$'
	limpiar conver, SIZEOF conver,'$'
	limpiar usuariosactivos, SIZEOF usuariosactivos,'$'
	limpiar usuariosinactivos, SIZEOF usuariosinactivos,'$'
	limpiar mejorespuntajes, SIZEOF mejorespuntajes,'$'
	limpiar puntajesfinaless, SIZEOF puntajesfinaless,'$'
	mov si,0
	;Limpieza de los registros
	xor bx,bx
	xor cx,cx
	jmp encontraruser


encontraruser:
	mov bx,contadorlect
	mov al,buffer[bx]
	cmp al,58 ;simbolo comillas ASCII
	je encontrado
	mov datoUser[si],al
	
	cmp al,36
	je emergencia1
	cmp contadorlect,1000
	je emergencia

	;Incrementamos el indice
	inc contadorlect 
	inc si
	;Si no es el que buscamos volvemos a buscar 
	jmp encontraruser
encontrado:
	mov si,0
	push si
	mov si,0
	inc contadorlect
	jmp encontrarpass
	

encontrarpass:
	mov bx,contadorlect
	mov al,buffer[bx]
	cmp al,58 ;simbolo comillas ASCII
	je encontrado1
	mov datoPass[si],al
	
	
	cmp contadorlect,1000
	je emergencia


	;Incrementamos el indice
	inc contadorlect
	inc si
	;Si no es el que buscamos volvemos a buscar 
	jmp encontrarpass

encontrado1:
	mov si,0
	push si
	mov si,0
	inc contadorlect
	jmp encontrarrol



encontrarrol:
	mov bx,contadorlect
	mov al,buffer[bx]
	cmp al,58 ;simbolo comillas ASCII
	je encontrado2
	mov RolAr[si],al
	
	;(Tener cuidado ya que si no hay condicion de salida se encicla)
	;Salida de emergencia mas de 200 de llegada del indice, pueden poner un mayor
	cmp contadorlect,1000
	je emergencia


	;Incrementamos el indice
	inc contadorlect
	inc si
	;Si no es el que buscamos volvemos a buscar 
	jmp encontrarrol
encontrado2:
	mov si,0
	push si
	mov si,0
	inc contadorlect
	jmp encontrarbloqueo

encontrarbloqueo:
	mov bx,contadorlect
	mov al,buffer[bx]
	cmp al,44 ;simbolo comillas ASCII
	je encontrado3
	mov datoAr[si],al
	
	;(Tener cuidado ya que si no hay condicion de salida se encicla)
	;Salida de emergencia mas de 200 de llegada del indice, pueden poner un mayor
	cmp contadorlect,1000
	je emergencia


	;Incrementamos el indice
	inc contadorlect
	inc si
	;Si no es el que buscamos volvemos a buscar 
	jmp encontrarbloqueo
encontrado3:
	
	mov al,opcion
	cmp al,6
	je UsuariosRep
	cmp al,1
	je buscarNoCoincidencia
	jmp buscarCoincidencia
UsuariosRep:
	mov al,datoAr[0]
	cmp al,49
	je Noactivo
	mov si,0
	concatenarCadena1 rep16,usuariosactivos
	concatenarCadena1 rep20,usuariosactivos
	concatenarCadena1 datoUser,usuariosactivos
	concatenarCadena1 rep21,usuariosactivos
	mov si,0
	encriptarPass datoPass
	concatenarCadena1 rep20,usuariosactivos
	concatenarCadena1 datoPass,usuariosactivos
	concatenarCadena1 rep21,usuariosactivos
	concatenarCadena1 rep19,usuariosactivos
	mov si,0
	limpiar datoUser, SIZEOF datoUser,'$' 
	limpiar datoAr, SIZEOF datoAr,'$' 
	limpiar RolAr, SIZEOF RolAr,'$' 
	limpiar datoPass, SIZEOF datoPass,'$' 
	mov si,0
	inc contadorlect
	jmp encontraruser
Noactivo:
	mov si,0
	concatenarCadena1 rep16,usuariosinactivos
	concatenarCadena1 rep20,usuariosinactivos
	concatenarCadena1 datoUser,usuariosinactivos
	concatenarCadena1 rep21,usuariosinactivos
	mov si,0
	encriptarPass datoPass
	concatenarCadena1 rep20,usuariosinactivos
	concatenarCadena1 datoPass,usuariosinactivos
	concatenarCadena1 rep21,usuariosinactivos
	concatenarCadena1 rep19,usuariosinactivos
	mov si,0
	limpiar datoUser, SIZEOF datoUser,'$' 
	limpiar datoAr, SIZEOF datoAr,'$' 
	limpiar RolAr, SIZEOF RolAr,'$' 
	limpiar datoPass, SIZEOF datoPass,'$' 
	mov si,0
	inc contadorlect
	jmp encontraruser
buscarCoincidencia:
	
	mov si,0
	push si
	compararcadena nombreuser,datoUser,aux
	mov si,0
	dec contadorlect

	mov al,aux
	cmp al,1
	je comprobandocredencial
	mov si,0
	
	limpiar datoUser, SIZEOF datoUser,'$' 
	limpiar datoAr, SIZEOF datoAr,'$' 
	limpiar RolAr, SIZEOF RolAr,'$' 
	limpiar datoPass, SIZEOF datoPass,'$' 
	limpiar fecha1, SIZEOF fecha1,'$'
	limpiar hora1, SIZEOF hora1,'$'
	limpiar temp1, SIZEOF temp1,'$'
	limpiar temp2, SIZEOF temp2,'$'
	limpiar temp3, SIZEOF temp3,'$'
	limpiar conver, SIZEOF conver,'$'
	mov si,0
	inc contadorlect
	inc contadorlect
	jmp encontraruser
buscarNoCoincidencia:
	mov si,0
	push si
	compararcadena nombreuser,datoUser,aux
	mov si,0
	inc contadorlect
	limpiar datoUser, SIZEOF datoUser,'$' 
	limpiar datoAr, SIZEOF datoAr,'$' 
	limpiar RolAr, SIZEOF RolAr,'$' 
	limpiar datoPass, SIZEOF datoPass,'$' 
	limpiar fecha1, SIZEOF fecha1,'$'
	limpiar hora1, SIZEOF hora1,'$'
	limpiar temp1, SIZEOF temp1,'$'
	limpiar temp2, SIZEOF temp2,'$'
	limpiar temp3, SIZEOF temp3,'$'
	limpiar conver, SIZEOF conver,'$'
	mov si,0
	mov al,aux
	cmp al,0
	je encontraruser
	jmp error5
emergencia:
	jmp error4
emergencia1:
	mov al,opcion
	cmp al,1
	je registrarusuario
	cmp al,6
	je puntajeArchivo1
	jmp error3

comprobandocredencial:
	
	mov si,0
	push si
	mov al,opcion
	cmp al,2
	je bloquearusuario
	cmp al,3
	je desbloquearusuario
	cmp al,4
	je promoverusuario
	cmp al,5
	je degradarusuario

	mov al,datoAr[0]
	cmp al,49
	je error2i
	compararcadena contraseniauser,datoPass,aux
	mov si,0
	mov al,aux
	cmp al,0
	je error1
	mov si,0
	push si
	concatenarCadena nombreuser,ensesion
	mov si,0
	mov al,RolAr[0]
	mov rolensesion,al
	limpiar fecha1, SIZEOF fecha1,'$'
	limpiar hora1, SIZEOF hora1,'$'
	ObtenerFecha fecha1,conver,temp16,temp2,temp3,simbolose
    ObtenerHora hora1,conver,temp1,temp2,temp3,simbolopp
	jmp puntajeArchivo

RepeirIntento:
	limpiar contraseniauser, SIZEOF contraseniauser,'$'
	dec intentos
	mov al,intentos
	cmp al,0
	je bloquearusuario
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
	mov si,0
	limpiar fecha1, SIZEOF fecha1,'$'
	limpiar hora1, SIZEOF hora1,'$'
	ObtenerFecha fecha1,conver,temp16,temp2,temp3,simbolose
    ObtenerHora hora1,conver,temp1,temp2,temp3,simbolopp
	mov si,0
	mov al,RolAr[0]
	mov rolensesion,al
	concatenarCadena nombreuser,ensesion
	mov si,0
	jmp puntajeArchivo
bloquearusuario:
    mov bx,contadorlect
	mov buffer[bx],49
	abrir rute,handler1  ;le mandamos la ruta y el handler,que será la referencia al fichero 
	;Interrupcion para escribir el archivo
    escribir handler1, buffer, SIZEOF buffer
	cerrar handler1 
	mov al,opcion
	cmp al,2
	jne error2
	call limpiarEnColorNegro
	mov columna, 4
	mov fila, 11
	call colocarCursor
	print mesajeExito3
	mov opcion,0
	mov al,rolensesion
	mov RolAr[0],al
	delay 30
	jmp menus


desbloquearusuario:
    mov bx,contadorlect
	mov buffer[bx],48
	abrir rute,handler1  ;le mandamos la ruta y el handler,que será la referencia al fichero 
	;Interrupcion para escribir el archivo
    escribir handler1, buffer, SIZEOF buffer
	cerrar handler1 
	call limpiarEnColorNegro
	mov columna, 4
	mov fila, 11
	call colocarCursor
	print mesajeExito2
	mov opcion,0
	mov al,rolensesion
	mov RolAr[0],al
	delay 30
	jmp menus
promoverusuario:
	dec contadorlect
	dec contadorlect
	mov bx,contadorlect
	mov buffer[bx], 49
	abrir rute,handler1  ;le mandamos la ruta y el handler,que será la referencia al fichero 
	;Interrupcion para escribir el archivo
    escribir handler1, buffer, SIZEOF buffer
	cerrar handler1 
	call limpiarEnColorNegro
	mov columna, 4
	mov fila, 11
	call colocarCursor
	print mesajeExito5
	mov opcion,0
	mov al,rolensesion
	mov RolAr[0],al
	delay 30
	jmp menus
degradarusuario:
	dec contadorlect
	dec contadorlect
	mov bx,contadorlect
	mov buffer[bx], 50
	abrir rute,handler1  ;le mandamos la ruta y el handler,que será la referencia al fichero 
	;Interrupcion para escribir el archivo
    escribir handler1, buffer, SIZEOF buffer
	cerrar handler1 
	call limpiarEnColorNegro
	mov columna, 4
	mov fila, 11
	call colocarCursor
	print mesajeExito6
	mov opcion,0
	mov al,rolensesion
	mov RolAr[0],al
	delay 30
	jmp menus
registrarusuario:
	
	concatenarCadena1 nombreuser,buffer
	concatenarCadena1 sdospuntos,buffer
	concatenarCadena1 contraseniauser,buffer
	concatenarCadena1 sdospuntos,buffer
	concatenarCadena1 sdos,buffer
	concatenarCadena1 sdospuntos,buffer
	concatenarCadena1 scero,buffer
	concatenarCadena1 scoma,buffer
	abrir rute,handler1  ;le mandamos la ruta y el handler,que será la referencia al fichero 
	;Interrupcion para escribir el archivo
    escribir handler1, buffer, SIZEOF buffer
	cerrar handler1 
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
    print mesajeExito1

   	delay 30
	jmp MenuInicial

; ================================ manejo de archivo de puntaje      ==============================
puntajeArchivo1:
	iralfinal registropuntaje,contadorlpuntos
	buscarlimite registropuntaje,contadorlpuntos
	limpiar linea, SIZEOF linea,'$'
	limpiar conver, SIZEOF conver,'$'

	mov si,0
	;Limpieza de los registros
	xor bx,bx
	xor cx,cx
	
	jmp encontraruserp

puntajeArchivo:
	mov contadorlpuntos,0
	limpiar linea, SIZEOF linea,'$'
	limpiar conver, SIZEOF conver,'$'
	mov si,0
	;Limpieza de los registros
	xor bx,bx
	xor cx,cx
	mov al,opcion
	cmp al,0
	je encontraruserp


	call limpiarEnColorNegro

	mov si,0
	;Limpieza de los registros
	xor bx,bx
	xor cx,cx
	jmp encontraruserp

encontraruserp:
	mov bx,contadorlpuntos
	mov al,registropuntaje[bx]
	mov linea[si],al
	cmp al,45 ;simbolo comillas ASCII
	je encontradouser
	mov conver[si],al
	
	cmp al,36
	je findoc
	cmp contadorlpuntos,1000
	je emergencia

	;Incrementamos el indice
	inc contadorlpuntos 
	inc si
	;Si no es el que buscamos volvemos a buscar 
	jmp encontraruserp
encontradouser:
	mov si,0
	push si
	inc contadorlpuntos 
	mov al,opcion
	cmp al,6
	je reporteS1
	mov aux,0
	compararcadena conver,ensesion,aux
	mov si,0
	limpiar conver, SIZEOF conver,'$'
	mov si,0
	mov al,aux
	cmp al,1
	je encontrartime
	limpiar linea, SIZEOF linea,'$'
	mov si,0

	jmp encontraruserp
reporteS1:
	mov si,0
	concatenarCadena1 rep16,puntajesfinaless
	concatenarCadena1 rep20,puntajesfinaless
	concatenarCadena1 conver,puntajesfinaless
	concatenarCadena1 rep21,puntajesfinaless
	
	mov si,0
	limpiar linea, SIZEOF linea,'$'
	limpiar conver , SIZEOF conver,'$'
	mov si,0
	jmp encontrartime

encontrartime:
	mov bx,contadorlpuntos
	mov al,registropuntaje[bx]
	cmp al,45 ;simbolo comillas ASCII
	je encontradotime
	mov conver[si],al
	
	
	cmp contadorlpuntos,1000
	je emergencia


	;Incrementamos el indice
	inc contadorlpuntos
	inc si
	;Si no es el que buscamos volvemos a buscar 
	jmp encontrartime

encontradotime:
	mov si,0
	push si
	inc contadorlpuntos 
	mov al,opcion
	cmp al,6
	je reporteS2
	concatenarCadena1 conver,linea
	concatenarCadena1 sresta,linea
	limpiar conver , SIZEOF conver,'$'
	mov si,0
	
	jmp encontrarpunto
reporteS2:
	mov si,0
	concatenarCadena1 rep20,puntajesfinaless
	concatenarCadena1 conver,puntajesfinaless
	concatenarCadena1 rep21,puntajesfinaless
	mov si,0
	limpiar linea, SIZEOF linea,'$'
	limpiar conver , SIZEOF conver,'$'
	mov si,0
	jmp encontrarpunto
encontrarpunto:
	mov bx,contadorlpuntos 
	mov al,registropuntaje[bx]
	cmp al,44 ;simbolo comillas ASCII
	je encontradop
	mov conver[si],al
	mov punteouser[si],al
	
	;(Tener cuidado ya que si no hay condicion de salida se encicla)
	;Salida de emergencia mas de 200 de llegada del indice, pueden poner un mayor
	cmp contadorlpuntos ,1000
	je emergencia


	;Incrementamos el indice
	inc contadorlpuntos 
	inc si
	;Si no es el que buscamos volvemos a buscar 
	jmp encontrarpunto
encontradop:
	mov si,0
	push si
	concatenarCadena1 conver,linea
	inc contadorlpuntos
	mov si,0
	mov al,opcion
	cmp al,0
	je opcionprimera
	cmp al,6
	je reporteS3
	mov columna, 6
	mov al, filapuntaje
	mov fila, al
	call colocarCursor
	print linea
	inc filapuntaje
	limpiar linea, SIZEOF linea,'$'
	limpiar conver , SIZEOF conver,'$'
	mov si,0
	jmp encontraruserp
reporteS3:
	mov si,0
	concatenarCadena1 rep20,puntajesfinaless
	concatenarCadena1 conver,puntajesfinaless
	concatenarCadena1 rep21,puntajesfinaless
	concatenarCadena1 rep19,puntajesfinaless
	mov si,0
	limpiar linea, SIZEOF linea,'$'
	limpiar conver , SIZEOF conver,'$'
	mov si,0
	mov al,6
	mov opcion,al
	jmp encontraruserp
	
opcionprimera:
	limpiar linea, SIZEOF linea,'$'
	limpiar conver, SIZEOF conver,'$'
	mov si,0
	jmp encontraruserp
findoc:
	mov si,0
	mov al,opcion
	cmp al,0
	je menus

	cmp al,6
	je creandoReporte
	
	mov columna, 3
	mov fila, 20
	call colocarCursor
	print prestecla 

	getChar
	mov al,0
	jmp menus






menus:
	mov si,0
	push si
	mov al,RolAr
	cmp al,48
	je menuAdminOriginal
	cmp al,49
	je menuAdministrador
	cmp al,50
	je 	MenuUsuario
    jmp error6
creandoReporte:
	mov si,0
	limpiar reporte, SIZEOF reporte,'$'
	limpiar conver, SIZEOF conver,'$'
	limpiar linea , SIZEOF linea,'$'
	mov si,0
	ObtenerFecha fechaCreacion,conver,temp16,temp2,temp3,simbolose
    ObtenerHora horaCreacion,conver,temp1,temp2,temp3,simbolopp
	
	mov si,0
	concatenarCadena rep1,reporte
	concatenarCadena rep2,reporte
	concatenarCadena rep3,reporte
	concatenarCadena rep4,reporte
	concatenarCadena rep5,reporte
	concatenarCadena rep6,reporte
	concatenarCadena rep7,reporte
	concatenarCadena fechaCreacion,reporte
	concatenarCadena rep28,reporte
	concatenarCadena rep8,reporte
	concatenarCadena horaCreacion,reporte
	concatenarCadena rep28,reporte
	concatenarCadena rep9,reporte
	concatenarCadena ensesion,reporte
	concatenarCadena rep28,reporte
	concatenarCadena rep10,reporte
	concatenarCadena fecha1,reporte
	concatenarCadena rep28,reporte
	concatenarCadena rep11,reporte
	concatenarCadena hora1,reporte
	concatenarCadena rep28,reporte

	concatenarCadena rep12,reporte
	concatenarCadena rep13,reporte
	concatenarCadena rep14,reporte
	concatenarCadena rep15,reporte
	concatenarCadena rep16,reporte
	concatenarCadena rep17,reporte
	concatenarCadena rep18,reporte
	concatenarCadena rep19,reporte
	concatenarCadena usuariosactivos,reporte
	concatenarCadena rep22,reporte

	concatenarCadena rep12,reporte
	concatenarCadena rep23,reporte
	concatenarCadena rep14,reporte
	concatenarCadena rep15,reporte
	concatenarCadena rep16,reporte
	concatenarCadena rep17,reporte
	concatenarCadena rep18,reporte
	concatenarCadena rep19,reporte
	concatenarCadena usuariosinactivos,reporte
	concatenarCadena rep22,reporte

	concatenarCadena rep12,reporte
	concatenarCadena rep24,reporte
	concatenarCadena rep14,reporte
	concatenarCadena rep15,reporte
	concatenarCadena rep16,reporte
	concatenarCadena rep17,reporte
	concatenarCadena rep25,reporte
	concatenarCadena rep26,reporte
	concatenarCadena rep19,reporte
	concatenarCadena puntajesfinaless,reporte
	concatenarCadena rep22,reporte

	concatenarCadena rep29,reporte
	concatenarCadena rep30,reporte

	abrir ruta,handler0  ;le mandamos la ruta y el handler,que será la referencia al fichero 
	;Interrupcion para escribir el archivo
	escribir handler0, reporte, SIZEOF reporte
	cerrar handler0 
	mov si,0
	call limpiarEnColorNegro
	mov columna, 4
	mov fila, 11
	call colocarCursor
	print mesajeExito4
	delay 30
	mov al,rolensesion
	mov RolAr[0],al
	jmp menus




; PUNTAJES
ModificarPuntaje:
	abrir rpunto,handler2  ;le mandamos la ruta y el handler,que será la referencia al fichero 
	;Interrupcion para escribir el archivo
	escribir handler2, registropuntaje, SIZEOF registropuntaje
	cerrar handler2 
	jmp MenuInicial

; ================================ etiquetas para control de menu administrador original ==============================
menuAdminOriginal:
	limpiar conver, SIZEOF conver,'$'
	limpiar nombreuser, SIZEOF nombreuser,'$'
	call limpiarEnColorNegro
	;Limpiamos los registros
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
	mov columna, 6
	mov fila, 6
	call colocarCursor
	print menuAdmino1

	mov columna, 6
	mov fila, 7
	call colocarCursor
	print menuAdmino2

	mov columna, 6
	mov fila, 8
	call colocarCursor
	print menuAdmino3
	
	mov columna, 6
	mov fila, 9
	call colocarCursor
	print menuAdmino4

	mov columna, 6
	mov fila, 10
	call colocarCursor
	print menuAdmino5

	mov columna, 6
	mov fila, 11
	call colocarCursor
	print menuAdmino6

	mov columna, 6
	mov fila, 12
	call colocarCursor
	print menuAdmino7

	mov columna, 6
	mov fila, 13
	call colocarCursor
	print menuAdmion8

	mov columna, 6
	mov fila, 14
	call colocarCursor
	print menuAdmino9

	mov columna, 6
	mov fila, 15
	call colocarCursor
	print menuAdmino10

	getChar
	;< =   > ?@ A B C D   133 134
	;cmp al,59 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	;je menuAdminOriginal1
	;cmp al,60 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	;je menuAdminOriginal2
	cmp al,61 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je bloquearusuario1
	cmp al,62 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je desbloquearusuario1
	cmp al,63 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je promoverusuario1
	cmp al,64 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je degradarusuario1
	cmp al,65 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je generarReporte
	cmp al,66 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je inicioTablero
	cmp al,67 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je ultimasPartidas
	cmp al,68 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je MenuInicial
	jmp menuAdminOriginal

; ================================ etiquetas para control de menu administrador ==============================
menuAdministrador:
	call limpiarEnColorNegro
	;Limpiamos los registros
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
	mov columna, 6
	mov fila, 6
	call colocarCursor
	print menuAdmin1

	mov columna, 6
	mov fila, 7
	call colocarCursor
	print menuAdmin2

	mov columna, 6
	mov fila, 8
	call colocarCursor
	print menuAdmin3
	mov columna, 6
	mov fila, 9
	call colocarCursor
	print menuAdmin4

	mov columna, 6
	mov fila, 10
	call colocarCursor
	print menuAdmin5

	mov columna, 6
	mov fila, 11
	call colocarCursor
	print menuAdmin6

	mov columna, 6
	mov fila, 12
	call colocarCursor
	print menuAdmin7

	mov columna, 6
	mov fila, 13
	call colocarCursor
	print menuAdmin8

	

	getChar
	;< =   > ?@ A B C D   133 134
	;cmp al,59 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	;je menuAdminOriginal1
	;cmp al,60 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	;je menuAdminOriginal2
	cmp al,61 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je bloquearusuario1
	cmp al,62 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je desbloquearusuario1
	cmp al,63 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je generarReporte
	;cmp al,64 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	;je menuAdminOriginal6
	cmp al,65 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je ultimasPartidas
	cmp al,66 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je MenuInicial
	jmp menuAdministrador


; ================================ etiquetas para control de menu usuario ==============================
MenuUsuario:
	call limpiarEnColorNegro
	;Limpiamos los registros
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
	mov columna, 6
	mov fila, 9
	call colocarCursor
	print menuUser1

	mov columna, 6
	mov fila, 10
	call colocarCursor
	print menuUser2

	mov columna, 6
	mov fila, 11
	call colocarCursor
	print menuUser3
	

	getChar
	;< =   > ?@ A B C D   133 134
	;cmp al,59 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	;je menuAdminOriginal1
	cmp al,60 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je ultimasPartidas
	cmp al,61 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je MenuInicial
	jmp MenuUsuario
; ================================ etiquet control de pausa ===============================
Pausar:
	call limpiarEnColorNegro
	;Limpiamos los registros
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
	mov columna, 6
	mov fila, 10
	call colocarCursor
	print menuPausa1

	mov columna, 6
	mov fila, 11
	call colocarCursor
	print menuPausa2

	

	getChar
	;< =   > ?@ A B C D   133 134
	;cmp al,59 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	;je menuAdminOriginal1
	;cmp al,60 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	;je menuAdminOriginal2
	cmp al,59 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	je menus
	
	jmp Pausar
; ================================= etiquetas de control de opciones de menu ===============================
bloquearusuario1:
	call limpiarEnColorNegro
	mov columna, 4
	mov fila, 11
	call colocarCursor
	print menuIngresoDato1
	ObtenerTexto nombreuser
	mov opcion,2
	jmp userArchivo

desbloquearusuario1:
	call limpiarEnColorNegro
	mov columna, 4
	mov fila, 11
	call colocarCursor
	print menuIngresoDato1
	ObtenerTexto nombreuser
	mov opcion,3
	jmp userArchivo

promoverusuario1:
	call limpiarEnColorNegro
	mov columna, 4
	mov fila, 11
	call colocarCursor
	print menuIngresoDato1
	ObtenerTexto nombreuser
	mov opcion,4
	jmp userArchivo

degradarusuario1:
	call limpiarEnColorNegro
	mov columna, 4
	mov fila, 11
	call colocarCursor
	print menuIngresoDato1
	ObtenerTexto nombreuser
	mov opcion,5
	jmp userArchivo

generarReporte:
	mov al,6
	mov opcion,al
	jmp userArchivo
ultimasPartidas:
	
	mov opcion,7
	jmp puntajeArchivo




;=========================================== JUEGO ===========================================
inicioTablero: 
		;Limpiamos la pagina
		CALL limpiarEnColorNegro

		;Colocamos en la pagina 1 para hacer sincronizacion
		mov pagina, 1

		
		;Limpiamos los registros
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx
		mov posicionTableroX,0
		mov posicionTableroY,8

		;Ahora limpiamos la pantalla
		;CALL limpiarEnColorNegro

		jmp tablero


tablero:
		;Limpiamos los registros
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx

		;Empezamos a graficar pagina 0
		mov ah, 0ch                ;Indicar que se imprimira un pixel
		mov dx, posicionTableroY   ;DX coordenada en Y
		mov cx, posicionTableroX   ;CX coordenada en X
		mov bh, pagina             ;BH la pagina a imprimir
		mov al, 7                  ;Color que queremos colocar
		int 10h

		;Empezamos a graficar pagina 1
		mov ah, 0ch                ;Indicar que se imprimira un pixel
		mov dx, posicionTableroY   ;DX coordenada en Y
		mov cx, posicionTableroX   ;CX coordenada en X
		mov bh, 1                  ;BH la pagina a imprimir
		mov al, 7                  ;Color que queremos colocar
		int 10h

		;Aumentamos la posicionTableroY
		xor ax,ax
		mov ax, posicionTableroY
		add ax, 1
		mov posicionTableroY, ax

		;Mientras estemos dentro de < = a 192 imprimimos la fila
		cmp posicionTableroY, 192
		jbe tablero           ;Si es menor o igual salta

		;Como se sobre paso reiniciamos la posicionTableroY y aumentamos la posicion tablero X
		xor ax,ax 
		mov posicionTableroY, 8
		mov ax, posicionTableroX
		add ax, 1
		mov posicionTableroX, ax

		;Verificamos que hayamos terminado las columnas
		;Mientras estemos dentro de < = a 320 seguimos analizando
		cmp posicionTableroX, 320
		jbe tablero           ;Si es menor o igual salta

		;Esperamos un caracter
		;getChar

		;Ahora limpiamos la pantalla
		;CALL limpiarEnColorNegro

		;jmp logicaVideo ;<---------------------Regresa al inicio de video

		;Regresamos al inicio de video
		jmp inicioCarriles

inicioCarriles:
		;Limpiamos los registros
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx
		mov posicionCarrilesX, 0
		mov posicionCarrilesY, 16
		
		jmp Carriles

Carriles:
		;Limpiamos los registros
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx

		;Empezamos a graficar
		mov ah, 0ch                ;Indicar que se imprimira un pixel
		mov dx, posicionCarrilesY  ;DX coordenada en Y
		mov cx, posicionCarrilesX  ;CX coordenada en X
		mov bh, pagina             ;BH la pagina a imprimir
		mov al, 8                  ;Color que queremos colocar
		int 10h

		;Empezamos a graficar pagina 1
		mov ah, 0ch                ;Indicar que se imprimira un pixel
		mov dx, posicionTableroY   ;DX coordenada en Y
		mov cx, posicionTableroX   ;CX coordenada en X
		mov bh, 1                  ;BH la pagina a imprimir
		mov al, 7                  ;Color que queremos colocar
		int 10h

		;Aumentamos la posicionCarrilesY
		xor ax,ax
		mov ax, posicionCarrilesY
		add ax, 1
		mov posicionCarrilesY, ax

		;Mientras estemos dentro de < = a 184 imprimimos la fila
		cmp posicionCarrilesY, 184
		jbe Carriles           ;Si es menor o igual salta

		;Como se sobre paso reiniciamos la posicionCarrilesY y aumentamos la posicionCarrilesX
		xor ax,ax 
		mov posicionCarrilesY, 16
		mov ax, posicionCarrilesX
		add ax, 1
		mov posicionCarrilesX, ax

		;Verificamos que hayamos terminado las columnas
		;Mientras estemos dentro de < = a 320 seguimos analizando
		cmp posicionCarrilesX, 320
		jbe Carriles           ;Si es menor o igual salta

		;Como termino de hacer el grafico mostramos la pagina hecha
		;CALL cambiarPagina

		;Esperamos un caracter
		;getChar

		;Ahora limpiamos la pantalla
		;CALL limpiarEnColorNegro

		;jmp logicaVideo
		jmp inicioDivisionCarriles

inicioDivisionCarriles:
		;Limpiamos los registros
		xor ax,ax
		xor bx,bx
		xor cx,cx 
		xor dx,dx
		mov posicionDivisionCarrilesX, 0
		mov posicionDivisionCarrilesY, 24
		mov contadorPixelesSeparacion,0

		jmp DivisionCarrilesCarriles

DivisionCarrilesCarriles:
		;Limpiamos los registros
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx

		;Empezamos a graficar
		mov ah, 0ch                			;Indicar que se imprimira un pixel
		mov dx, posicionDivisionCarrilesY   ;DX coordenada en Y
		mov cx, posicionDivisionCarrilesX   ;CX coordenada en X
		mov bh, pagina             			;BH la pagina a imprimir
		mov al, 15                  		;Color que queremos colocar
		int 10h

		;Aumentamos la contadorPixelesSeparacion
		xor ax,ax
		mov ax, contadorPixelesSeparacion
		add ax, 1
		mov contadorPixelesSeparacion, ax

		;Aumentamos la posicionDivisionCarrilesX
		xor ax,ax
		mov ax, posicionDivisionCarrilesX
		add ax, 1
		mov posicionDivisionCarrilesX, ax

		;Mientras estemos dentro de = a 10 imprimimos la fila
		cmp contadorPixelesSeparacion, 10
		je aumentoX           ;Si es menor o igual salta

		jmp DivisionCarrilesCarriles


aumentoX:
		;Reiniciamos el contador
		mov contadorPixelesSeparacion, 0

		;Aumentamos la posicionDivisionCarrilesX
		xor ax,ax
		mov ax, posicionDivisionCarrilesX
		add ax, 10
		mov posicionDivisionCarrilesX, ax

		;Vericamos que no hayamos llegado al borde
		cmp posicionDivisionCarrilesX, 320
		jbe DivisionCarrilesCarriles           ;Si es menor o igual salta

		;Llegamos al borde aumentamos Y
		xor ax,ax 
		mov ax, posicionDivisionCarrilesY
		add ax, 8
		mov posicionDivisionCarrilesY,ax

		;Reiniciamos X
		mov posicionDivisionCarrilesX, 0

		;Vericamos que no hayamos llegado al borde
		cmp posicionDivisionCarrilesY, 176
		jbe DivisionCarrilesCarriles           ;Si es menor o igual salta

		;Completamos los carriles
		CALL cambiarPagina

		
		
		jmp cartel

cartel:
		;Necesitamos colocar en una posicion el cursor
		mov columna, 0
		mov fila, 0
		call colocarCursor
		print punteouser

		;Necesitamos colocar en una posicion el cursor
		mov columna, 16
		mov fila, 0
		call colocarCursor
		print vidasVideo

		mov columna, 30
		mov fila, 0
		call colocarCursor
		print vidasVideo


		;Necesitamos colocar en una posicion el cursor
		mov columna, 0
		mov fila, 24
		call colocarCursor
		print ensesion

		;Necesitamos colocar en una posicion el cursor
		mov columna, 17
		mov fila, 24
		call colocarCursor
		print fecha1
		;Necesitamos colocar en una posicion el cursor
		mov columna, 29
		mov fila, 24
		call colocarCursor
		print hora1
		
		
		jmp inicioCarro

inicioCarro:
		;Limpiamos los registros
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx

		;Inicializamos las variables que vamos a usar
		generarrandom disenoCarro1
		generarrandom OrientacionCarro1
		generarrandom velocidadCarro1
		mov ax, OrientacionCarro1
		mov posicionCarro1X,ax    ;Posicion en x donde inicia
		mov posicionCarro1Y,22   ;Posicion en y donde inicia
		mov PosicionI1,22
		mov posicionCarro1X_Temp, 0
		mov posicionCarro1Y_Temp, 0
			
		generarrandom disenoCarro2
		generarrandom OrientacionCarro2
		generarrandom velocidadCarro2
		mov ax, OrientacionCarro2
		mov posicionCarro2X,ax
		mov ax, posicionCarro1Y
		add ax, 9
		mov posicionCarro2Y,ax
		mov PosicionI2,ax
		mov posicionCarro2X_Temp, 0
		mov posicionCarro2Y_Temp, 0

		mov disenoCarro3, 3
		mov OrientacionCarro3, 320
		mov velocidadCarro3, 1
		mov ax, OrientacionCarro3
		mov posicionCarro3X,ax 
		mov ax, posicionCarro2Y
		add ax, 8
		mov posicionCarro3Y,ax
		mov PosicionI3,ax  
		mov posicionCarro3X_Temp, 0
		mov posicionCarro3Y_Temp, 0

		mov disenoCarro4, 2
		mov OrientacionCarro4, 0
		mov velocidadCarro4, 1
		mov ax, OrientacionCarro4
		mov posicionCarro4X,ax
		mov ax, posicionCarro3Y
		add ax, 8
		mov posicionCarro4Y,ax
		mov PosicionI4,ax
		mov posicionCarro4X_Temp, 0
		mov posicionCarro4Y_Temp, 0

		mov disenoCarro5, 1
		mov OrientacionCarro5, 320
		mov velocidadCarro5, 1
		mov ax, OrientacionCarro5
		mov posicionCarro5X,ax
		mov ax, posicionCarro4Y
		add ax, 8
		mov posicionCarro5Y,ax
		mov PosicionI5,ax
		mov posicionCarro5X_Temp, 0
		mov posicionCarro5Y_Temp, 0
			mov disenoCarro6, 3
			mov OrientacionCarro6, 0
			mov velocidadCarro6, 1
			mov ax, OrientacionCarro6
			mov posicionCarro6X,ax
			mov ax, posicionCarro5Y
			add ax, 8
			mov posicionCarro6Y,ax
			mov PosicionI6,ax
			mov posicionCarro6X_Temp, 0
			mov posicionCarro6Y_Temp, 0

			mov disenoCarro7, 2
			mov OrientacionCarro7, 320
			mov velocidadCarro7, 1
			mov ax, OrientacionCarro7
			mov posicionCarro7X,ax
			mov ax, posicionCarro6Y
			add ax, 8
			mov posicionCarro7Y,ax
			mov PosicionI7,ax
			mov posicionCarro7X_Temp, 0
			mov posicionCarro7Y_Temp, 0

			mov disenoCarro8, 1
			mov OrientacionCarro8, 0
			mov velocidadCarro8, 3
			mov ax, OrientacionCarro8
			mov posicionCarro8X,ax
			mov ax, posicionCarro7Y
			add ax, 8
			mov posicionCarro8Y,ax
			mov PosicionI8,ax
			mov posicionCarro8X_Temp, 0
			mov posicionCarro8Y_Temp, 0

			mov disenoCarro9, 2
			mov OrientacionCarro9, 320
			mov velocidadCarro9, 1
			mov ax, OrientacionCarro9
			mov posicionCarro9X,ax
			mov ax, posicionCarro8Y
			add ax, 8
			mov posicionCarro9Y,ax
			mov PosicionI9,ax
			mov posicionCarro9X_Temp, 0
			mov posicionCarro9Y_Temp, 0

			mov disenoCarro10, 2
			mov OrientacionCarro10, 320
			mov velocidadCarro10, 1
			mov ax, OrientacionCarro10
			mov posicionCarro10X,ax
			mov ax, posicionCarro9Y
			add ax, 8
			mov posicionCarro10Y,ax
			mov PosicionI10,ax
			mov posicionCarro10X_Temp, 0
			mov posicionCarro10Y_Temp, 0

			mov disenoCarro11, 3
			mov OrientacionCarro11, 0
			mov velocidadCarro11, 1
			mov ax, OrientacionCarro11
			mov posicionCarro11X,ax
			mov ax, posicionCarro10Y
			add ax, 8
			mov posicionCarro11Y,ax
			mov PosicionI11,ax
			mov posicionCarro11X_Temp, 0
			mov posicionCarro11Y_Temp, 0

			mov disenoCarro12, 1
			mov OrientacionCarro12, 0
			mov velocidadCarro12, 1
			mov ax, OrientacionCarro12
			mov posicionCarro12X,ax
			mov ax, posicionCarro11Y
			add ax, 8
			mov posicionCarro12Y,ax
			mov PosicionI12,ax
			mov posicionCarro12X_Temp, 0
			mov posicionCarro12Y_Temp, 0

		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx
	

		jmp carro



carro:
		call cambiarPagina
		;Posicion donde inicia a limpiar los carriles
		mov ax, OrientacionCarro1
		mov posicionCarrilesX, ax
		mov ax, posicionCarro1Y
		sub ax, 6
		mov posicionCarrilesY, ax
		;Creamos el diseño del carro
		crearDiseno1 colorpixel,disenoCarro1,posicionCarro1X,posicionCarro1Y,posicionCarro1X_Temp,posicionCarro1Y_Temp,pagina,cicloDuracion,columna,fila
		movimientoCarril OrientacionCarro1,posicionCarro1X,posicionCarro1Y,velocidadCarro1,posicionCarrilesX,posicionCarrilesY
		limpiezaCarriles OrientacionCarro1,posicionCarrilesX,posicionCarrilesY,PosicionI1,posicionCarro1X,posicionCarro1Y,pagina
		
		mov ax, OrientacionCarro2
		mov posicionCarrilesX, ax
		mov ax, posicionCarro2Y
		sub ax, 6
		mov posicionCarrilesY, ax
		;Creamos el diseño del carro 2
		crearDiseno1 colorpixel,disenoCarro2,posicionCarro2X,posicionCarro2Y,posicionCarro2X_Temp,posicionCarro2Y_Temp,pagina,cicloDuracion,columna,fila
		movimientoCarril OrientacionCarro2,posicionCarro2X,posicionCarro2Y,velocidadCarro2,posicionCarrilesX,posicionCarrilesY
		limpiezaCarriles OrientacionCarro2,posicionCarrilesX,posicionCarrilesY,PosicionI2,posicionCarro2X,posicionCarro2Y,pagina
		
		mov ax, OrientacionCarro3
		mov posicionCarrilesX, ax
		mov ax, posicionCarro3Y
		sub ax, 6
		mov posicionCarrilesY, ax
		;Creamos el diseño del carro 3
		crearDiseno1 colorpixel,disenoCarro3,posicionCarro3X,posicionCarro3Y,posicionCarro3X_Temp,posicionCarro3Y_Temp,pagina,cicloDuracion,columna,fila
		movimientoCarril OrientacionCarro3,posicionCarro3X,posicionCarro3Y,velocidadCarro3,posicionCarrilesX,posicionCarrilesY
		limpiezaCarriles OrientacionCarro3,posicionCarrilesX,posicionCarrilesY,PosicionI3,posicionCarro3X,posicionCarro3Y,pagina

		mov ax, OrientacionCarro4
		mov posicionCarrilesX, ax
		mov ax, posicionCarro4Y
		sub ax, 6
		mov posicionCarrilesY, ax
		;Creamos el diseño del carro 4
		crearDiseno1 colorpixel,disenoCarro4,posicionCarro4X,posicionCarro4Y,posicionCarro4X_Temp,posicionCarro4Y_Temp,pagina,cicloDuracion,columna,fila
		movimientoCarril OrientacionCarro4,posicionCarro4X,posicionCarro4Y,velocidadCarro4,posicionCarrilesX,posicionCarrilesY
		limpiezaCarriles OrientacionCarro4,posicionCarrilesX,posicionCarrilesY,PosicionI4,posicionCarro4X,posicionCarro4Y,pagina

		mov ax, OrientacionCarro5
		mov posicionCarrilesX, ax
		mov ax, posicionCarro5Y
		sub ax, 6
		mov posicionCarrilesY, ax
		;Creamos el diseño del carro 5
		crearDiseno1 colorpixel,disenoCarro5,posicionCarro5X,posicionCarro5Y,posicionCarro5X_Temp,posicionCarro5Y_Temp,pagina,cicloDuracion,columna,fila
		movimientoCarril OrientacionCarro5,posicionCarro5X,posicionCarro5Y,velocidadCarro5,posicionCarrilesX,posicionCarrilesY
		limpiezaCarriles OrientacionCarro5,posicionCarrilesX,posicionCarrilesY,PosicionI5,posicionCarro5X,posicionCarro5Y,pagina
		
			mov ax, OrientacionCarro6
	        mov posicionCarrilesX, ax
			mov ax, posicionCarro6Y
			sub ax, 6
			mov posicionCarrilesY, ax
			;Creamos el diseño del carro 6
			crearDiseno1 colorpixel,disenoCarro6,posicionCarro6X,posicionCarro6Y,posicionCarro6X_Temp,posicionCarro6Y_Temp,pagina,cicloDuracion,columna,fila
			movimientoCarril OrientacionCarro6,posicionCarro6X,posicionCarro6Y,velocidadCarro6,posicionCarrilesX,posicionCarrilesY
			limpiezaCarriles OrientacionCarro6,posicionCarrilesX,posicionCarrilesY,PosicionI6,posicionCarro6X,posicionCarro6Y,pagina

			mov ax, OrientacionCarro7
	        mov posicionCarrilesX, ax
			mov ax, posicionCarro7Y
			sub ax, 6
			mov posicionCarrilesY, ax
			;Creamos el diseño del carro 7
			crearDiseno1 colorpixel,disenoCarro7,posicionCarro7X,posicionCarro7Y,posicionCarro7X_Temp,posicionCarro7Y_Temp,pagina,cicloDuracion,columna,fila
			movimientoCarril OrientacionCarro7,posicionCarro7X,posicionCarro7Y,velocidadCarro7,posicionCarrilesX,posicionCarrilesY
			limpiezaCarriles OrientacionCarro7,posicionCarrilesX,posicionCarrilesY,PosicionI7,posicionCarro7X,posicionCarro7Y,pagina

			mov ax, OrientacionCarro8
	        mov posicionCarrilesX, ax
			mov ax, posicionCarro8Y
			sub ax, 6
			mov posicionCarrilesY, ax
			;Creamos el diseño del carro 8
			crearDiseno1 colorpixel,disenoCarro8,posicionCarro8X,posicionCarro8Y,posicionCarro8X_Temp,posicionCarro8Y_Temp,pagina,cicloDuracion,columna,fila
			movimientoCarril OrientacionCarro8,posicionCarro8X,posicionCarro8Y,velocidadCarro8,posicionCarrilesX,posicionCarrilesY
			limpiezaCarriles OrientacionCarro8,posicionCarrilesX,posicionCarrilesY,PosicionI8,posicionCarro8X,posicionCarro8Y,pagina
			
			mov ax, OrientacionCarro9
	        mov posicionCarrilesX, ax
			mov ax, posicionCarro9Y
			sub ax, 6
			mov posicionCarrilesY, ax
			;Creamos el diseño del carro 9
			crearDiseno1 colorpixel,disenoCarro9,posicionCarro9X,posicionCarro9Y,posicionCarro9X_Temp,posicionCarro9Y_Temp,pagina,cicloDuracion,columna,fila
			movimientoCarril OrientacionCarro9,posicionCarro9X,posicionCarro9Y,velocidadCarro9,posicionCarrilesX,posicionCarrilesY
			limpiezaCarriles OrientacionCarro9,posicionCarrilesX,posicionCarrilesY,PosicionI9,posicionCarro9X,posicionCarro9Y,pagina

			mov ax, OrientacionCarro10
	        mov posicionCarrilesX, ax
			mov ax, posicionCarro10Y
			sub ax, 6
			mov posicionCarrilesY, ax
			;Creamos el diseño del carro 10
			crearDiseno1 colorpixel,disenoCarro10,posicionCarro10X,posicionCarro10Y,posicionCarro10X_Temp,posicionCarro10Y_Temp,pagina,cicloDuracion,columna,fila
			movimientoCarril OrientacionCarro10,posicionCarro10X,posicionCarro10Y,velocidadCarro10,posicionCarrilesX,posicionCarrilesY
			limpiezaCarriles OrientacionCarro10,posicionCarrilesX,posicionCarrilesY,PosicionI10,posicionCarro10X,posicionCarro10Y,pagina

			mov ax, OrientacionCarro11
	        mov posicionCarrilesX, ax
			mov ax, posicionCarro11Y
			sub ax, 6
			mov posicionCarrilesY, ax
			;Creamos el diseño del carro 11
			crearDiseno1 colorpixel,disenoCarro11,posicionCarro11X,posicionCarro11Y,posicionCarro11X_Temp,posicionCarro11Y_Temp,pagina,cicloDuracion,columna,fila
			movimientoCarril OrientacionCarro11,posicionCarro11X,posicionCarro11Y,velocidadCarro11,posicionCarrilesX,posicionCarrilesY
			limpiezaCarriles OrientacionCarro11,posicionCarrilesX,posicionCarrilesY,PosicionI11,posicionCarro11X,posicionCarro11Y,pagina

			mov ax, OrientacionCarro12
	        mov posicionCarrilesX, ax
			mov ax, posicionCarro12Y
			sub ax, 6
			mov posicionCarrilesY, ax
			;Creamos el diseño del carro 12
			crearDiseno1 colorpixel,disenoCarro12,posicionCarro12X,posicionCarro12Y,posicionCarro12X_Temp,posicionCarro12Y_Temp,pagina,cicloDuracion,columna,fila
			movimientoCarril OrientacionCarro12,posicionCarro12X,posicionCarro12Y,velocidadCarro12,posicionCarrilesX,posicionCarrilesY
			limpiezaCarriles OrientacionCarro12,posicionCarrilesX,posicionCarrilesY,PosicionI12,posicionCarro12X,posicionCarro12Y,pagina

		;Volvemos a enciclar
		jmp carro
			;=============================== errores ===============================
error0:
   	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
    print mesajeError0
   	delay 30
	jmp MenuInicial
error1:
	call limpiarEnColorNegro
	mov columna, 4
	mov fila, 12
	call colocarCursor
	print mesajeError1
   	delay 30

	jmp RepeirIntento
error2:
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
	print mesaje21
	mov columna, 6
	mov fila, 13
	call colocarCursor
	print mesaje22
   	delay 150
	jmp MenuInicial
error2i:
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
	print mesajeError2
   	delay 30
	jmp MenuInicial
error3:
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
	print mesajeError3
   	delay 30
	jmp MenuInicial
error4:
	call limpiarEnColorNegro
	mov columna, 3
	mov fila, 12
	call colocarCursor
	print mesajeError4
   	delay 30
	jmp MenuInicial
error5:
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
	print mesajeError5
   	delay 30
	jmp MenuInicial
error6:
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
	print mesajeError6
   	delay 30
	jmp MenuInicial
error7:
   call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
    print mesajeError7
   	delay 30
	jmp MenuInicial
error8:
   call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
    print mesajeError8
   	delay 30
	jmp MenuInicial
error9:
    call limpiarEnColorNegro
	mov columna, 5
	mov fila, 12
	call colocarCursor
    print mesajeError9
   	delay 30
	jmp MenuInicial
error10:
   call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
    print mesajeError10
   	delay 30
	jmp MenuInicial
error11:
    call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
    print mesajeError11
   	delay 30
	jmp MenuInicial
error12:
	call limpiarEnColorNegro
	mov columna, 3
	mov fila, 12
	call colocarCursor
	print mesajeError12
   	delay 30
	jmp InicioRegistro
error13:
	call limpiarEnColorNegro
	mov columna, 3
	mov fila, 12
	call colocarCursor
	print mesajeError13
   	delay 30
	jmp InicioRegistro
error14:
	call limpiarEnColorNegro
	mov columna, 3
	mov fila, 12
	call colocarCursor
	print mesajeError14
   	delay 30
	jmp InicioRegistro
error15:
	call limpiarEnColorNegro
	mov columna, 3
	mov fila, 12
	call colocarCursor
	print mesajeError15
   	delay 30
	jmp InicioRegistro
error16:
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
	print mesajeError16
   	delay 30
	jmp InicioRegistro

error17:
	call limpiarEnColorNegro
	mov columna, 2
	mov fila, 12
	call colocarCursor
	print mesajeError17
   	delay 30
	jmp MenuInicial
error18:
	call limpiarEnColorNegro
	mov columna, 6
	mov fila, 12
	call colocarCursor
	print mesajeError18
   	delay 30
	jmp MenuInicial
; ================================ procedimientos ===============================
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

generarTablero proc
		;Limpiamos los registros
		xor ax,ax
		xor bx,bx
		xor cx,cx
		xor dx,dx
		mov posicionTableroX,0
		mov posicionTableroY,8

		;Ahora limpiamos la pantalla
		;CALL limpiarEnColorNegro

		jmp tablero1


	tablero1:
			;Limpiamos los registros
			xor ax,ax
			xor bx,bx
			xor cx,cx
			xor dx,dx

			;Empezamos a graficar pagina 0
			mov ah, 0ch                ;Indicar que se imprimira un pixel
			mov dx, posicionTableroY   ;DX coordenada en Y
			mov cx, posicionTableroX   ;CX coordenada en X
			mov bh, pagina             ;BH la pagina a imprimir
			mov al, 7                  ;Color que queremos colocar
			int 10h

			;Empezamos a graficar pagina 1
			mov ah, 0ch                ;Indicar que se imprimira un pixel
			mov dx, posicionTableroY   ;DX coordenada en Y
			mov cx, posicionTableroX   ;CX coordenada en X
			mov bh, 1                  ;BH la pagina a imprimir
			mov al, 7                  ;Color que queremos colocar
			int 10h

			;Aumentamos la posicionTableroY
			xor ax,ax
			mov ax, posicionTableroY
			add ax, 1
			mov posicionTableroY, ax

			;Mientras estemos dentro de < = a 192 imprimimos la fila
			cmp posicionTableroY, 192
			jbe tablero1          ;Si es menor o igual salta

			;Como se sobre paso reiniciamos la posicionTableroY y aumentamos la posicion tablero X
			xor ax,ax 
			mov posicionTableroY, 8
			mov ax, posicionTableroX
			add ax, 1
			mov posicionTableroX, ax

			;Verificamos que hayamos terminado las columnas
			;Mientras estemos dentro de < = a 320 seguimos analizando
			cmp posicionTableroX, 320
			jbe tablero1           ;Si es menor o igual salta

			;Esperamos un caracter
			;getChar

			;Ahora limpiamos la pantalla
			;CALL limpiarEnColorNegro

			;jmp logicaVideo ;<---------------------Regresa al inicio de video

			;Regresamos al inicio de video
			jmp inicioCarriles1

	inicioCarriles1:
			;Limpiamos los registros
			xor ax,ax
			xor bx,bx
			xor cx,cx
			xor dx,dx
			mov posicionCarrilesX, 0
			mov posicionCarrilesY, 16

			jmp Carriles1

	Carriles1:
			;Limpiamos los registros
			xor ax,ax
			xor bx,bx
			xor cx,cx
			xor dx,dx

			;Empezamos a graficar
			mov ah, 0ch                ;Indicar que se imprimira un pixel
			mov dx, posicionCarrilesY  ;DX coordenada en Y
			mov cx, posicionCarrilesX  ;CX coordenada en X
			mov bh, pagina             ;BH la pagina a imprimir
			mov al, 8                  ;Color que queremos colocar
			int 10h

			;Empezamos a graficar pagina 1
			mov ah, 0ch                ;Indicar que se imprimira un pixel
			mov dx, posicionTableroY   ;DX coordenada en Y
			mov cx, posicionTableroX   ;CX coordenada en X
			mov bh, 1                  ;BH la pagina a imprimir
			mov al, 7                  ;Color que queremos colocar
			int 10h

			;Aumentamos la posicionCarrilesY
			xor ax,ax
			mov ax, posicionCarrilesY
			add ax, 1
			mov posicionCarrilesY, ax

			;Mientras estemos dentro de < = a 184 imprimimos la fila
			cmp posicionCarrilesY, 184
			jbe Carriles1           ;Si es menor o igual salta

			;Como se sobre paso reiniciamos la posicionCarrilesY y aumentamos la posicionCarrilesX
			xor ax,ax 
			mov posicionCarrilesY, 16
			mov ax, posicionCarrilesX
			add ax, 1
			mov posicionCarrilesX, ax

			;Verificamos que hayamos terminado las columnas
			;Mientras estemos dentro de < = a 320 seguimos analizando
			cmp posicionCarrilesX, 320
			jbe Carriles1           ;Si es menor o igual salta

			;Como termino de hacer el grafico mostramos la pagina hecha
			;CALL cambiarPagina

			;Esperamos un caracter
			;getChar

			;Ahora limpiamos la pantalla
			;CALL limpiarEnColorNegro

			;jmp logicaVideo

			jmp inicioDivisionCarriles1

	inicioDivisionCarriles1:
			;Limpiamos los registros
			xor ax,ax
			xor bx,bx
			xor cx,cx 
			xor dx,dx
			mov posicionDivisionCarrilesX, 0
			mov posicionDivisionCarrilesY, 24
			mov contadorPixelesSeparacion,0

			jmp DivisionCarrilesCarriles1

	DivisionCarrilesCarriles1:
			;Limpiamos los registros
			xor ax,ax
			xor bx,bx
			xor cx,cx
			xor dx,dx

			;Empezamos a graficar
			mov ah, 0ch                			;Indicar que se imprimira un pixel
			mov dx, posicionDivisionCarrilesY   ;DX coordenada en Y
			mov cx, posicionDivisionCarrilesX   ;CX coordenada en X
			mov bh, pagina             			;BH la pagina a imprimir
			mov al, 15                  		;Color que queremos colocar
			int 10h

			;Aumentamos la contadorPixelesSeparacion
			xor ax,ax
			mov ax, contadorPixelesSeparacion
			add ax, 1
			mov contadorPixelesSeparacion, ax

			;Aumentamos la posicionDivisionCarrilesX
			xor ax,ax
			mov ax, posicionDivisionCarrilesX
			add ax, 1
			mov posicionDivisionCarrilesX, ax

			;Mientras estemos dentro de = a 10 imprimimos la fila
			cmp contadorPixelesSeparacion, 10
			je aumentoX1           ;Si es menor o igual salta

			jmp DivisionCarrilesCarriles1


	aumentoX1:
			;Reiniciamos el contador
			mov contadorPixelesSeparacion, 0

			;Aumentamos la posicionDivisionCarrilesX
			xor ax,ax
			mov ax, posicionDivisionCarrilesX
			add ax, 10
			mov posicionDivisionCarrilesX, ax

			;Vericamos que no hayamos llegado al borde
			cmp posicionDivisionCarrilesX, 320
			jbe DivisionCarrilesCarriles1           ;Si es menor o igual salta

			;Llegamos al borde aumentamos Y
			xor ax,ax 
			mov ax, posicionDivisionCarrilesY
			add ax, 8
			mov posicionDivisionCarrilesY,ax

			;Reiniciamos X
			mov posicionDivisionCarrilesX, 0

			;Vericamos que no hayamos llegado al borde
			cmp posicionDivisionCarrilesY, 176
			jbe DivisionCarrilesCarriles1           ;Si es menor o igual salta


generarTablero endp

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

