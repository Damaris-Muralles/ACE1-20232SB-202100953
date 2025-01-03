;imprimir cadenas en consola
print macro cadena 
    mov ah,09h ;Numero de funcion para imprimir cadena en pantalla
	mov dx, @data ;con esto le decimos que nuestrfo dato se encuentra en la sección data
	mov ds,dx ;el ds debe apuntar al segmento donde se encuentra la cadena (osea el dx, que apunta  a data)
	mov dx,offset cadena ;especificamos el largo de la cadena, con la instrucción offset
	int 21h  ;ejecutamos la interrupción
endm 
;cerrar el programa
close macro  
    mov ah, 4ch ;Numero de función que finaliza el programa
    xor al,al ;limpiar al 
    int 21h
endm
;obtener caracter
getChar macro 
    mov ah,01h ;se guarda en al en código hexadecimal del caracter leído 
    int 21h
endm
;macro para recibir una cadena, varios caracteres
ObtenerTexto macro cadena  

 LOCAL ObtenerChar, endTexto 
    ;si, cx, di  registros que usualmente se usan como contadores 
    xor di,di  ; => mov si, 0  reinica el contador

    ObtenerChar:
        getChar  ;llamamos al método de obtener caracter 
        cmp al, 0dh ; como se guarda en al, comparo si al es igual a salto de línea, ascii de salto de linea en hexadecimal o 10en ascii
        je endTexto ;si es igual que el salto de línea, nos vamos a la etiqueta endTexto, donde agregamos el $ de dolar a la entrada 
        mov cadena[di],al ; mov destino, fuente.  Vamos copiando el ascii del caracter que se guardó en al, al vector cadena en la posicion del contador si
        inc di ; => si = si+1
        jmp ObtenerChar

    endTexto:
        mov al, 36 ;ascii del signo $ o en hexadecimal 24h
        mov cadena[di],al  ;copiamos el $ a la cadena
endm 

;limpiar pantalla
clear macro 
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip
         print skip

endm

; concatenar cadenas de texto
concatenarCadena macro origen,destino
    ;xor si,si  ; => mov si, 0  reinica el contador
    LOCAL ObtenerCaracter,  termino
    ;Limpiamos el indice si y di 
    mov si,0
    mov di,0
    ;Extraemos de la pila el valor y lo guardamos en si
    pop si

    ;En base a la cadena que queremos guardar extraemos caracter por caracter
    ;Y lo guardamos en el destino
    ;Esto es como realizar un += para que podamos concatenar cadenas
    ObtenerCaracter:
        cmp origen[di], 36
        je termino
        mov al, origen[di]
        mov destino[si], al
        inc si
        inc di
        jmp ObtenerCaracter 
    termino:
        ;Como ya termino guardamos el indice si en la pila
        push si
        ;Limpiamos el registro di (Les recomiendo si ya no utilizan un registro limpienlo).
        mov di,0

endm

; macro para hacer una pausa de n*55ms
delay macro tiempo
    LOCAL espera
    ; Guardar los registros
    push ax
    push dx

    ; Obtener el contador de ticks actual
    mov ah, 0
    int 1Ah
    mov bx, dx

    ; Esperar 9 ticks (aproximadamente medio segundo)
    add bx, tiempo

    espera:
        ; Obtener el contador de ticks actual
        mov ah, 0
        int 1Ah

        ; Comprobar si han pasado 9 ticks
        cmp dx, bx
        jb espera

        ; Restaurar los registros
        pop dx
        pop ax
endm
; generar numero random de 0 a 7
generarrandom macro letras
    LOCAL fin
    
    ; Inicializar el generador de números aleatorios
    mov ah, 2ch
    int 21h
    mov ah, 2
    int 21h

    ; Generar un número aleatorio entre 0 y 6
    mov ah, 0
    mov al, DL
    and al, 7
    cmp al, 0
    je fin
    cmp al, 1
    je fin
    cmp al, 2
    je fin
    cmp al, 3
    je fin
    cmp al, 4
    je fin
    cmp al, 5   
    je fin
    cmp al, 6
    je fin

    fin:
        ; Usar el número aleatorio como índice para seleccionar una letra
        mov bx, offset letras
        add bx, ax
        mov al, [bx]
 
