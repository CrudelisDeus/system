#!/bin/bash
# Скрипт для перетворення PDF файлу на зображення та зворотного конвертування у PDF

if [ -z "$1" ]; then
  echo "Будь ласка, вкажіть PDF файл для конвертації."
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Файл $1 не знайдено."
  exit 1
fi

TMP_DIR="temp_pdf_images"

# Видаляємо тимчасову директорію, якщо вона існує
if [ -d "$TMP_DIR" ]; then
  rm -rf "$TMP_DIR"
fi

# Створюємо нову тимчасову директорію
mkdir "$TMP_DIR"

# Перетворюємо PDF на зображення
pdftoppm "$1" "$TMP_DIR/image" -png

# Перетворюємо зображення на новий PDF файл
convert "$TMP_DIR/image*.png" "${1%.*}_converted.pdf"

# Видаляємо тимчасову директорію
rm -rf "$TMP_DIR"

echo "Конвертація завершена. Новий файл збережено як ${1%.*}_converted.pdf"

# apt install poppler-utils imagemagick -y