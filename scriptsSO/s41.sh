OPC=$1
shift
USR=`id -un`
ROOT=root
OPC=`echo $OPC | tr "[[:lower:]]" "[[:upper:]]"`
test "$OPC" = U && OPC=u
test "$OPC" = G && OPC=g

case $OPC in
u)
while [ $# -ne 0 ]
do
cat /etc/passwd | grep ^$1: > /dev/null
if [ $? -eq 0 ]

then
echo existe
if [ $USR = root  ]
then
echo eres root
BLOCK=`cat /etc/shadow | grep ^$1: | cut -d ":" -f2`

if [ $BLOCK = "!!" ]
then
echo Usuario $1 bloqueado
fi
else
echo no eres root
fi
else
echo el usuario no existe
fi
shift
done

;;
g)
while [ $# -ne 0 ]
do
cat /etc/passwd | grep ^$1: > /dev/null
if [ $? -eq 0 ]

then
echo existe
GPADRE=`cat /etc/passwd | grep ^$1: | cut -d ":" -f4`
NPADRE=`cat /etc/group | grep :$GPADRE: | cut -d ":" -f1`
echo su grupo padre es $NPADRE
else
echo el usuario no existe
fi
shift
done
;;
esac
