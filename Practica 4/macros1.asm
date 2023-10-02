
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
