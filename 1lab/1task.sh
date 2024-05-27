#!/bin/bash
# Скрипт для виведення переданих параметрів

echo "Передані параметри:"
for param in "$@"
do
  echo "$param"
done