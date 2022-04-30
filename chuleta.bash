#!/bin/bash

#Execute first command "source chuleta.bash" to use this functions at terminal. 

#Colors
RESTORE=$(echo -en '\033[0m')
RED=$(echo -en '\033[00;31m')
GREEN=$(echo -en '\033[00;32m')
YELLOW=$(echo -en '\033[00;33m')
BLUE=$(echo -en '\033[00;34m')
MAGENTA=$(echo -en '\033[00;35m')
PURPLE=$(echo -en '\033[00;35m')
CYAN=$(echo -en '\033[00;36m')
LIGHTGRAY=$(echo -en '\033[00;37m')
LRED=$(echo -en '\033[01;31m')
LGREEN=$(echo -en '\033[01;32m')
LYELLOW=$(echo -en '\033[01;33m')
LBLUE=$(echo -en '\033[01;34m')
LMAGENTA=$(echo -en '\033[01;35m')
LPURPLE=$(echo -en '\033[01;35m')
LCYAN=$(echo -en '\033[01;36m')
WHITE=$(echo -en '\033[01;37m')

# Start
chuleta(){	
	myvar="chuleta"$1;
	${myvar}
}

#Chuletas

chuletadyndns(){
	echo -e "$RED 
	Chuletas para configurar el dyndns con OVH
		
	$GREEN Forzar la renovación de la IP desde el cliente
	$RESTORE -> sudo ddclient -force
	"	
}

chuletadiscos(){
		echo -e "$RED 
	Chuletas para discos duros y particiones
		
	$GREEN Listar los discos duros y particiones
	$RESTORE ->  fdisk -l

	$GREEN Cambiar con hdparm el tiempo de apagado de los discos duros
	$RESTORE ->  sudo hdparm -S 255 /dev/sdx
	$LBLUE -> Donde sdx es el disco y 255 es el tiempo al que se
	multiplicará por 5 en segundos. Ojo, la S es mayúscula 
	[Set standby (spindown) timeout]
	"
}

chuletagit(){	
	echo -e "$RED 
	Chuletas para git
		
	$GREEN Iniciando git
	$RESTORE -> git init

	$GREEN Configurando git
	$RESTORE -> git config --global user.name username
	git config --global user.email email@example.
	$GREEN Si queremos ver la configuración hacemos:
	$RESTORE -> git config --list

	$GREEN Ver estado de repositorio
	$RESTORE -> git status y git status -s para mejor visualización

	$GREEN Añadir archivos a la staging area
	$RESTORE -> git add -A

	$GREEN Commiterar unos cambios
	$RESTORE -> git commit -m 'nombre del commit'

	$GREEN Revisar el log
	$RESTORE -> git log --oneline
	$GREEN Revisar el log con ammends y commits anteriores al ammend.
	Los commits no se borran, quedan ocultos tras otro commit.
	$RESTORE -> git reflog

	$GREEN Crear tags
	$RESTORE -> git tag minuevotag -m 'version proyecto'
	$GREEN Subir tags al repo online
	$RESTORE -> git push --tags




	$GREEN Clonar un repo
	$RESTORE -> git clone  https://github.com/geekslada/proyecto.git
	$LBLUE*** También es posible realizarlo con SSH para lo cual tienes que tener
	la clave pública de tu servidor en la web de git. 

	$GREEN Ver la diferencia de cambios entre dos repositorios
	$RESTORE -> git diff
	$RESTORE -> git diff hashid1 hashid2


	$GREEN Subir nuestro repositorio a la web
	$RESTORE -> git push -u origin master
	$LBLUE -> El -u es para linkear nuestra rama master con la que está en el repo de
	esta manera no será necesario hacer todo el comando cada vez, solo $RESTORE git push
		$GREEN Si hemos empezado un repo desde 0
			$GREEN Primero tenemos que añadir el origen
			$RESTORE -> git remote add origin https:/github.com/geekscalada/proyecto.git
			(ten en cuenta que deberás crearlo en la web primero)
			$GREEN Cambiamos el nombre a la rama principal a nuestro gusto
			$RESTORE -> git branch -M 
			$GREEN Hacemos el push
			$RESTORE -> git push -u origin master

	$GREEN Usando ramas
		$GREEN Creamos una nueva rama
		$RESTORE -> git branch minuevarama
		$GREEN Nos cambiamos a la rama
		$RESTORE -> git checkout minuevarama
		$GREEN Cuando estemos listos para hacer un push, tenemos que indicar
		el origin, de lo contrario, fallará:
		$RESTORE -> push origin minuevarama
		$GREEN Si queremos ver las ramas mergeadas
		$RESTORE -> git branch --merged
		$GREEN Una vez queremos hacer el merge, primero vamos a la rama donde 
		queremos mergear:
		$RESTORE -> git checkout master
		$GREEN Hacemos merge:
		$RESTORE -> git merge minuevarama
		$LBLUE Ver todas las ramas:
		$RESTORE -> git branch -a
		$GREEN Puede ser buena práctica borrar las ramas que ya no vamos a usar
		en la web:
		$RESTORE -> git push origin --delete minuevafeature
		$GREEN En nuestra máquina seguirá estando, lo podemos borrar
		así, aunque ocupa poco y es mejor dejarlo:
		$RESTORE git branch -d minuevafeature






	$GREEN Borrar archivos que estaban siendo seguidos y que aunque metamos en 
	el gitignore, no salen y dan fallos
	$RESTORE -> git rm --cached archivo.js 

	$GREEN Descargar las últimas versiones de un repo (pulls)
	$RESTORE -> git pull origin master
	$GREEN Es probable que tengamos que hacer primero:
	$RESTORE -> git remote add origin

	$LBLUE Uso avanzado de git:
	$RED ¿Cómo se resetea un archivo que aún no hemos añadido al SA?
	$RESTORE -> git checkout nombrearchivo

	$RED Añadir cosas a un commit cuando no lo hemos terminado de hacer bien
	$RESTORE -> git commit --amend
	$LBLUE -> Esto añadiría los archivos que falten, y además nos permite 
	modificar el mensaje.

	$RED Mover los commits de una branch a otra, porque por ejemplo,
	los hemos hecho en una rama equivocada
	$RESTORE 1. Copiamos el hash del commit
	2. Hacemos checkout a la branch que queramos hacer la copia
	3. git cherry-pick hashid
	4. Lo tendríamos copiado, pero no movido, por lo que hay que eliminarlo
	5. git checkout master
	6. hacemos git reset --soft hashid. Cuidado porque estos cambios estarán
	en nuestro SA. 

	$RED Git reset sin flags
	$RESTORE Los cambios los deja en el Working Directory

	$RED git reset --hard hashid
	$RESTORE Va a dejar nuestro WD totalmente limpio. Es decir que esos cambios de los commit se perderán totalmente porque no estarán ni siquiera en el sistema de archivos.
	Aunque no es del todo cierto, en git queda como un registro, pero hay un garbage collector que borra esto cada 30 días, lo que es mucho tiempo. 

	$RED resetear un archivo no comiteado ni stageado
	$RESTORE -> git checkout --archivo.html
	$RED resetear un archivo no comiteado pero si stageado
	$RESTORE -> git reset En este caso podemos hacer un git reset.
	Si hacemos un git reset HEAD, con head lo que hacemos es referenciar al 
	último commit de la rama en la que estoy.Git nos dirá que a unstageado 
	el cambio, pero en nuestro entorno local WD seguirá estando el archivo 
	modificado, si queremos traer el original, de nuevo hacemos 
	un git checkout -- archivo.html

	$YELLOW -> Hay algunos apuntes más sobre situaciones de reset que podría 
	mejorar aquí. 

	"
}

