#!/bin/bash

print_date() {
  date
}

create_gitignore() {
  echo "*log*" > .gitignore
}

create_logs() {
  for ((i=1; i<=100; i++)); do
    echo "Nazwa pliku: log${i}.txt" > log${i}.txt
    echo "Nazwa skryptu: $0" >> log${i}.txt
    echo "Data: $(date)" >> log${i}.txt
  done
}

create_logs_with_count() {
  local count=$1
  for ((i=1; i<=count; i++)); do
    echo "Nazwa pliku: log${i}.txt" > log${i}.txt
    echo "Nazwa skryptu: $0" >> log${i}.txt
    echo "Data: $(date)" >> log${i}.txt
  done
}

show_help() {
  echo "Dostępne opcje:"
  echo "--date : Wyświetla dzisiejszą datę"
  echo "--logs : Tworzy 100 plików logx.txt"
  echo "--logs <liczba> : Tworzy określoną liczbę plików logx.txt"
  echo "--help : Wyświetla pomoc"
}

if [[ $# -eq 0 ]]; then
  echo "Nie podano żadnej flagi. Użyj --help, aby zobaczyć dostępne opcje."
  exit 1
fi

if [[ "$1" == "--date" ]]; then
  print_date
fi

if [[ "$1" == "--logs" ]]; then
  if [[ "$2" =~ ^[0-9]+$ ]]; then
    create_logs_with_count "$2"
  else
    create_logs
  fi
fi

if [[ "$1" == "--help" ]]; then
  show_help
fi