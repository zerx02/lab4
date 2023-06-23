#!/bin/bash

if [[ $1 == "--date" ]]; then
    echo $(date)
fi

for ((i=1; i<=100; i++)); do
    echo "Nazwa pliku: log$i.txt" > log$i.txt
    echo "Nazwa skryptu: skrypt.sh" >> log$i.txt
    echo "Data: $(date)" >> log$i.txt
done

if [[ $1 == "--logs" && ! -z $2 ]]; then
    num_files=$2
    for ((i=1; i<=num_files; i++)); do
        echo "Nazwa pliku: log$i.txt" > log$i.txt
        echo "Nazwa skryptu: skrypt.sh" >> log$i.txt
        echo "Data: $(date)" >> log$i.txt
    done
fi

if [[ $1 == "--help" ]]; then
    echo "Dostępne opcje:"
    echo "--date - wyświetla dzisiejszą datę"
    echo "--logs - tworzy 100 plików logx.txt"
    echo "--logs [liczba] - tworzy określoną liczbę plików logx.txt"
    echo "--help - wyświetla wszystkie dostępne opcje"
fi

