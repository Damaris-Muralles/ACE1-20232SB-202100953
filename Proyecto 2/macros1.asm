
; ================================= DE USO GENERAL =================================
;imprimir cadenas en consola
print macro cadena 
    mov ah,09h ;Numero de funcion para imprimir cadena en pantalla
	mov dx, @data ;con esto le decimos que nuestrfo dato se encuentra en la sección data
	mov ds,dx ;el ds debe apuntar al segmento donde se encuentra la cadena (osea el dx, que apunta  a data)
	mov dx,offset cadena ;especificamos el largo de la cadena, con la instrucción offset
	int 21h  ;ejecutamos la interrupción
endm 
;obtener caracter
getChar macro 
    mov ah,01h ;se guarda en al en código hexadecimal del caracter leído 
    int 21h
endm
contarLongitud macro cadena
    Local contador,fin
    xor di,di
    xor al,al
    contador:
        cmp cadena[di],36
        je fin
        inc al
        inc di
        jmp contador
    fin:

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
ObtenerContra macro cadena,contador,caracter

 LOCAL ObtenerChar, endTexto,minus,especi
    ;si, cx, di  registros que usualmente se usan como contadores 
    xor si,si  ; => mov si, 0  reinica el contador
    ;[a-zA-Z*_.-@+?]+
    ObtenerChar:
        getChar  ;llamamos al método de obtener caracter 
        cmp al, 0dh ; como se guarda en al, comparo si al es igual a salto de línea, ascii de salto de linea en hexadecimal o 10en ascii
        je endTexto ;si es igual que el salto de línea, nos vamos a la etiqueta endTexto, donde agregamos el $ de dolar a la entrada 
        mov caracter[0],al
        ContadorMayus caracter,contador
        cmp contador,0
        je minus
        mov cadena[si],al ; mov destino, fuente.  Vamos copiando el ascii del caracter que se guardó en al, al vector cadena en la posicion del contador si
        inc si ; => si = si+1
        jmp ObtenerChar
    minus: 
        ContadorMinus caracter,contador
        cmp contador,0
        je especi
        mov cadena[si],al ; mov destino, fuente.  Vamos copiando el ascii del caracter que se guardó en al, al vector cadena en la posicion del contador si
        inc si ; => si = si+1
        jmp ObtenerChar
    especi:
        ContadorEspecial caracter,contador
        cmp contador,0
        je error16
        mov cadena[si],al ; mov destino, fuente.  Vamos copiando el ascii del caracter que se guardó en al, al vector cadena en la posicion del contador si
        inc si ; => si = si+1
        jmp ObtenerChar
    endTexto:
        mov al, 36 ;ascii del signo $ o en hexadecimal 24h
        mov cadena[si],al  ;copiamos el $ a la cadena
        
endm

ObtenerUser macro cadena,contador,caracter

 LOCAL ObtenerChar, endTexto ,primerCaracter,minus,numver,especi
    ;si, cx, di  registros que usualmente se usan como contadores 
    xor si,si  ; => mov si, 0  reinica el contador
    ;[a-z][a-z0-9._-]*
    ObtenerChar:
        getChar  ;llamamos al método de obtener caracter 
        cmp al, 0dh ; como se guarda en al, comparo si al es igual a salto de línea, ascii de salto de linea en hexadecimal o 10en ascii
        je endTexto ;si es igual que el salto de línea, nos vamos a la etiqueta endTexto, donde agregamos el $ de dolar a la entrada 
        mov caracter[0],al
        cmp si,0
        je primerCaracter
        jne minus
       
        
    minus: 
        ContadorMinus caracter,contador
        cmp contador,0
        je numver
        mov cadena[si],al ; mov destino, fuente.  Vamos copiando el ascii del caracter que se guardó en al, al vector cadena en la posicion del contador si
        inc si ; => si = si+1
        jmp ObtenerChar
    numver:
        ContadorNum caracter,contador
        cmp contador,0
        je especi
        mov cadena[si],al ; mov destino, fuente.  Vamos copiando el ascii del caracter que se guardó en al, al vector cadena en la posicion del contador si
        inc si ; => si = si+1
        jmp ObtenerChar
    especi:
        ContadorEspecial1 caracter,contador
        cmp contador,0
        je error16
        mov cadena[si],al ; mov destino, fuente.  Vamos copiando el ascii del caracter que se guardó en al, al vector cadena en la posicion del contador si
        inc si ; => si = si+1
        jmp ObtenerChar
    primerCaracter:
        ContadorMinus caracter,contador
        cmp contador,0
        je error16
        mov cadena[si],al ; mov destino, fuente.  Vamos copiando el ascii del caracter que se guardó en al, al vector cadena en la posicion del contador si
        inc si ; => si = si+1
        jmp ObtenerChar
    endTexto:
        mov al, 36 ;ascii del signo $ o en hexadecimal 24h
        mov cadena[si],al  ;copiamos el $ a la cadena
endm

ContadorMayus macro cadena,cont
    LOCAL comprobar,fin,aumentar
    xor di,di
    mov cont,0

    comprobar:
        cmp cadena[di],36
        je fin ; Cargar un byte de la cadena en AL
        cmp cadena[di],65
        je aumentar
        cmp cadena[di],66
        je aumentar
        cmp cadena[di],67
        je aumentar
        cmp cadena[di],68
        je aumentar
        cmp cadena[di],69
        je aumentar
        cmp cadena[di],70
        je aumentar
        cmp cadena[di],71
        je aumentar
        cmp cadena[di],72
        je aumentar
        cmp cadena[di],73
        je aumentar
        cmp cadena[di],74
        je aumentar
        cmp cadena[di],75
        je aumentar
        cmp cadena[di],76
        je aumentar
        cmp cadena[di],77
        je aumentar
        cmp cadena[di],78
        je aumentar
        cmp cadena[di],79
        je aumentar
        cmp cadena[di],80
        je aumentar
        cmp cadena[di],81
        je aumentar
        cmp cadena[di],82
        je aumentar
        cmp cadena[di],83
        je aumentar
        cmp cadena[di],84
        je aumentar
        cmp cadena[di],85
        je aumentar
        cmp cadena[di],86
        je aumentar
        cmp cadena[di],87
        je aumentar
        cmp cadena[di],88
        je aumentar
        cmp cadena[di],89
        je aumentar
        cmp cadena[di],90
        je aumentar
        inc di
        jmp comprobar
    aumentar:
        inc cont
        inc di
        jmp comprobar
       
    fin:
