
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
 ![Alt text](image/img20.png)

-   **Segmento de datos**: Inicializa el segmento de datos, se agregaron todas las variables que se usaron en el juego y sus respectivos tamaños y valores incialies.
![Alt text](image/img21.png)
![Alt text](image/img22.png)
![Alt text](image/img23.png)
![Alt text](image/img24.png)
![Alt text](image/img25.png)
![Alt text](image/img26.png)
![Alt text](image/img27.png)
![Alt text](image/img28.png)
![Alt text](image/img29.png)
- **Segmento de codigo**: Se inicializo el segmento de codigo y se creo el procedimeito main, se crearon distintas etiquetas en el programa para  ir  estructurando el flujo del programa.


![Alt text](image/img30.png)
![Alt text](image/img31.png)
![Alt text](image/img32.png)
![Alt text](image/img33.png)
![Alt text](image/img34.png)
![Alt text](image/img35.png)
![Alt text](image/img36.png)
![Alt text](image/img37.png)
![Alt text](image/img38.png)
![Alt text](image/img39.png)
![Alt text](image/img40.png)
![Alt text](image/img41.png)
![Alt text](image/img42.png)
![Alt text](image/img43.png)
![Alt text](image/img44.png)
![Alt text](image/img45.png)
![Alt text](image/img46.png)
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

- **generarrandom**: este codigo genera un numero random de 0 a 6 y luego busca este indice dentro de una cadena de texto  y tomara el caracter en ese indice.
![Alt text](image/img52.png)
![Alt text](image/img53.png)
- **Obtenernombre**: de manera similar al de obtener texto obtiene una cadena de caracteres y se detendra hasta encontrar un salto de linea, pero tambien se detendra si se encuentra un " . " en este ultimo caso se enviara un mensaje de error.
![Alt text](image/img54.png)
- **limpiar** este limpia una variable que tenga un espacio grande asignado.
- **cerrar**: esta macro cerraria el archivo.
- **abrir**: con esto se abre un archivo.
- **escribir**: esta macro nos ayuda a escribir un texto en un archivo existente,
- **crear**: aqui se crea un archivo en blanco con el nombre especificado.
![Alt text](image/img55.png)
- **leer**: con esto se lee un archivo y se concatena cada uno de sus caracteres en una variable que se usa dentro del main.
![Alt text](image/img56.png)
- **imprimirceldas**: esta funcion se encarga de imprimir las celdas del tablero con los espacios y simbolos de los bordes que le corresponden.
- **verificar_ganador**: esta macro compara si las 4 celdas consecutivas enviadas son iguales al simbolo del jugador 1 o del jugador dos.
- **columnavacia**: aqui se comprueba si cada celda de la columna esta vacia, si lo esta escribe alli el simbolo del jugador, si no lo esta revisa la siguiente y si ninguna celda esta vacia se envia al mensaje de error.

![Alt text](image/img57.png)














