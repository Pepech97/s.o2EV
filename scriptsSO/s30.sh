while [ $# -ne 0 ]
do
PROCESO=$1

if [ $# -eq 0 ]
   then
      echo error, numero de parametros incorrecto
      exit 1
fi

ps -e | grep " $PROCESO"$ > /dev/null

if [ $? -ne 0 ]
   then
     echo error, el proceso no existe
     exit 2
fi
NLINEAS=`ps -e | grep " $PROCESO$" | wc -l`
while [ $NLINEAS -ne 0 ]
    do
LINEA=`ps -el |grep " $PROCESO"$ | head -$NLINEAS | tail -1`
NUMPROCESO=`echo $LINEA | tr -s " " | cut -d " " -f4`
PRPADRE=`echo $LINEA | tr -s " " | cut -d " " -f5`
if [ $PRPADRE -eq 0 ]
  then
	
    echo PID: $NUMPROCESO PPID: No tiene proceso padre $PROCESO
  else
NOMPADRE=`ps -p $PRPADRE | tail -1 | sed 's/^ *//' | tr -s " " | cut -d " " -f4`
echo PID: $NUMPROCESO PPID: $PRPADRE $PROCESO
fi
NLINEAS=`expr $NLINEAS - 1`
done
shift
done