endm

ContadorMinus macro cadena,cont
    LOCAL comprobar,fin,aumentar
    xor di,di
    mov cont,0

    comprobar:
        cmp cadena[di],36
        je fin ; Cargar un byte de la cadena en AL
        cmp cadena[di],97
        je aumentar
        cmp cadena[di],98
        je aumentar
        cmp cadena[di],99
        je aumentar
        cmp cadena[di],100
        je aumentar
        cmp cadena[di],101
        je aumentar
        cmp cadena[di],102
        je aumentar
        cmp cadena[di],103
        je aumentar
        cmp cadena[di],104
        je aumentar
        cmp cadena[di],105
        je aumentar
        cmp cadena[di],106
        je aumentar
        cmp cadena[di],107
        je aumentar
        cmp cadena[di],108

        je aumentar
        cmp cadena[di],109
        je aumentar
        cmp cadena[di],110
        je aumentar
        cmp cadena[di],111
        je aumentar
        cmp cadena[di],112
        je aumentar
        cmp cadena[di],113
        je aumentar
        cmp cadena[di],114
        je aumentar
        cmp cadena[di],115
        je aumentar
        cmp cadena[di],116
        je aumentar
        cmp cadena[di],117
        je aumentar
        cmp cadena[di],118
        je aumentar
        cmp cadena[di],119
        je aumentar
        cmp cadena[di],120
        je aumentar
        cmp cadena[di],121
        je aumentar
        cmp cadena[di],122
        je aumentar
        inc di
        jmp comprobar
    aumentar:
        inc cont
        inc di
        jmp comprobar
       
    fin:
endm
ContadorNum macro cadena,cont
    LOCAL comprobar,fin,aumentar
    xor di,di
    mov cont,0
    

    comprobar:
        cmp cadena[di],36
        je fin ; Cargar un byte de la cadena en AL
        cmp cadena[di],48
        je aumentar
        cmp cadena[di],49
        je aumentar
        cmp cadena[di],50
        je aumentar
        cmp cadena[di],51
        je aumentar
        cmp cadena[di],52
        je aumentar
        cmp cadena[di],53
        je aumentar
        cmp cadena[di],54
        je aumentar
        cmp cadena[di],55
        je aumentar
        cmp cadena[di],56
        je aumentar
        cmp cadena[di],57
        je aumentar
        inc di
        jmp comprobar
    aumentar:
        inc cont
        inc di
        jmp comprobar
       
    fin:
endm
ContadorEspecial1 macro cadena,cont
    LOCAL comprobar,fin,aumentar
    xor di,di
    mov cont,0
    

    comprobar:
        cmp cadena[di],36
        je fin
        cmp cadena[di],46
        je aumentar
        cmp cadena[di],45
        je aumentar
        cmp cadena[di],95
        je aumentar
        inc di
        jmp comprobar
    aumentar:
        inc cont
        inc di
        jmp comprobar
    fin:
endm
ContadorEspecial macro cadena,cont
    LOCAL comprobar,fin,aumentar
    xor di,di
    mov cont,0
    

    comprobar:
        cmp cadena[di],36
        je fin
        cmp cadena[di],46
        je aumentar
        cmp cadena[di],45
        je aumentar
        cmp cadena[di],95
        je aumentar
        cmp cadena[di],42
        je aumentar
        cmp cadena[di],43
        je aumentar
        cmp cadena[di],63
        je aumentar
        cmp cadena[di],64
        je aumentar
        inc di
        jmp comprobar
    aumentar:
        inc cont
        inc di
        jmp comprobar
    fin:
endm
; obtener una cadena que contine un nombre pero sin la extension
Obtenernombrearchivo macro cadena 

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
;obtener un fecha y comvertirlo a texto
ObtenerFecha macro cadena,temp,temp1,temp3,temp4,simbolose
    mov si,0
    push si
    mov ah, 2Ah ; interrupción para obtener la fecha
    int 21h     ; llamada al sistema DOS
    mov temp3,dh
    mov temp4,dl
    ConverString temp4,temp
    concatenarCadena temp,cadena
    concatenarCadena simbolose,cadena
    ConverString temp3,temp
    concatenarCadena temp,cadena
    concatenarCadena simbolose,cadena
    concatenarCadena temp1,cadena
    
endm

