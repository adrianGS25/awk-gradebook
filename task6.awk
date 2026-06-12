# Nombre: Adrian Garcia | Curso: Systems Engineering | Task 6: Per-student grade
BEGIN { FS="," }
NR>1 {
    earned[$1]   += $4
    possible[$1] += $5
}
END {
    for (s in earned) {
        pct = earned[s] / possible[s] * 100
        if      (pct >= 90) grade = "A"
        else if (pct >= 80) grade = "B"
        else if (pct >= 70) grade = "C"
        else if (pct >= 60) grade = "D"
        else                grade = "E"
        printf "%-10s %6.2f %s\n", s, pct, grade
    }
}
