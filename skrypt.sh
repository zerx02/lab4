#!/bin/bash

case "$1" in
  --help | -h)
    echo "Dostępne opcje:"
    echo "--date,-d - wyświetla dzisiejszą datę"
    echo "--logs,-l - tworzy pliki logx.txt"
    echo "--help,-h - wyświetla wszystkie dostępne opcje"
    echo "--init - klonuje repozytorium do bieżącego katalogu i ustawia ścieżkę w zmiennej PATH"
    echo "--error,-e [liczba] - tworzy pliki errorx/errorx.txt"
    shift
    ;;
  --logs | -l)
    num_files=$2
    for ((i=1; i<=num_files; i++)); do
        echo "Nazwa pliku: log$i.txt" > log$i.txt
        echo "Nazwa skryptu: skrypt.sh" >> log$i.txt
        echo "Data: $(date)" >> log$i.txt
    done
    shift
    ;;
  --date | -d)
    echo $(date)
    shift
    ;;
  --init)
   
    git clone https://github.com/zerx02/lab4
    if [[ ":$PATH:" != *":$(pwd):"* ]]; then
        export PATH=$PATH:$(pwd)
    fi
    shift
    ;;
  --error | -e)
    if [[ -z $2 ]]; then
      for ((i=1; i<=100; i++)); do
        echo "Plik error$i.txt" > "error$i/error$i.txt"
      done
    else
      num_files=$2
      for ((i=1; i<=num_files; i++)); do
        echo "Plik error$i.txt" > "error$i/error$i.txt"
      done
    fi
    shift
    ;;
    --rebase)
    branch_name=$2
    git rebase "$branch_name"
    shift
    ;;
    --merge)
    branch_name=$2
    git merge "$branch_name"
    shift
;;
esac   