; Macro para obtener la hora
ObtenerHora macro cadena,temp,temp1,temp2,temp3,simbolose
    mov si,0
    push si
    mov ah, 2Ch ; interrupción para obtener la hora
    int 21h     ; llamada al sistema DOS

    ; Convertir la hora a cadena
    mov temp1,ch; hora
    mov temp2,cl; minuto
    mov temp3,dh; segundo

    ConverString temp1,temp
    concatenarCadena temp,cadena
    concatenarCadena simbolose,cadena
    ConverString temp2,temp
    concatenarCadena temp,cadena
    concatenarCadena simbolose,cadena
    ConverString temp3,temp
    concatenarCadena temp,cadena
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
concatenarCadena1 macro origen,destino
    ;xor si,si  ; => mov si, 0  reinica el contador
    LOCAL ObtenerCaracter,  termino,buscar
    ;Limpiamos el indice si y di 
    mov si,0
    mov di,0
    buscar:
        cmp destino[si], 36
        je ObtenerCaracter
        inc si
        cmp si, 1000
        je error18
        jmp buscar
    ObtenerCaracter:
        cmp origen[di], 36
        je termino
        mov al, origen[di]
        mov destino[si], al
        inc si
        inc di
        jmp ObtenerCaracter 
    termino:
        mov si,0
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
compararcadena macro cadena1, cadena2, auxiliar
    
   LOCAL fin, no_son_iguales, son_iguales, comparar
    
    mov si, 0 ; Inicializa SI con la dirección de cadena1
    mov di, 0  ; Inicializa DI con la dirección de cadena2
    
    comparar:
        mov al, cadena1[si]  ; Carga AL desde [SI]
        ;mov dl, al  ; Mueve el contenido de AL a DL
        ;mov ah, 02h  ; Establece AH a 02H para la función de escritura de carácter
        ;int 21h  ; Llama a la interrupción 21H
        mov bl, al
        mov al, cadena2[di]  ; Carga AL desde [DI]
        
        inc si  ; Incrementa SI
        inc di  ; Incrementa DI
        cmp al, bl  ; Compara los caracteres cargados
        jne no_son_iguales  ; Si no son iguales, salta a no_son_iguales
        cmp al, 36  ; Comprueba si AL es el carácter nulo (fin de cadena)
        jne comparar  ; Si no es el final de la cadena, continúa comparando}
        cmp bl, 36  ; Comprueba si BL es el carácter nulo (fin de cadena)
        jne no_son_iguales  ; Si no es el final de la cadena, salta a no_son_iguales

        jmp son_iguales  ; Si llegamos aquí, las cadenas son iguales
    
    no_son_iguales:
        ; Las cadenas no son iguales.
        mov auxiliar, 0
        jmp fin
    
    son_iguales:
        ; Las cadenas son iguales.
        mov auxiliar, 1
    
    fin:
endm
encriptarPass macro cadena 
    LOCAL ObtenerCaracter,  termino
    ;Limpiamos el indice si y di 
    mov si,0
    mov di,0
    ;En base a la cadena que queremos guardar extraemos caracter por caracter
    ;Y lo guardamos en el destino
    ;Esto es como realizar un += para que podamos concatenar cadenas
    ObtenerCaracter:
        cmp cadena[di], 36
        je termino
        mov al, 42
        mov cadena[di], al
        inc di
        jmp ObtenerCaracter 
    termino:
        mov di,0
endm
iralfinal macro destino,contador
 LOCAL termino,buscar
    ;Limpiamos el indice si y di 
    mov si,0
    mov di,0
    buscar:
        cmp destino[si], 36
        je termino
        inc si
        cmp si, 1000
        je error18
        jmp buscar
    termino:
        dec si
        dec si
        mov contador,si
endm
buscarlimite macro destino,contador
    LOCAL termino,buscar,fin
    ;Limpiamos el indice si y di
    mov si,contador
    mov di,0
    buscar:
        cmp destino[si], 44
        je termino
        cmp si,0
        je fin
        dec si
        jmp buscar
    termino:
        inc si
        inc di
        cmp di,15
        je fin
        dec si
        dec si
        jmp buscar
    fin:
        mov contador,si
        mov si,0
        mov di,0
endm
; generar numero random de 0 a 7
generarrandom macro num
    LOCAL fin,fin1,fin2,fin3
    
    ; Inicializar el generador de números aleatorios
    mov ah, 2ch
    int 21h
    mov ah, 2
    int 21h

    ; Generar un número aleatorio entre 0 y 6
    mov ah, 1
    mov al, DL
    and al, 4
    ;cmp al, 0
    ;je fin
    cmp al, 1
    je fin
    cmp al, 2
    je fin
    cmp al, 3
    je fin
   

    fin:
       
        cmp num,1
        je fin1
        xor ah,ah
        mov num, ax      ; Mueve AX a num (en memoria)
        jmp fin3

    fin1:
        cmp ax,1
        je fin2
        mov ax,0
        mov num, ax       ; Mueve 0 a num (en memoria)
        jmp fin3

    fin2:
        mov ax,320
        mov num, ax     ; Mueve 320 a num (en memoria)

    fin3:
 
endm
;cerrar el programa
close macro  
    mov ah, 4ch ;Numero de función que finaliza el programa
    xor al,al ;limpiar al 
    int 21h
endm

; para limpiar datos
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
; para archivos

;Interrupcion para cerrar el handler
cerrar macro handler
	
	mov ah,3eh
	mov bx, handler
	int 21h
	;jc Error2
    jc error8
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
    jc error10
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
    jc error9

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
    jc error11

endm

;Operaciones aritmeticas
; Macro para la suma
sumar macro  numero1,sign,numero2,sign1,resultado,signo3
  LOCAL salto,noSalto,fin   
     
    mov al,numero1 
    imul sign
    mov bl,al
    xor al,al
    mov al,numero2 
    imul sign1
    add al,bl

     ;resuelta
        cmp al,1
        jg salto
        cmp al,1
        jmp noSalto
        
        
        salto:
            ;positivo
            mov resultado,al
            xor al,al
            mov al,43
            mov signo3[0],al
            xor al,al
            mov al,36
            mov signo3[1],al
            xor al,al
            mov al,1
            mov sign,al  
            jmp fin
        noSalto:
            neg al
            mov resultado,al ;
            xor al,al
            mov al,45
            mov signo3[0],al
            xor al,al
            mov al,36
            mov signo3[1],al
            xor al,al
            mov al,-1
            mov sign,al
            jmp fin
        fin:
    
endm
; Macro para la resta
restar macro numero1,sign,numero2,sign1,resultado,signo3
  LOCAL salto,noSalto,fin   
     
    mov al,numero1 
    imul sign
    mov bl,al
    xor al,al
    mov al,numero2 
    imul sign1
    sub bl,al 
    mov al,numero1 
    
     ;resuelta
        cmp bl,1
        jg salto
        cmp bl,1
        jmp noSalto
        
        
        salto:
            ;positivo
            mov resultado,bl 
            xor al,al
            mov al,43
            mov signo3[0],al
            xor al,al
            mov al,36
            mov signo3[1],al  
            xor al,al
            mov al,1
            mov sign,al  
            jmp fin
        noSalto:
            neg bl
            mov resultado,bl ;
            xor al,al
            mov al,45
            mov signo3[0],al
            xor al,al
            mov al,36
            mov signo3[1],al
            xor al,al
            mov al,-1
            mov sign,al   
        fin:
    
