FICH=deptotal
while
   read LINEA
do
   NUEVALINEA=$LINEA
   NOM=`echo $NUEVALINEA | cut -d: -f1`
   APELL1=`echo $NUEVALINEA | cut -d: -f2`
   APELL2=`echo $NUEVALINEA | cut -d: -f3`
   LONGITUD=`echo $NUEVALINEA
   NOM=`echo $NOM | cut -c 1-1`
   APELL1=`echo $APELL1 | cut -c 1-2`
   APELL2=`echo $APELL2 | cut -c 1-2`

   echo Creando usuario para $NOM$APELL1$APELL2
done < $FICH
