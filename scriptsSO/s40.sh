OPC=$1
shift
OPC=`echo $OPC | tr "[[:lower:]]" "[[:upper:]]"`
test "$OPC" = UNO && OPC=1
test "$OPC" = DOS && OPC=2
test "$OPC" = TRES && OPC=3

case $OPC in
1)
echo "lista de parametros"
for PAR
do
echo $PAR
done
;;
2) 
echo opcion 2 con $*
while [ $# -ne 0 ]
do
echo $1 $2 $3
if [ $# -lt 3 ]
then
echo error, no hay suficientes parametros
exit
else
shift 3
fi
done
;;
3)
echo opcion 3 con $*
;;
*)
echo opcion incorecta
;;
esac

