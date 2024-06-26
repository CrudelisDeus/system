# 2 lab

**Індвідуальне завдання**: Визначити який процент віртуальної пам’яті (стовпчик VIRT) відзагального об’єму припадає на кожний пріоритет потоку (стовпчик PR).

**Комментарі до коду**
```bash
#!/bin/bash

# Запустимо команду top у режимі потоків (-H) та збережемо результат у змінну top_output
top_output=$(top -H -b -n1)

# Використаємо awk для обробки змінної top_output
echo "$top_output" | awk '
BEGIN {
    # Встановлюємо роздільники полів
    FS = " "
    OFS = "\t"
}
# Починаємо обробку з 8-го рядка (пропускаємо заголовки та інформацію про систему)
NR > 7 {
    # Перевіряємо, чи поточний рядок не є заголовком стовпців
    if ($6 != "PR") {
        # Зчитуємо пріоритет потоку
        prio = $6
        # Зчитуємо обсяг віртуальної пам'яті
        virt_mem = $5
        # Видаляємо суфікс "K" для перетворення значення в числовий формат
        gsub(/K/, "", virt_mem)
        # Перетворюємо віртуальну пам'ять в числовий формат
        virt_mem = virt_mem + 0

        # Додаємо значення віртуальної пам'яті для відповідного пріоритету
        prio_virt_mem[prio] += virt_mem
        # Підраховуємо загальну віртуальну пам'ять
        total_virt_mem += virt_mem
    }
}
END {
    # Виводимо заголовки таблиці
    print "Priority\tVirtual Memory (KB)\tPercentage"
    # Для кожного пріоритету у масиві prio_virt_mem
    for (prio in prio_virt_mem) {
        # Обчислюємо процент віртуальної пам'яті для кожного пріоритету
        percentage = (prio_virt_mem[prio] / total_virt_mem) * 100
        # Виводимо пріоритет, використану віртуальну пам'ять та процент
        printf "%s\t\t%d\t\t%.2f%%\n", prio, prio_virt_mem[prio], percentage
    }
    # Виводимо загальний обсяг віртуальної пам'яті
    printf "Total Virtual Memory: %d KB\n", total_virt_mem
}
'
```