chuletaguiones(){
echo -e "$RED 
¿ Qué significa >> y similares ?
	
$GREEN Para añadir a un archivo la salida de un comando:
$RESTORE -> >> miarchivo.yaml

"
}

chuletassl(){
	echo -e "
	
	$GREEN Visualizar los días de expiración que quedan a nuestro certificado letsencrypt
	$RESTORE -> echo | openssl s_client -servername www.yourdomain.com -connect yourdomain:443 | openssl x509 -noout -dates
	$RED Cuidado porque los datos tardarán en acutalizarse una vez renovado

	$GREEN Comando docker-compose para renovar el certificado
	$RESTORE -> command: certonly --webroot --webroot-path=/var/www/html --email youremail@mail.com
	--agree-tos --no-eff-email --force-renewal -d yourdomain.com -d www.yourdomain.com
	$LMAGENTA Donde el path es el volumen interno del bot certbot que comunica con el
	path donde están desplegada la web, por ejemplo /dist
	"

}


chuletadocker(){
	echo -e "
	
	$GREEN Visualizar los logs de un contenedor
	$RESTORE -> sudo docker logs nombreDelContenedor/ID
	zarse una vez renovado

	$GREEN Borrar los logs de un contenedor
	$RESTORE -> sudo truncate -s 0 \$(sudo docker inspect --format='{{.LogPath}}' nombreDelContenedor)
	
	"

}


chuletadotnet(){
	echo -e "
	
	$GREEN Listar plantillas de proyectos definidos que podemos levantar
	$RESTORE -> dotnet new --list

	$GREEN levantar por ejemplo una plantilla webapi
	$RESTORE -> dotnet new webapi

	$GREEN Levantar el proyecto web
	$RESTORE -> dotnet run (dentro de la carpeta)
	$LMAGENTA Se levantará en: http://www.yourdomain.com:5037/swagger/
	Es importante definir una ruta de escucha 0.0.0.0. en el archivo 
	launchsettings.json -> \"applicationUrl\": \"http://0.0.0.0:5037\"
    
      
    
	
	"

}



#TODO
# chuletatemperatura
# chuletausuarios
# chuleta apt
# chuleta docker [a medias]
# chuleta vncserver
# chuleta angular
# chuleta npm
# chuleta gestión disco duro y particiones
# chuleta gestión arquitectura y demás
# chuleta gestion dyndns
# chuleta gestion pivpn
# chuleta historial
# chuleta shebang
# chuleta redes
# chuleta procesos y demás
# chuleta directorios
# chuleta find
# chuleta >>







