GRUPO=dua1
NUM=01
USUARIO=$GRUPO$NUM
LISTA=`seq -f%02g 1 99`
for NUM in $LISTA
do

if cat /etc/passwd | grep ^$USUARIO: > /dev/null

then
   userdel $USUARIO
   DHOME=`cat /etc/passwd | grep ^$USUARIO | cut -d: -f6`
   rm -rf $DHOME
else
   echo "error, el usuario $USUARIO no existe"
fi
   
echo $NUM
USUARIO=$GRUPO$NUM
DHOME=/home/$GRUPO/$USUARIO
done
