#!/bin/sh
#filtro de columnas
ps | awk '{print $1}'

#filtro sin primera fila
ps | awk 'NR>1{print $1}'

#filtro con varias columnas
ps | awk '{print $1 $3 $4}'

#filtro con separador definido (:) y tabulador
ps | awk -F ":" '{print $1 "\t" $3 "\t" $4}'

#uso de FS (field separator)
#FS es equivalente a -F
ps | awk 'BEGIN{FS=":";} {print $1 "\t" $3 "\t" $4}'

#uso de OFS (Output Field Separator)
echo '======================='
cat /etc/passwd | awk 'BEGIN{FS=":";OFS=" - "} {print $1,$3,$4}'

#uso de $NF para imprimir a partir del ultimo delimitador
#se pasa una expresion regular para el texto que sigue de un /
cat /etc/shells | awk -F "/" '/^\// {print $NF}'

#uso de uniq
cat /etc/shells | awk -F "/" '/^\// {print $NF}' | uniq

#simplificacion alternativa al comando anterior

awk -F "/" '/^\// {print $NF}' /etc/shells | uniq

#acceso al penultimo y antepenultimo delimitador mediante $(NF-1) y $(NF-2)
awk -F "/" '/^\// {print $(NF-1)}' /etc/shells
awk -F "/" '/^\// {print $(NF-2)}' /etc/shells

#uso de awk con lineas de text

# solo las lineas que inician con /

df | awk '/^\// {print}'

#expresion regular para mostrar solo las lineas que inician con /dev/loop

df | awk '/^\/dev\/loop/ {print}'

#filtrar filas con expresion regular y filtro de columnas

df -h | awk '/^\/dev\/loop/ {print $1"\t"$2"\t"$3}'
