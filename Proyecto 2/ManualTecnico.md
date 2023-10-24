
# Manual Técnico

## Introducción

En este manual, encontrarás una descripción completa sobre el codigo utilizado en el programa y la logica utilizada, asi como requisitos de  software.

## Requisitos del Sistema


En este proyecto se utilizo el lenguaje assembler, un lenguaje de bajo nivel. por lo tanto para poder ejecutar el sistema es necesario utilizar:
  
 - MASM611
 - DosBox
 - VsCode (como ide para visualizar el codigo en dado caso sea requerido)

## Estuctura del programa

-   **Segmento de pila**: Inicializa la pila


-   **Segmento de datos**: Inicializa el segmento de datos, se agregaron todas las variables que se usaron en el juego y sus respectivos tamaños y valores incialies.

![Alt text](image/i28.png)
![Alt text](image/i29.png) 
![Alt text](image/i30.png)
![Alt text](image/i31.png) 
![Alt text](image/i32.png)
![Alt text](image/i33.png) 
![Alt text](image/i34.png)
![Alt text](image/i35.png) 
![Alt text](image/i36.png)
![Alt text](image/i37.png)



- **Segmento de codigo**: Se inicializo el segmento de codigo y se creo el procedimeito main, se crearon distintas etiquetas en el programa para  ir  estructurando el flujo del programa.
![Alt text](image/i38.png)
![Alt text](image/i39.png) 
![Alt text](image/i40.png)
![Alt text](image/i41.png) 
![Alt text](image/i42.png)
![Alt text](image/i43.png) 
![Alt text](image/i44.png)
![Alt text](image/i45.png) 
![Alt text](image/i46.png)

## Macros usadas

- **print**: imprime el valor de una variable que se encuentra definida en el segmento de datos y lo imprime en consola.
- **close**: se encarga de terminar la ejecucion del programa.
- **getChar**: obtiene un caracter que haya sido ingresado.
![Alt text](image/img47.png)
- **ObtenerTexto**: Obtiene una cadena de caracteres que haya sido ingresado. se detendra al encontrar un salto de linea.
![Alt text](image/img48.png)
- **clear**: Limpia la pantalla/consola, para hacer esto lo que se hace es escribir varios saltos de linea de forma consecutiva.
![Alt text](image/img49.png)
- **concatenarCadena**: este se encarga de concatenar dos variables con dos cadenas distintas.
![Alt text](image/img50.png)
- **delay**: hace que el programa se detenga por un periodo de tiempo.
![Alt text](image/img51.png)


- **limpiar** este limpia una variable que tenga un espacio grande asignado.
- **cerrar**: esta macro cerraria el archivo.
- **abrir**: con esto se abre un archivo.
- **escribir**: esta macro nos ayuda a escribir un texto en un archivo existente,
- **crear**: aqui se crea un archivo en blanco con el nombre especificado.
![Alt text](image/img55.png)
- **leer**: con esto se lee un archivo y se concatena cada uno de sus caracteres en una variable que se usa dentro del main.
![Alt text](image/img56.png)


- **crearDiseno1**: esta macro nos ayuda a crear los diseños de los autos en el juego.
- **graficarpixel**: esta macro nos ayuda a graficar un pixel en la pantalla.
- **interrumpirCarro**: esta macro proporciona las interrupciones para el movimiento de los carros a manera que al presionar una tecla se genere cierta accion.

- **limpiezaCarriles**: borra los carros que se encuentran en los carriles a manera de generar otro carro en el carril despues.
- **movimientoCarril**: esta macro nos ayuda a mover los carros en los  carriles con distintas velocidades.

![Alt text](image/i25.png) 
![Alt text](image/i26.png)
![Alt text](image/i27.png) 





