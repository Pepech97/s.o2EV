if [ $# -eq 0 ]
   then
      echo error, numero de parametros incorrecto
      exit 1
fi

while [ $# -ne 0 ]
do
PROCESO=$1

ps -el | grep " $PROCESO$" > misprocesos

if [ ! -s misprocesos ]
   then
     echo error, el proceso no existe
   else
     echo Proceso $PROCESO
while
    read LINEA
    do

    NUMPROCESO=`echo $LINEA | tr -s " " | cut -d " " -f4`
    PRPADRE=`echo $LINEA | tr -s " " | cut -d " " -f5`
if [ $PRPADRE -eq 0 ]
  then
    PRPADRE="No tiene padre"
  else
     NOMPADRE=`ps -p $PRPADRE | tail -1 | sed 's/^ *//' | tr -s " " | cut -d " " -f4`
fi
 echo "    PID: $NUMPROCESO    PPID: $PRPADRE  $PROCESO"
done < misprocesos
fi
shift
done
