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
	;cmp al,66 ;mnemonio 31h = 1 en hexadecimal, ascii 49
	;je menuAdminOriginal8
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

