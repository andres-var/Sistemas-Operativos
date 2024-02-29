#!/bin/bash

function mostrar_menu() {
  echo "**Menú de servicios:**"
  echo "1. Listar contenido de un archivo"
  echo "2. Crear archivo de texto"
  echo "3. Comparar dos archivos de texto"
  echo "4. Mostrar uso del comando awk"
  echo "5. Mostrar uso del comando grep"
  echo "6. Salir"
  echo ""
  echo -n "Seleccione una opción (1-6): "
}

function listar_archivo() {
  echo -n "Introduzca la ruta del archivo: "
  read ruta_archivo
  if [ -f $ruta_archivo ]; then
    echo "**Contenido del archivo $ruta_archivo:**"
    cat $ruta_archivo
  else
    echo "El archivo $ruta_archivo no existe."
  fi
}

function crear_archivo() {
  echo -n "Introduzca la cadena de texto a almacenar: "
  read cadena_texto
  echo -n "Introduzca el nombre del archivo a crear: "
  read nombre_archivo
  echo "$cadena_texto" > $nombre_archivo
  echo "Archivo $nombre_archivo creado con éxito."
}

function comparar_archivos() {
  echo -n "Introduzca la ruta del primer archivo: "
  read ruta_archivo1
  echo -n "Introduzca la ruta del segundo archivo: "
  read ruta_archivo2
  if [ -f $ruta_archivo1 ] && [ -f $ruta_archivo2 ]; then
    diff $ruta_archivo1 $ruta_archivo2
  else
    echo "Uno o ambos archivos no existen."
  fi
}

function mostrar_uso_awk() {
  echo "**Uso del comando awk:**"
  echo "awk [opciones] 'programa' archivo"
  echo ""
  echo "Opciones comunes:"
  echo "-F separador: define el separador de campos"
  echo "-v variable=valor: define una variable para usar en el programa"
  echo ""
  echo "Ejemplos:"
  echo "awk '{print $1}' archivo.txt: imprime la primera columna del archivo"
  echo "awk -F, '{print $2, $3}' archivo.csv: imprime la segunda y tercera columna del archivo csv"
}

function mostrar_uso_grep() {
  echo "**Uso del comando grep:**"
  echo "grep [opciones] 'expresión regular' archivo"
  echo ""
  echo "Opciones comunes:"
  echo "-i: ignora las mayúsculas y minúsculas"
  echo "-n: muestra el número de línea donde se encuentra la coincidencia"
  echo "-c: solo muestra el número de coincidencias"
  echo ""
  echo "Ejemplos:"
  echo "grep 'error' archivo.log: busca la palabra 'error' en el archivo log"
  echo "grep -i 'usuario' archivo.txt: busca la palabra 'usuario' ignorando mayúsculas y minúsculas"
  echo "grep -n '^Inicio' archivo.txt: busca la línea que comienza con la palabra 'Inicio'"
}

while true; do
  mostrar_menu
  read opcion
  case $opcion in
    1) listar_archivo ;;
    2) crear_archivo ;;
    3) comparar_archivos ;;
    4) mostrar_uso_awk ;;
    5) mostrar_uso_grep ;;
    6) exit 0 ;;
    *) echo "Opción no válida." ;;
  esac
done
