# TCP Portscan Interativo

Este é um **script simples em Bash** para estudo que realiza varredura de portas TCP em redes Classe A, B ou C.  
Ele utiliza o **hping3** para enviar pacotes SYN e detectar quais hosts têm portas abertas.

---

## Funcionalidades

- Varredura de redes Classe **A**, **B** ou **C**  
- Escolha interativa do **IP base da rede**  
- Escolha da **porta TCP** a ser testada  
- Paralelismo controlado para acelerar a varredura  
- Exibe apenas os **IPs que possuem a porta aberta**

---

## Requisitos

- Sistema Linux (ou compatível com Bash)  
- [hping3](https://github.com/antirez/hping) instalado

Exemplo de instalação no Ubuntu/Debian:

```bash
sudo apt update
sudo apt install hping3
```
## Uso

```bash
chmod +x tcp_portscan.sh
./tcp_portscan.sh
```


