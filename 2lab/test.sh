#!/bin/bash

top_output=$(top -H -b -n1)

echo "$top_output" | awk '
BEGIN {
    FS = " "
    OFS = "\t"
}
NR > 7 {
    if ($6 != "PR") {
        prio = $6
        virt_mem = $5
        gsub(/K/, "", virt_mem)
        virt_mem = virt_mem + 0

        prio_virt_mem[prio] += virt_mem
        total_virt_mem += virt_mem
    }
}
END {
    print "Priority\tVirtual Memory (KB)\tPercentage"
    for (prio in prio_virt_mem) {
        percentage = (prio_virt_mem[prio] / total_virt_mem) * 100
        printf "%s\t\t%d\t\t%.2f%%\n", prio, prio_virt_mem[prio], percentage
    }
    printf "Total Virtual Memory: %d KB\n", total_virt_mem
}
'
