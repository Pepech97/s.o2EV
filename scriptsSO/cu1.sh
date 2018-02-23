GRUPO=dua1
NUM=01
USUARIO=$GRUPO$NUM
DHOME=/home/$GRUPO/$USUARIO
SHELL=/bin/bash
LISTA=`seq -f%02g 1 15`
for NUM in $LISTA
do

if cat /etc/passwd | grep ^$USUARIO: > /dev/null

then

echo "error, el usuario ya existe"
else
    useradd -d $DHOME -m -g $GRUPO -s $SHELL $USUARIO

    (echo $USUARIO ; echo $USUARIO) | passwd $USUARIO
fi

echo $NUM
USUARIO=$GRUPO$NUM
DHOME=/home/$GRUPO/$USUARIO
done
