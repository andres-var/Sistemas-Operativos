#!/bin/bash

# Función para mostrar ayuda
function mostrar_ayuda() {
  echo "Este script automatiza la creación y configuración de una Máquina Virtual en VirtualBox."
  echo ""
  echo "Uso: $0 <nombre_vm> <tipo_os> <num_cpus> <memoria_ram> <memoria_vram> <disco_duro> <nombre_controlador_sata> <nombre_controlador_ide>"
  echo ""
  echo "Argumentos:"
  echo "  - nombre_vm: Nombre de la máquina virtual."
  echo "  - tipo_os: Tipo de sistema operativo (Linux)."
  echo "  - num_cpus: Número de CPUs."
  echo "  - memoria_ram: Tamaño de la memoria RAM (GB)."
  echo "  - memoria_vram: Tamaño de la memoria VRAM (MB)."
  echo "  - disco_duro: Tamaño del disco duro virtual (GB)."
  echo "  - nombre_controlador_sata: Nombre del controlador SATA."
  echo "  - nombre_controlador_ide: Nombre del controlador IDE."
  echo ""
  echo "Ejemplo: $0 mi_vm Linux 2 4096 128 20 sata0 ide0"
}

# Validar argumentos
if [ $# -ne 8 ]; then
  mostrar_ayuda
  exit 1
fi

# Variables
nombre_vm="$1"
tipo_os="$2"
num_cpus="$3"
memoria_ram="$4"
memoria_vram="$5"
disco_duro="$6"
nombre_controlador_sata="$7"
nombre_controlador_ide="$8"

# Crear máquina virtual
VBoxManage createvm --name "$nombre_vm" --ostype "$tipo_os" --register

# Configurar CPUs
VBoxManage modifyvm "$nombre_vm" --cpucount "$num_cpus"

# Configurar memoria RAM
VBoxManage modifyvm "$nombre_vm" --memory "$memoria_ram"

# Configurar memoria VRAM
VBoxManage modifyvm "$nombre_vm" --vram "$memoria_vram"

# Crear disco duro virtual
VBoxManage createhd --filename "$nombre_vm.vdi" --size "$disco_duro" --format VDI

# Crear controlador SATA
VBoxManage storagectl "$nombre_vm" --name "$nombre_controlador_sata" --add sata

# Asociar disco duro virtual al controlador SATA
VBoxManage storageattach "$nombre_vm" --storagectl "$nombre_controlador_sata" --port 0 --device 0 --type hdd --medium "$nombre_vm.vdi"

# Crear controlador IDE
VBoxManage storagectl "$nombre_vm" --name "$nombre_controlador_ide" --add ide

# Mostrar información de la máquina virtual
echo "**Información de la máquina virtual:**"
echo "Nombre: $nombre_vm"
echo "Sistema operativo: $tipo_os"
echo "CPUs: $num_cpus"
echo "Memoria RAM: $memoria_ram GB"
echo "Memoria VRAM: $memoria_vram MB"
echo "Disco duro: $disco_duro GB"
echo "Controlador SATA: $nombre_controlador_sata"
echo "Controlador IDE: $nombre_controlador_ide"

# Finalizar
echo "**Máquina virtual $nombre_vm creada y configurada correctamente.**"
