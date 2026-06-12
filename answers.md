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
