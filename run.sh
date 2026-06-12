#!/bin/bash
# Nombre: Adrian Garcia | Curso: Systems Engineering | Task 7: Bash wrapper
file="$1"
echo "Name       Pct    Grade"
awk -f task6.awk "$file" | sort