endm
; obtener una cadena que contine un nombre pero sin la extension
Obtenernombre macro cadena 

 LOCAL ObtenerChar, endTexto 
    ;si, cx, di  registros que usualmente se usan como contadores 
    xor di,di  ; => mov si, 0  reinica el contador

    ObtenerChar:
        getChar  ;llamamos al método de obtener caracter 
        cmp al, 0dh ; como se guarda en al, comparo si al es igual a salto de línea, ascii de salto de linea en hexadecimal o 10en ascii
        je endTexto ;si es igual que el salto de línea, nos vamos a la etiqueta endTexto, donde agregamos el $ de dolar a la entrada 
        cmp al, 46 ; comparamos si es punto
        je error4
        mov cadena[di],al ; mov destino, fuente.  Vamos copiando el ascii del caracter que se guardó en al, al vector cadena en la posicion del contador si
        inc di ; => si = si+1
        jmp ObtenerChar

    endTexto:
        mov al, 36 ;ascii del signo $ o en hexadecimal 24h
        mov cadena[di],al  ;copiamos el $ a la cadena
endm 



;Operaciones aritmeticas

sumar macro  numero1,numero2,resultado,test1,test2,signo3
  LOCAL salto,noSalto,fin   
     
     mov al,numero1 ;Mueve a al el numero1
     imul test1
     mov bl,al
     xor al,al
     mov al,numero2 ;Mueve a al el numero1
     imul test2
     add al,bl ;Le suma a al el numero2

     ;resuelta
        cmp al,1
        jg salto
        cmp al,1
        jmp noSalto
        
        
        salto:
            ;positivo
            mov resultado,al ;al -> resultado
            xor al,al
            mov al,43
            mov signo3[0],al
            xor al,al
            mov al,36
            mov signo3[1],al  
            mov test1,1
            jmp fin
        noSalto:
            ;negativo
            neg al
            mov resultado,al ;al -> resultado
            xor al,al
            mov al,45
            mov signo3[0],al
            xor al,al
            mov al,36
            mov signo3[1],al 
            mov test1,-1

        fin:
    
endm

imprimirDecimal macro numero,guardar
    mov al, numero     
    aam               
    add ax, 3030h     
    push ax            
    mov dl, ah         
    mov guardar[0], dl
    mov ah, 02h        
    int 21h
    pop dx             
    mov al,dl
    mov guardar[1], al
    mov ah, 02h        
    int 21h
endm
    
conversor macro numero1,resultado,numero2
    mov al ,numero1[0]
    ;mov resultado[0], al
    sub al,48
    mov cl,10
    mul cl
    mov bl,al
    mov al, numero2[0]
    sub al,48
    add bl,al
    ;add bl, numero2
    mov resultado,bl

endm

extractorCompleto macro arreglo,numero1,numero2,test1,signo
    Local ok,fin
            ;Limpiando el registro ax
            mov ax,0000
        
            mov al ,arreglo[0]
            cmp al,47 ;0
                ;print arreglo
                ja ok
               
            
            ;abria que agregar en caso es positivo
            ;sobre un resultado anterior.

        

        ok:
            mov al ,arreglo[0] ;Copiamos el numero a la cadena
            mov numero1[0],al ; movemos de al hacia la variable en la posicion0
            mov al, 36 ;ascii del signo $ o en hexadecimal 24h
            mov numero1[1],al  ;copiamos el $ a la cadena
            mov al,0          ;Limpiamos el registro
            mov al ,arreglo[1] ;Movemos el segundo numero a el registro al
            mov numero2[0],al ;movemos de al hacia el numero 2 posicion 0
            mov al, 36 ;ascii del signo $ o en hexadecimal 24h
            mov numero2[1],al  ;copiamos el $ a la cadena
            mov al, 1     ;valores de prueba solamente
            mov test1,al  
            mov al,43     ;movemos el signo + al registro al
            mov signo[0],al  ;movemos el signo + en la variable signo
            mov al,36     ;ascii del signo $ o en hexadecimal 24h
            mov signo[1],al ;movemos el signo $ en la variable signo
            ;print signo
            jmp fin ;Saltamos a la etiqueta fin
        fin:
            ;Salimos de la macro.
      
            
