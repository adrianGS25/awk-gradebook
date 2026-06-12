# answers.md — AWK Gradebook Lab
**Nombre:** Adrian Garcia

---

## Task 1
Command: awk -F',' 'NR>1 {count++} END {print count}' Lab03-data.csv
Result: 322
Explanation: -F',' establece la coma como separador. NR>1 salta el header y cuenta cada línea de datos. END imprime el total.

## Task 2
Command: awk -F',' 'NR>1 {seen[$1]=1} END {print length(seen)}' Lab03-data.csv
Result: 14
Explanation: El array asociativo seen[] indexado por $1 (nombre) actúa como conjunto. Asignar 1 a seen[$1] registra cada nombre una sola vez. length(seen) cuenta las claves únicas en END.

## Task 3
Command: awk -F',' 'NR>1 && $3=="FINAL" {printf "%-10s %3s\n", $1, $4}' Lab03-data.csv
Result:
Jackson    169
Kenji      162
Shane      193
Noah       116
Lucia      200
Priya      159
Andrew     123
Diana      152
Maria      152
Eliza      141
Tomas      163
Sam        152
Ava        172
Chelsey    142
Explanation: La condición $3=="FINAL" filtra solo las filas de esa asignación. printf formatea la salida con %-10s para el nombre alineado a la izquierda en 10 espacios y %3s para el puntaje alineado a la derecha.

## Task 4
Command: awk -F',' 'NR>1 && $4 < $5*0.6 {count++} END {print count}' Lab03-data.csv
Result: 50
Explanation: La condición $4 < $5*0.6 compara el puntaje obtenido contra el 60% del máximo usando $5 en lugar de un número fijo, ya que el máximo varía por asignación. Cada fila que cumple la condición incrementa el contador.
