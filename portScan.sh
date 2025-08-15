#!/bin/bash

echo "TCP PortScan"

echo "Escolha o tipo de rede:"
echo "A - Classe A (ex: 10.x.x.x)"
echo "B - Classe B (ex: 172.16.x.x)"
echo "C - Classe C (ex: 192.168.0.x)"
read -p "Digite A, B ou C: " classe

read -p "Digite a porta TCP para escanear: " porta

case $classe in
    A|a)
        read -p "Digite apenas o primeiro octeto da rede (ex: 10): " base
        for i in {0..255}; do
            for j in {0..255}; do
                for k in {1..254}; do
                    ip="$base.$i.$j.$k"
                    hping3 -S -p $porta -c 1 $ip 2>/dev/null \
                        | grep "flags=SA" | cut -d " " -f 2 | cut -d "=" -f 2 &
                done
                wait
            done
        done
        ;;
    B|b)
        read -p "Digite os dois primeiros octetos da rede (ex: 172.16): " base
        for i in {0..255}; do
            for j in {1..254}; do
                ip="$base.$i.$j"
                hping3 -S -p $porta -c 1 $ip 2>/dev/null \
                    | grep "flags=SA" | cut -d " " -f 2 | cut -d "=" -f 2 &
            done
            wait
        done
        ;;
    C|c)
        read -p "Digite os três primeiros octetos da rede (ex: 192.168.0): " base
        for i in {1..254}; do
            ip="$base.$i"
            hping3 -S -p $porta -c 1 $ip 2>/dev/null \
                | grep "flags=SA" | cut -d " " -f 2 | cut -d "=" -f 2 &
        done
        wait
        ;;
    *)
        echo "Opção inválida."
        exit 1
        ;;
esac

echo "Scan finalizado!"