endm

; Macro para la multiplicación
multiplicar macro numero1,sign,numero2,sign1,resultado,signo3
  LOCAL salto,noSalto,fin   
     

    mov al, numero1
    imul sign
    mov bl,al
    xor al,al
    mov al,numero2 
    imul sign1
    imul bl

     ;resuelta
        cmp al,1
        jg salto
        cmp al,1
        jmp noSalto
        
        
        salto:
            ;positivo
            mov resultado,al 
            xor al,al
            mov al,43
            mov signo3[0],al
            xor al,al
            mov al,36
            mov signo3[1],al  
            xor al,al
            mov al,1
            mov sign,al  
            jmp fin
        
        noSalto:
            neg al;
            mov resultado,al ;
            xor al,al;
            mov al,45;
            mov signo3[0],al;
            xor al,36;
            mov signo3[1],al;
            xor al,al
            mov al,-1
            mov sign,al  
        fin:
    
endm
; Macro para la división
dividir macro numero1,sign,numero2,sign1,resultado,signo3
  LOCAL salto,noSalto,fin   
    mov al, numero2
    imul sign
    mov bl,al
    xor al,al
    mov al,numero1 
    imul sign1
    idiv bl

     ;resuelta
        cmp al,0
        jg salto
        jmp noSalto
        
        
        salto:
            ;positivo
            mov resultado,al 
            xor al,al
            mov al,43
            mov signo3[0],al
            xor al,al
            mov al,36
            mov signo3[1],al  
            xor al,al
            mov al,1
            mov sign,al  
            jmp fin
        
        noSalto:
            ;negativo
            neg al;
            mov resultado,al ;
            xor al,al;
            mov al,45;
            mov signo3[0],al;
            xor al,36;
            mov signo3[1],al;
            xor al,al
            mov al,-1
            mov sign,al  
            
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

extractorCompleto macro arreglo,numero1,numero2,signo,test
    Local ok,fin, positivo, negativo, positivosigno
            ;Limpiando el registro ax
            mov ax,0000
        
            mov al ,arreglo[0]
            cmp al,47 ;0
            ja positivo
            ; ver si hay signo -
            cmp al,45 ;-
            je negativo
            ; ver si hay signo +
            cmp al,43 ;+
            je positivosigno
        positivo:
            mov al,43     
            mov signo[0],al  
            mov al,36     
            mov signo[1],al 
            mov al, 1
            mov test,al
            jmp ok
        negativo:
            mov al,45     
            mov signo[0],al  
            mov al,36     
            mov signo[1],al 
            mov al, -1
            mov test,al
            ; quitar del arreglo el signo a manera que en la posicion 0 ahora este el numero
            mov al,arreglo[1]
            mov arreglo[0],al
            mov al,arreglo[2]
            mov arreglo[1],al
            jmp ok
        positivosigno:
            mov al,43     
            mov signo[0],al  
            mov al,36     
            mov signo[1],al
            mov al, 1
            mov test,al
            ; quitar del arreglo el signo a manera que en la posicion 0 ahora este el numero
            mov al,arreglo[1]
            mov arreglo[0],al
            mov al,arreglo[2]
            mov arreglo[1],al
            
            jmp ok
        ok:
            mov al ,arreglo[0] 
            mov numero1[0],al
            mov al, 36 
            mov numero1[1],al  
            mov al,0          
            mov al ,arreglo[1] 
            mov numero2[0],al 
            mov al, 36 
            mov numero2[1],al     
            jmp fin
        fin:
            ;Salimos de la macro.
      
            
endm


ConverString macro numero,convertido
    xor ax,ax
    xor al,al
    xor dl,dl
    
    mov al, numero     
    aam               
    add ax, 3030h     
    push ax            
    mov dl, ah         
    mov convertido[0], dl
    pop dx             
    mov al,dl
    mov convertido[1], al
endm

factorialm macro numero, resultado,guardar;, procedimiento,simf1,simf2,valor
    mov al, numero
    mov bl,al
    xor al,al
    mov al,resultado 
    mul bl
    mov resultado,al
    ConverString resultado,guardar
