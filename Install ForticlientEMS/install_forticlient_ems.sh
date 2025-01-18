
echo "Bienvenido al instalador de ForticlientEMS"
echo "=== Recuerde ejecutar este instalador con sudo o permisos de root ==="

#Variables
ems_server= your.server.com

# Verificar si el sistema operativo
echo "Inicio instalacion Forticlient"
if [[ "$OSTYPE" == "linux-gnu" && -f /etc/lsb-release ]]; then
    . /etc/os-release
    if [ "$VERSION_CODENAME" == "focal" ]; then
        echo "Sistema operativo: Ubuntu 20.04"
        echo "Configurando repositorio..."
        # Comprueba si el archivo ya existe, si no lo crea
        if [ ! -f /etc/apt/sources.list.d/repo.fortinet.com.list ]; then
            sudo wget -O - https://repo.fortinet.com/repo/forticlient/7.2/ubuntu/DEB-GPG-KEY | sudo apt-key add -
            echo "# Repo Forticlient EMS" | sudo tee -a /etc/apt/sources.list
            echo "deb [arch=amd64] https://repo.fortinet.com/repo/forticlient/7.2/ubuntu/ /stable multiverse" | sudo tee -a /etc/apt/sources.list
        fi
        echo "Repositorio configurado, actualizando..."
        sudo apt-get update | tail -1
        echo "Instalando Forticlient..."
        sudo apt install -y forticlient
        forticlient epctrl register $ems_server
        #forticlient epctrl register _VjE6MTAuMS4xLjM0OjgwMTM6RGVmYXVsdDpBRkQwRjI1Mi01QTBFLTQyNkMtQTU3MS1CNzgwNzRCMEI1NTk=
    elif [ "$VERSION_CODENAME" == "jammy" ]; then
        echo "Sistema operativo: Ubuntu 22.04"
        echo "Configurando repositorio..."
        # Comprueba si el archivo ya existe, si no lo crea
        if [ ! -f /etc/apt/sources.list.d/repo.fortinet.com.list ]; then
            sudo wget -O - https://repo.fortinet.com/repo/forticlient/7.2/debian/DEB-GPG-KEY | gpg --dearmor | sudo tee /usr/share/keyrings/repo.fortinet.com.gpg
            sudo touch /etc/apt/sources.list.d/repo.fortinet.com.list
            echo "# Repo Forticlient EMS" | sudo tee -a /etc/apt/sources.list.d/repo.fortinet.com.list
            echo "deb [arch=amd64 signed-by=/usr/share/keyrings/repo.fortinet.com.gpg] https://repo.fortinet.com/repo/forticlient/7.2/debian/ stable non-free" | sudo tee -a /etc/apt/sources.list.d/repo.fortinet.com.list
        fi
        echo "Repositorio configurado, actualizando..."
        sudo apt-get update | tail -1
        echo "Instalando Forticlient..."
        sudo apt install -y forticlient
        forticlient epctrl register $ems_server
        #forticlient epctrl register _VjE6MTAuMS4xLjM0OjgwMTM6RGVmYXVsdDpBRkQwRjI1Mi01QTBFLTQyNkMtQTU3MS1CNzgwNzRCMEI1NTk=
    else
        echo "Versión de Ubuntu no compatible."
    fi
elif [[ "$OSTYPE" == "linux-gnu" && -f /etc/redhat-release ]]; then
    # Verificar si el sistema operativo es Rocky Linux
    if grep -qiE "rocky|oracle|Red Hat Enterprise Linux release 8" /etc/redhat-release; then
        echo "Sistema operativo: RHEL based (Rocky / Oracle)"
        echo "Configurando repositorio..."
        sudo dnf config-manager --add-repo https://repo.fortinet.com/repo/forticlient/7.2/centos/8/os/x86_64/fortinet.repo
        # Comprueba si el archivo ya existe, si no lo crea
        echo "Repositorio configurado, actualizando..."
        sudo dnf check-update -y
        echo "Instalando Forticlient..."
        sudo dnf install -y forticlient
        forticlient epctrl register $ems_server
    fi
else
    echo "Sistema operativo no reconocido."
fi
echo "Fin de instalacion"