endm

; macros para manejos de archivos
 ;La utilizamos para limpiar alguna variables con cierto caracter que se envie
limpiar macro buffer, numbytes, caracter
  LOCAL Repetir
    ;Limpieza de los registros
	xor si,si
	xor cx,cx
    ;Cargamos el numero de repeticiones que queremos que realice loop
	mov	cx,numbytes

	Repetir:
        ;Movemos el caracter que ingresamos en la posicion especifica de la cadena
		mov buffer[si], caracter
        ;Aumentamos el indice si
		inc si
        ;Repetimos se va a repetir en base al numero que tenga cx, en este caso lo que se ingrese
        ;por el valor de numbytes
		Loop Repetir
endm

;Interrupcion para cerrar el handler
cerrar macro handler
	
	mov ah,3eh
	mov bx, handler
	int 21h
	;jc Error2
    jc error9
	mov handler,ax

endm

;Interrupccion para crear un archivo
crear macro buffer, handler
    xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx
	
	mov ah,3ch
	mov cx,00h
	lea dx,buffer
	int 21h
	;jc Error4
    jc error5
	mov handler, ax



endm

;Interrupcion para escribir en un archivo (El handle es como el archivo abierto)
escribir macro handler, buffer, numbytes
    xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx


	mov ah, 40h
	mov bx, handler
	mov cx, numbytes
	lea dx, buffer
	int 21h
	;jc Error3
    jc error8

endm

;Interrupcion para abrir archivos
abrir macro buffer,handler

	mov ah,3dh
	mov al,02h
	lea dx,buffer
	int 21h
	;jc Error1
    jc error7
	mov handler,ax

endm


;Interrupcion para leer archivos
leer macro handler,buffer, numbytes
	xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx


	mov ah,3fh
	mov bx,handler
	mov cx,numbytes
	lea dx,buffer ; mov dx,offset buffer 
	int 21h
	;jc  Error5
    jc error6

endm










; macros para juego connect
imprimircelda macro dato,valor,valor1
   
    mov dl, valor               ;simbolo1
    mov ah, 2               ; Función para mostrar un carácter en pantalla
    int 21h                 ; Muestra el espacio
    mov dl, valor1              ; simbolo2
    mov ah, 2               ; Función para mostrar un carácter en pantalla
    int 21h                 ; Muestra el espacio
    mov dl, dato        ; Carga la letra de columna actual en dl
    mov ah, 2            ; Función para mostrar un carácter en pantalla
    int 21h              ; Muestra la letra en pantalla
    inc si               ; Avanza al siguiente carácter
    mov dl, valor1              ; simbolo2
    mov ah, 2               ; Función para mostrar un carácter en pantalla
    int 21h                 ; Muestra el espacio
    
endm

verificar_ganador macro ganajugador1,ganajugador2,celda1,celda2,celda3,celda41
    LOCAL ganador1,ganador2,empate,empate1,fin,valores
    ganador1:
        mov al,celda1
        cmp al,88
        jne ganador2
        mov al,celda2
        cmp al,88
        jne ganador2
        mov al,celda3
        cmp al,88
        jne ganador2
        mov al,celda41
        cmp al,88
        jne ganador2
        mov al,'G'
        mov ganajugador1,al
        jmp ganador2
    ganador2:
        mov al,celda1
        cmp al,79
        jne empate
        mov al,celda2
        cmp al,79
        jne empate
        mov al,celda3
        cmp al,79
        jne empate
        mov al,celda41
        cmp al,79
        jne empate
        mov al,'G'
        mov ganajugador2,al
        jmp fin

    empate:
        cmp ganajugador1,' '
        je empate1
        jne fin
    empate1:
        cmp ganajugador2,' '
        je valores
        jne fin
    
    valores:
        mov al,'E'
        mov ganajugador1, al
        mov ganajugador2,al
    fin:
        ; nada  

endm

columnavacia macro vacio,celda,valor
    LOCAL vacia1,fin
    xor di,di
    mov al,celda
    cmp al,' '
    je vacia1
    mov al,' '
    mov vacio,al
    jmp fin
    vacia1:
        mov al,valor
        mov vacio,al
        mov celda,al
    fin:
        ; nada
endm