endm
prefijolect macro cadena,numero1,num1,num2,resul,test1,numero2,num3,num4,resul2,test2,simbolo,resultado2,signo3
    Local longitud,long1,recorrer,imprec,fin,restarec,multirec,divrec,sumarec,modificarcad,desplazarnum
    ;,numbers,modificarcad,numbersigno1,numbersigno2,numbersigno21
    mov si,0
    mov di,0
    longitud:
        mov al,cadena[di]
        cmp al,36 ;simbolo comillas ASCII
        je long1
        
        ;(Tener cuidado ya que si no hay condicion de salida se encicla)
        ;Salida de emergencia mas de 200 de llegada del indice, pueden poner un mayor
        cmp di,200
        je fin


        ;Incrementamos el indice
        inc di
        ;Si no es el que buscamos volvemos a buscar 
        jmp longitud
    long1:
        ; Copia el valor de di a la variable contador
        mov si, di
        ; Aquí comienza a recorrer desde la posición actual de contador hasta el 0
    recorrer:
        dec si ; Decrementa contador para moverse al carácter anterior
        cmp si, 0
        jl fin ; Si contador < 0, termina el bucle
        ; Imprime el carácter actual
        mov al, cadena[si] ; Carga el carácter actual en AL
        ; mov dl, al ; Mueve el carácter a DL
        ;mov ah, 2 ; Selecciona el servicio 2 (imprimir carácter) de la interrupción 21h
        ;int 21h ; Llama a la interrupción 21h para imprimir el carácter
        cmp al, 43 ; Suma
        je imprec
        ;je sumarec
        cmp al, 45 ; Resta
        je imprec
        ;je restarec
        cmp al, 42 ; Multiplicación
        je imprec
        je multirec
        cmp al, 47 ; División
        je imprec
        ;je divrec
        ;jmp numbers
        mov numero1[0],al
        inc si
        mov al,cadena[si]
        mov numero1[1],al
        inc si 
        mov al,cadena[si]
        mov numero2[0],al
        inc si
        mov al,cadena[si]
        mov numero2[1],al
        dec si
        dec si
        dec si
        jmp recorrer ; Vuelve al inicio del bucle para continuar recorriendo la cadena
    imprec:
        mov simbolo,al
        ;print numero1
        ;print simbolo
        ;print numero2
        extractorCompleto numero1,num1,num2,signo,test1
        conversor num1,resul,num2
        extractorCompleto numero2,num3,num4,signo2,test2
        conversor num3,resul2,num4
        mov al,simbolo
        cmp al, 43 ; Suma
        je sumarec
        cmp al, 45 ; Resta
        je restarec
        cmp al, 42 ; Multiplicación
        je multirec
        cmp al, 47 ; División
        je divrec
    multirec:
        multiplicar resul,test1,resul2,test2,resultado2,signo3
        jmp modificarcad

    divrec:
        dividir resul,test1,resul2,test2,resultado2,signo3
        jmp modificarcad
    sumarec:
        sumar resul,test1,resul2,test2,resultado2,signo3
        jmp modificarcad
    restarec:
        restar resul,test1,resul2,test2,resultado2,signo3

        jmp modificarcad
    modificarcad:
        ConverString resultado2,numero1
        mov al,numero1[0]
        mov cadena[si],al
        inc si
        mov al,numero1[1]
        mov cadena[si],al
        inc si
        jmp desplazarnum
    desplazarnum:
        mov al,cadena[si+3]
        ; imprimir salto por medio de interrupcion

        mov cadena[si],al
        inc si
        cmp si,di
        jne desplazarnum
        mov al,36
        mov cadena[si],al
        mov si,0
        mov di,0
       ; print cadena
        jmp longitud
    
    fin:
endm   


;Crear diseño carro 1

