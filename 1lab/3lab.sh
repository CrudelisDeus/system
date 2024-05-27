#!/bin/bash
# Скрипт для конвертації файлів у формат PDF

if [ -z "$1" ]; then
  echo "Будь ласка, вкажіть файл для конвертації."
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Файл $1 не знайдено."
  exit 1
fi

lowriter --convert-to pdf "$1"

# apt install libreoffice-writer -y 