#!/bin/bash
# Скрипт для зчитування текстового файлу і виведення його рядків

if [ -z "$1" ]; then
  echo "Будь ласка, вкажіть файл як параметр."
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Файл $1 не знайдено."
  exit 1
fi

while IFS= read -r line
do
  echo "$line"
done < "$1"