;Crear diseño carro 1
crearDiseno1 macro Color,diseno,posicionCarroX,posicionCarroY,posicionCarroX_Temp,posicionCarroY_Temp,pagina,cicloDuracion,columna,fila
    LOCAL dibujo,d3filaIntermedi,d3filaIntermedi1,d3filaIntermedi2,d3filaIntermedi3,restardato,fila1,fila2,fila3,fila4,fila5,fila6,filaIntermedia,fin,filaIntermedia2,filaIntermedia3,d2f1,d2fila2,d2fila3,d2fila4,d2fila5,d2fila6,d2filaIntermedia,d2filaIntermedia2,d2filaIntermedia3,d3f1,d3fila2,d3fila3,d3fila4,d3fila5,d3fila6,d3filaIntermedia,d3filaIntermedia2,d3filaIntermedia3
    xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx


    ;Extraemos la posicion iniciar a dibujar
    mov ax, posicionCarroX
    mov bx, posicionCarroY
    mov cx, 3 ;Limite de ruedas

    ;Va a iniciar a dibujar en la posicionCarroX y posicionCarroY
    dibujo:
            ;Por si necesito colocar valores extra
            ;cmp Orientacion,0
            ;jne restardato
            cmp diseno,2
            je d2f1
            cmp diseno,3
            je d3f1

            jmp fila1
    restardato:
            ;Extraemos valores de nuevo
            sub posicionCarroX,8
            mov ax, posicionCarroX
            jmp fila1

    fila1:
            mov Color,0
            ;Primer pixel rueda
            add ax,3
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Interrupcion
            ;interrunpirCarro

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Segundo pixel rueda
            add ax,4
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Tercer pixel rueda
            add ax,5
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina


            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,8
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,9
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,10
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Continuamos a la fila2
            jmp fila2
            

    fila2:  
        ;Es lo mismo de arriba pero desplazamos el y a una posicion anterior
            ;Primer pixel rueda
            add ax,3
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Interrupcion
            ;interrunpirCarro

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Segundo pixel rueda
            add ax,4
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Tercer pixel rueda
            add ax,5
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina


            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,8
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,9
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,10
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

           
            

            ;Extraemos los valores originales
            mov ax, posicionCarroX
            
            ;Restamos uno para que inicie justo donde se necesita
            sub ax, 1

            ;Lo guardamos en los temporales
            mov posicionCarroX_Temp,ax
            mov bx, posicionCarroY
            sub bx,2
            mov posicionCarroY_Temp,bx

            ;Agregamos el largo del carro a cx
            mov cicloDuracion,13
            
            ;Saltamos a la proxima fila
            jmp fila3
    fila3:
            mov Color,10
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Interrupcion
            ;interrunpirCarro

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            je filaIntermedia

            ;Si no se cumple que siga iterando
            jmp fila3

    filaIntermedia:
            ;Extraemos los valores originales
            mov ax, posicionCarroX
            
            ;Restamos uno para que inicie justo donde se necesita
            sub ax, 1

            ;Lo guardamos en los temporales
            mov posicionCarroX_Temp,ax
            mov bx, posicionCarroY
            sub bx,3
            mov posicionCarroY_Temp,bx

            ;Agregamos el largo del carro a cx
            mov cicloDuracion,13
            
            ;Saltamos a la proxima fila
            jmp fila4
            

    fila4:  ;Ejecutamos parecido a fila 3 solo que una posicion menos en y
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Interrupcion
            ;interrunpirCarro

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            je filaIntermedia2

            ;Si no se cumple que siga iterando
            jmp fila4
                  
    filaIntermedia2:
            ;Extraemos los valores originales
            mov ax, posicionCarroX
            
            ;Le agregamos 2 para que se desplaze 2 posiciones a la derecha y poder dibujar el techo
            add ax, 2

            ;Lo guardamos en los temporales
            mov posicionCarroX_Temp,ax
            mov bx, posicionCarroY
            sub bx,4
            mov posicionCarroY_Temp,bx

            ;Agregamos el largo del techo
            mov cicloDuracion,6
            
            ;Saltamos a la proxima fila
            jmp fila5


    fila5:  ;Ejecutamos parecido a fila 4 para el techo solo que dos posiciones menos en y
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Interrupcion
            ;interrunpirCarro

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            je filaIntermedia3

            ;Si no se cumple que siga iterando
            jmp fila5
    
    filaIntermedia3:
            ;Extraemos los valores originales
            mov ax, posicionCarroX
            
            ;Le agregamos 2 para que se desplaze 2 posiciones a la derecha y poder dibujar el techo
            add ax, 2

            ;Lo guardamos en los temporales
            mov posicionCarroX_Temp,ax
            mov bx, posicionCarroY
            sub bx,5
            mov posicionCarroY_Temp,bx

            ;Agregamos el largo del techo
            mov cicloDuracion,6
            
            ;Saltamos a la proxima fila
            jmp fila6


    fila6:  ;Ejecutamos parecido a fila 5 para el techo solo que una posiciones menos en y
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            je fin

            ;Si no se cumple que siga iterando
            jmp fila6


    d2f1:
            mov Color,0
            ;Primer pixel rueda
            add ax,3
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Interrupcion
            ;interrunpirCarro

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Segundo pixel rueda
            add ax,4
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Tercer pixel rueda
            add ax,5
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina


            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,8
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,9
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,10
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Continuamos a la fila2
            jmp d2fila2
            

    d2fila2:  
        ;Es lo mismo de arriba pero desplazamos el y a una posicion anterior
            ;Primer pixel rueda
            add ax,3
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Interrupcion
            ;interrunpirCarro

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Segundo pixel rueda
            add ax,4
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Tercer pixel rueda
            add ax,5
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina


            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,8
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,9
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,10
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

           
            

            ;Extraemos los valores originales
            mov ax, posicionCarroX
            
            ;Restamos uno para que inicie justo donde se necesita
            sub ax, 1

            ;Lo guardamos en los temporales
            mov posicionCarroX_Temp,ax
            mov bx, posicionCarroY
            sub bx,2
            mov posicionCarroY_Temp,bx

            ;Agregamos el largo del carro a cx
            mov cicloDuracion,13
            
            ;Saltamos a la proxima fila
            jmp d2fila3
    d2fila3:
            mov Color,11
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Interrupcion
            ;interrunpirCarro

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            je d2filaIntermedia

            ;Si no se cumple que siga iterando
            jmp d2fila3

    d2filaIntermedia:
            ;Extraemos los valores originales
            mov ax, posicionCarroX
            
            ;Restamos uno para que inicie justo donde se necesita
            sub ax, 1

            ;Lo guardamos en los temporales
            mov posicionCarroX_Temp,ax
            mov bx, posicionCarroY
            sub bx,3
            mov posicionCarroY_Temp,bx

            ;Agregamos el largo del carro a cx
            mov cicloDuracion,13
            
            ;Saltamos a la proxima fila
            jmp d2fila4
            

    d2fila4:  ;Ejecutamos parecido a fila 3 solo que una posicion menos en y
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Interrupcion
            ;interrunpirCarro

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            je d2filaIntermedia2

            ;Si no se cumple que siga iterando
            jmp d2fila4
                  
    d2filaIntermedia2:
            ;Extraemos los valores originales
            mov ax, posicionCarroX
            
            ;Restamos uno para que inicie justo donde se necesita
            sub ax, 1

            ;Lo guardamos en los temporales
            mov posicionCarroX_Temp,ax
            mov bx, posicionCarroY
            sub bx,4
            mov posicionCarroY_Temp,bx

            ;Agregamos el largo del techo
            mov cicloDuracion,10
            
            ;Saltamos a la proxima fila
            jmp d2fila5
            

    d2fila5:  ;Ejecutamos parecido a fila 4 para el techo solo que dos posiciones menos en y
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Interrupcion
            ;interrunpirCarro

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            je d2filaIntermedia3

            ;Si no se cumple que siga iterando
            jmp d2fila5
    
    d2filaIntermedia3:
            ;Extraemos los valores originales
            mov ax, posicionCarroX
            
            ;Restamos uno para que inicie justo donde se necesita
            sub ax, 1

            ;Lo guardamos en los temporales
            mov posicionCarroX_Temp,ax
            mov bx, posicionCarroY
            sub bx,5
            mov posicionCarroY_Temp,bx

            ;Agregamos el largo del techo
            mov cicloDuracion,10
            
            ;Saltamos a la proxima fila
            jmp d2fila6


    d2fila6:  ;Ejecutamos parecido a fila 5 para el techo solo que una posiciones menos en y
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            je fin

            ;Si no se cumple que siga iterando
            jmp d2fila6

    d3f1:
            mov Color,0
            ;Primer pixel rueda
            add ax,2
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Interrupcion
            ;interrunpirCarro

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Segundo pixel rueda
            add ax,3
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Tercer pixel rueda
            add ax,4
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina


            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,8
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,9
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,10
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

        
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,13
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,14
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,15
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY
            ;Continuamos a la fila2
            jmp d3fila2
            

    d3fila2:  
        ;Es lo mismo de arriba pero desplazamos el y a una posicion anterior
            ;Primer pixel rueda
            add ax,2
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Interrupcion
            ;interrunpirCarro

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Segundo pixel rueda
            add ax,3
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Tercer pixel rueda
            add ax,4
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina


            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,8
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,9
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,10
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

             ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,13
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina
              ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,14
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina
              ;Extraemos valores de nuevo
            mov ax, posicionCarroX
            mov bx, posicionCarroY

            ;Cuarto pixel rueda
            add ax,15
            mov posicionCarroX_Temp,ax
            sub bx,1
            mov posicionCarroY_Temp,bx
            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            

            ;Extraemos los valores originales
            mov ax, posicionCarroX
            
            ;Restamos uno para que inicie justo donde se necesita
            sub ax, 1

            ;Lo guardamos en los temporales
            mov posicionCarroX_Temp,ax
            mov bx, posicionCarroY
            sub bx,2
            mov posicionCarroY_Temp,bx

            ;Agregamos el largo del carro a cx
            mov cicloDuracion,12
            
            ;Saltamos a la proxima fila
            jmp d3fila3
    d3fila3:
            mov Color,15
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Interrupcion
            ;interrunpirCarro

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            je d3filaIntermedi

            ;Si no se cumple que siga iterando
            jmp d3fila3
    d3filaIntermedi:
        mov Color,12
        mov cicloDuracion,7
        jmp d3filaIntermedia
    d3filaIntermedia:
            
            
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Interrupcion
            ;interrunpirCarro

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            jne d3filaIntermedia
            mov Color,15
            ;Extraemos los valores originales
            mov ax, posicionCarroX
            
            ;Restamos uno para que inicie justo donde se necesita
            sub ax, 1

            ;Lo guardamos en los temporales
            mov posicionCarroX_Temp,ax
            mov bx, posicionCarroY
            sub bx,3
            mov posicionCarroY_Temp,bx

            ;Agregamos el largo del carro a cx
            mov cicloDuracion,12
            
            ;Saltamos a la proxima fila
            jmp d3fila4
            

    d3fila4:  ;Ejecutamos parecido a fila 3 solo que una posicion menos en y
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Interrupcion
            ;interrunpirCarro

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            je d3filaIntermedi1

            ;Si no se cumple que siga iterando
            jmp d3fila4
    d3filaIntermedi1:
        mov Color,12
        mov cicloDuracion,7
        jmp d3filaIntermedia2              
    d3filaIntermedia2:
            
            
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Interrupcion
            ;interrunpirCarro

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            jne d3filaIntermedia2
            mov Color,15

            ;Extraemos los valores originales
            mov ax, posicionCarroX
            
            sub ax, 1

            ;Lo guardamos en los temporales
            mov posicionCarroX_Temp,ax
            mov bx, posicionCarroY
            sub bx,4
            mov posicionCarroY_Temp,bx

            ;Agregamos el largo del techo
            mov cicloDuracion,12
            
            ;Saltamos a la proxima fila
            jmp d3fila5


    d3fila5:  ;Ejecutamos parecido a fila 4 para el techo solo que dos posiciones menos en y
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Interrupcion
            ;interrunpirCarro

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            je d3filaIntermedi2

            ;Si no se cumple que siga iterando
            jmp d3fila5
    d3filaIntermedi2:
        mov Color,12
        mov cicloDuracion,5
        jmp d3filaIntermedia3              
    d3filaIntermedia3:
            
            
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Interrupcion
            ;interrunpirCarro

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            jne d3filaIntermedia3
            mov Color,15
            ;Extraemos los valores originales
            mov ax, posicionCarroX
            
            sub ax, 1

            ;Lo guardamos en los temporales
            mov posicionCarroX_Temp,ax
            mov bx, posicionCarroY
            sub bx,5
            mov posicionCarroY_Temp,bx

            ;Agregamos el largo del techo
            mov cicloDuracion,12
            
            ;Saltamos a la proxima fila
            jmp d3fila6


    d3fila6:  ;Ejecutamos parecido a fila 5 para el techo solo que una posiciones menos en y
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina

            ;Restamos 1 al ciclo
            mov ax, cicloDuracion
            sub ax, 1
            mov cicloDuracion,ax

            ;Extraemos el valor a comparar
            mov cx, cicloDuracion

            ;Hasta que se cumpla el largo sigue iterando
            cmp cx,0
            je d3filaIntermedi3

            ;Si no se cumple que siga iterando
            jmp d3fila6

    d3filaIntermedi3:
            mov Color,12
            ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina 
             ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina
             ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Interrupcion
            ;interrunpirCarro

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina
             ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Interrupcion
            ;interrunpirCarro

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina
             ;Extraemos valores de nuevo
            mov ax, posicionCarroX_Temp
            mov bx, posicionCarroY_Temp

            ;Se dibuja la carroceria
            add ax,1
            mov posicionCarroX_Temp,ax
            mov posicionCarroY_Temp,bx

            ;Interrupcion
            ;interrunpirCarro

            ;Dibujamos
            graficarPixel Color,posicionCarroX_Temp,posicionCarroY_Temp,pagina
            jmp fin


    fin: 
        
        ;Interrupcion para realizar distintas acciones
        interrunpirCarro pagina,columna,fila

    
	

