# answers.md — AWK Gradebook Lab
**Nombre:** Adrian Garcia

---

## Task 1
Command: awk -F',' 'NR>1 {count++} END {print count}' Lab03-data.csv
Result: 322
Explanation: -F',' establece la coma como separador. NR>1 salta el header y cuenta cada línea de datos. END imprime el total.
