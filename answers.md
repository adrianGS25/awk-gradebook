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

## Task 5
Script: task5.awk
Command: awk -f task5.awk Lab03-data.csv | sort
Result:
Name      Low High    Average
FINAL     116  200     156.86
H01        46  100      82.71
H02        55  100      77.57
...
Explanation: Tres arrays asociativos indexados por $3 (nombre de asignación): lo[] y hi[] rastrean mínimo y máximo con if, sum[] y cnt[] acumulan datos para el promedio. El bloque END itera con for (a in sum) e imprime cada fila con printf "%.2f".

## Task 6
Script: task6.awk
Command: awk -f task6.awk Lab03-data.csv | sort
Result:
Andrew      73.69 C
Ava         81.43 B
Chelsey     62.65 D
Diana       62.08 D
Eliza       84.16 B
Jackson     78.64 C
Kenji       86.45 B
Lucia       89.53 B
Maria       79.57 C
Noah        63.08 D
Priya       71.04 C
Sam         72.90 C
Shane       93.12 A
Tomas       82.22 B
Explanation: Dos arrays indexados por $1 (nombre): earned[] acumula puntos obtenidos y possible[] acumula puntos posibles. En END se divide earned[s]/possible[s]*100 para el porcentaje real. La cadena if/else if asigna la letra según la escala.

## Task 7
Script: run.sh
Command: ./run.sh Lab03-data.csv
Result:
Name       Pct    Grade
Andrew      73.69 C
Ava         81.43 B
Chelsey     62.65 D
Diana       62.08 D
Eliza       84.16 B
Jackson     78.64 C
Kenji       86.45 B
Lucia       89.53 B
Maria       79.57 C
Noah        63.08 D
Priya       71.04 C
Sam         72.90 C
Shane       93.12 A
Tomas       82.22 B
Explanation: El script recibe el archivo como $1. Imprime el header con echo, luego ejecuta awk -f task6.awk contra el archivo y canaliza la salida a sort para ordenar alfabéticamente por nombre.