endm

graficarPixel macro colorpix,pixelX,pixelY,pagina
            xor ax,ax
            xor bx,bx
            xor cx,cx
            xor dx,dx

            ;Empezamos a graficar
			mov ah, 0ch              ;Indicar que se imprimira un pixel
			mov dx, pixelY           ;DX coordenada en Y
			mov cx, pixelX           ;CX coordenada en X
			mov bh, pagina           ;BH la pagina a imprimir
			mov al, colorpix               ;Color que queremos colocar
			int 10h
endm

interrunpirCarro macro pagina,columna,fila
    LOCAL input_loop,fin

           
		
            ;Colocamos el cursor donde no se mire
            mov fila,50
            mov columna,50
            
            CALL colocarCursor
           
            ;Aqui podemos hacer validaciones extra

            ;Primero validamos si se presiono algo
            mov ah,1  ;se guarda en al en código hexadecimal del caracter leído 
            int 16h

            ;Si no se presiono que siga
            jz fin

            ;Si se presiono interrumpimos
            mov ah, 0
            int 16h

            ;1,2,3,4,5 para salir
			cmp al,48
			je menus
			cmp al,49
			je menus
			cmp al,50
			je menus
			cmp al,51
			je menus
			cmp al,52
			je menus

    fin:

endm


limpiezaCarriles macro orientacion,posicionCarrilesX,posicionCarrilesY,inicialY,posicionCarroXA,posicionCarroYA,pagina
	LOCAL inicializar0,limpieza,inicio, limpieza1,fin 
    ;Limpiamos por donde pasa el carro generando de nuevo el carril
    ;Limpiamos los registros
    xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx
    ;Posicion donde inicia a limpiar los carriles
    inicio:
    
        mov ax, orientacion     
        mov posicionCarrilesX, ax
        xor ax,ax
        mov ax, posicionCarroYA
        add ax, 1
        mov posicionCarrilesY, ax

        cmp orientacion,0
        je inicializar0

        ;Comparamos el movimiento
        cmp posicionCarroXA, 0
        jne limpieza1

        ;Desplazamos la coordenada de x + 1, para que dibuje justo en la proxima coordenada 
        mov posicionCarroXA, 320
        mov ax,inicialY
        mov posicionCarroYA,ax
        jmp limpieza1

    inicializar0:
        
        ;Comparamos el movimiento
        cmp posicionCarroXA, 310
        jbe limpieza

        ;Desplazamos la coordenada de x + 1, para que dibuje justo en la proxima coordenada
        mov posicionCarroXA,0
        mov ax,inicialY
        mov posicionCarroYA,ax
        jmp limpieza

    limpieza:
	        ;Limpiamos por donde pasa el carro generando de nuevo el carril
			;Limpiamos los registros
			xor ax,ax
			xor bx,bx
			xor cx,cx
			xor dx,dx
			;Posicion donde inicia a limpiar los carriles
	        
			
			;Empezamos a graficar
			mov ah, 0ch                ;Indicar que se imprimira un pixel
			mov dx, posicionCarrilesY  ;DX coordenada en Y
			mov cx, posicionCarrilesX  ;CX coordenada en X
			mov bh, pagina             ;BH la pagina a imprimir
			mov al, 8                  ;Color que queremos colocar
			int 10h

            ;Aumentamos la posicionCarrilesY
			xor ax,ax
			mov ax, posicionCarrilesY
			add ax, 1
			mov posicionCarrilesY, ax

            ;Comparamos el maximo de la fila
			mov ax, posicionCarroYA
			add ax, 1

            ;Mientras estemos dentro de < = a 7 imprimimos la fila, es el tamaño del carril
			cmp posicionCarrilesY, ax
			jb limpieza            ;Si es menor o igual salta

			;Como se sobre paso reiniciamos la posicionCarrilesY y aumentamos la posicionCarrilesX
			xor ax,ax 
			mov ax, posicionCarroYA
			sub ax, 6
			mov posicionCarrilesY, ax
			mov ax, posicionCarrilesX
			add ax, 1
			mov posicionCarrilesX, ax

			;Verificamos que hayamos terminado las columnas
			;Mientras estemos dentro de < = a 320 seguimos analizando
			cmp posicionCarrilesX, 320
			jbe limpieza          ;Si es menor o igual salta

            jmp fin
    limpieza1:
	        ;Limpiamos por donde pasa el carro generando de nuevo el carril
			;Limpiamos los registros
			xor ax,ax
			xor bx,bx
			xor cx,cx
			xor dx,dx
			;Posicion donde inicia a limpiar los carriles
	        
			
			;Empezamos a graficar
			mov ah, 0ch                ;Indicar que se imprimira un pixel
			mov dx, posicionCarrilesY  ;DX coordenada en Y
			mov cx, posicionCarrilesX  ;CX coordenada en X
			mov bh, pagina             ;BH la pagina a imprimir
			mov al, 8                  ;Color que queremos colocar
			int 10h

            ;Aumentamos la posicionCarrilesY
			xor ax,ax
			mov ax, posicionCarrilesY
			add ax, 1
			mov posicionCarrilesY, ax

            ;Comparamos el maximo de la fila
			mov ax, posicionCarroYA
			add ax, 1

            ;Mientras estemos dentro de < = a 7 imprimimos la fila, es el tamaño del carril
			cmp posicionCarrilesY, ax
			jb limpieza1            ;Si es menor o igual salta

			;Como se sobre paso reiniciamos la posicionCarrilesY y aumentamos la posicionCarrilesX
			xor ax,ax 
			mov ax, posicionCarroYA
			sub ax, 6
			mov posicionCarrilesY, ax
			mov ax, posicionCarrilesX
			sub ax, 1
			mov posicionCarrilesX, ax

			;Verificamos que hayamos terminado las columnas
			;Mientras estemos dentro de > = a 0 seguimos analizando
			cmp posicionCarrilesX, 0
			jne limpieza1          ;Si es menor o igual salta

            jmp fin
    fin:
          
endm

movimientoCarril macro Orientacion,Carrox,Carroy,Velocidad,CarrilesX,CarrilesY
    LOCAL sentido1,sentido2,inicio,fin
    ;limpiar registros
    xor ax,ax
    xor bx,bx

    inicio:
        cmp Orientacion,0
        je sentido1
        cmp Orientacion,0
        jne sentido2
    
    sentido1:

        ;Desplazamos la coordenada de x + 1, para que dibuje justo en la proxima coordenada
        mov bx, Carrox
        add bx, Velocidad
        mov Carrox,bx

        ;Posicion donde inicia a limpiar los carriles
        mov ax,Orientacion
        mov CarrilesX, ax
        mov ax, Carroy
        add ax, Velocidad
        mov CarrilesY, ax
    
        jmp fin
    
    sentido2:
        ;Desplazamos la coordenada de x + 1, para que dibuje justo en la proxima coordenada
        mov bx, Carrox
        sub bx, Velocidad
        mov Carrox,bx

        ;Posicion donde inicia a limpiar los carriles
        mov ax,Orientacion
        mov CarrilesX, ax
        mov ax, Carroy
        sub ax, Velocidad
        mov CarrilesY, ax

        jmp fin
    
    fin:

endm