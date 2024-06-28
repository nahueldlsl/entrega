#!/bin/bash

#Nahuel de los Santos Lema 322956
adivinar_numero() {
    # Genera un número aleatorio entre 1 y 100
    numero_secreto=$(((RANDOM % 100) + 1))
    intentos=0
    max_intentos=7

    echo "¡Bienvenido al juego de adivinar el número!"
    echo "He elegido un número entre 1 y 100."
    echo "Tienes $max_intentos intentos para adivinarlo."

    # Bucle principal del juego
    while [ $intentos -lt $max_intentos ]; do
        # Incrementa el contador de intentos
        intentos=$((intentos + 1))

        # Solicita al usuario que ingrese un número
        read -p "Intento #$intentos: Ingresa un número: " numero_ingresado

        # Comprueba si el número ingresado es válido
        if [[ ! $numero_ingresado =~ ^[0-9]+$ ]]; then
            echo "Entrada inválida. Ingresa un número entero."
            continue
        fi

        # Compara el número ingresado con el número secreto
        if [ $numero_ingresado -eq $numero_secreto ]; then
            echo "¡Felicidades! Adivinaste el número en $intentos intentos."
            return
        elif [ $numero_ingresado -lt $numero_secreto ]; then
            echo "El número secreto es mayor que $numero_ingresado."
        else
            echo "El número secreto es menor que $numero_ingresado."
        fi

    done

    # El jugador se quedó sin intentos
    echo "Te quedaste sin intentos. El número secreto era $numero_secreto."
}

# Función para el juego de piedra, papel o tijera
jugar_ppt() {
    opciones=("piedra" "papel" "tijera")

    echo "¡Bienvenido al juego de Piedra, Papel o Tijera!"

    # Bucle principal del juego
    while true; do
        # Elección del ordenador
        eleccion_ordenador=${opciones[$((RANDOM % 3))]}

        # Elección del jugador
        read -p "Elige: piedra, papel o tijera: " eleccion_jugador

        # Convertir la elección del jugador a minúsculas
        eleccion_jugador=$(echo "$eleccion_jugador" | tr '[:upper:]' '[:lower:]')

        # Validar la elección del jugador
        if [[ ! " ${opciones[@]} " =~ " ${eleccion_jugador} " ]]; then
            echo "Elección inválida. Por favor, elige piedra, papel o tijera."
            continue
        fi

        # Mostrar las elecciones
        echo "Tú elegiste: $eleccion_jugador"
        echo "El ordenador eligió: $eleccion_ordenador"

        # Determinar el ganador
        case "$eleccion_jugador" in
        "piedra")
            case "$eleccion_ordenador" in
            "piedra") echo "¡Empate!" ;;
            "papel") echo "¡El ordenador gana!" ;;
            "tijera") echo "¡Tú ganas!" ;;
            esac
            ;;
        "papel")
            case "$eleccion_ordenador" in
            "piedra") echo "¡Tú ganas!" ;;
            "papel") echo "¡Empate!" ;;
            "tijera") echo "¡El ordenador gana!" ;;
            esac
            ;;
        "tijera")
            case "$eleccion_ordenador" in
            "piedra") echo "¡El ordenador gana!" ;;
            "papel") echo "¡Tú ganas!" ;;
            "tijera") echo "¡Empate!" ;;
            esac
            ;;
        esac

        # Preguntar si se quiere jugar de nuevo
        read -p "¿Jugar de nuevo? (s/n): " jugar_de_nuevo
        if [[ "$jugar_de_nuevo" != "s" ]]; then
            echo "¡Gracias por jugar!"
            break
        fi
    done
}

messi(){
    echo "Hola mundo"
}

while true; do
    echo "
    ╔════════════════════════════════════╗
    ║           MENÚ PRINCIPAL           ║
    ╠════════════════════════════════════╣
    ║ 1. Adivinar numero                 ║
    ║ 2. Piedra papel o tijera           ║
    ║ 3. Hola mundo                      ║     
    ║ 4. Salir                           ║
    ╚════════════════════════════════════╝"

    echo "Seleccione una opción:"
    read opcion

    case $opcion in
    1) adivinar_numero ;;
    2) jugar_ppt ;;
    3) messi;;
    4)
        echo "Saliendo..."
        exit 0
        ;;
    *) echo "Opción inválida." ;;
    esac
done
