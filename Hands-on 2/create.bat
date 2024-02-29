@echo off

rem Crear un archivo de texto plano llamado mytext.txt
echo Hola Mundo > mytext.txt

rem Desplegar/Imprimir en la terminal el contenido del archivo mytext.txt
type mytext.txt

rem Crear una subdirectorio (folder) llamado backup
md backup

rem Copiar el archivo mytext.txt al subdirectorio backup
copy mytext.txt backup

rem Listar el contenido del subdirectorio backup
dir backup

rem Eliminar el archivo mytext.txt del subdir backup
del backup\mytext.txt

rem Eliminar el subir backup
rd backup

rem (Opcional) Pausa para que el usuario vea el resultado
pause
