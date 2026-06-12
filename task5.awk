# Nombre: Adrian Garcia | Curso: Systems Engineering | Task 5: Per-assignment report
BEGIN {
    FS=","
    printf "%-8s %4s %4s %10s\n", "Name", "Low", "High", "Average"
}
NR>1 {
    a = $3
    score = $4+0
    if (!(a in lo) || score < lo[a]) lo[a] = score
    if (!(a in hi) || score > hi[a]) hi[a] = score
    sum[a] += score
    cnt[a]++
}
END {
    for (a in sum)
        printf "%-8s %4d %4d %10.2f\n", a, lo[a], hi[a], sum[a]/cnt[a]
}
