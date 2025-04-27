#Problema completo con varios conceptos para practicar
#Se realizara un menu con varias opciones (10)
#!/bin/bash

#Funciones deben ir al inicio del programa

buscarFichero(){
    echo "[11] Buscar Ficheros"
    echo "1. Buscar por nombre completo de fichero"
    echo "2. Buscar por nombre parcial"
    echo "3. Buscar palabra dentro de los ficheros"
    read -p "Selecion opcion: " opcionF

    read -p "Introduce texto a buscar: " texto

    case $opcionF in
        #Find . para directorio actual. Busqueda concreta de nombre de fichero. -type f de tipo file -name por nombre
        1) echo "Resultados de busqueda nombre completo: "
            find . -type f -name "$texto";;

        #Con * parcial
        2) echo "Resultados de busqueda nombre parcial: "
            find . -type f -name "*$texto*";;
        
        #Grep buscara palabras dentro de los ficheros. -r recursivamente en directorios y subdirectoriores -i IgnoreCase.
        3) echo "Resultados por palabras dentro de ficheros: "
            grep -ri "$texto";;
        *) echo "No ha introducido ninguna opcion valida. Saliendo...";;
    esac
}


decirHola() { #Funcion para probar
    echo "Hola, soy la funcion"
}
operacionesMath(){
    suma(){
        echo $(($1 + $2))
    }
    multiplicacion(){
        echo $(($1 * $2))
    }
    division(){
        if [ $2 -eq 0 ]; then
            echo "No se puede dividir por cero"
            return 1
        fi
        echo $(($1 / $2))
    }


    echo "Que operacion desea realizar:" 
    echo "1. Suma"
    echo "2. Multiplicacion"
    echo "3. Division"
    read -p "Selecione opracion deseada: " math
    read -p "Introduce operando 1:" op1
    read -p "Introduce operando 2:" op2
   

    case $math in
        1) echo "La suma es: "; suma "$op1" "$op2";;
        2) echo "La multiplicacion es: "; multiplicacion "$op1" "$op2";;
        3) echo "La division es :"; division "$op1" "$op2";;
    esac
}

positiveNum (){ #Se puede controlar si se introduce un numero
    if (($numero > 0)); then
        echo "El numero es positivo"
    elif (($numero < 0)); then
        echo "El numero es negativo"
    else
        echo "El numero es cero"
    fi

}
copiarDir(){
    if [ ! -d "$PWD/history" ];then
        mkdir -p "$PWD/history"
    fi
    cp *.txt $PWD/history
    return 0
}
odenarV(){
    read -p "Introduce cantidad de numeros a ordenar: " num
    for((i=0; i< $num ; i++))
    do
        read - p "Introduce numero $i: " n
        array[$i] = $n
    done
}
minMax(){
    read -p "Introduce numero de elementos: " len
    for ((i = 0 ; i < $len ; i++))
    do
        read -p "Introduce numero $i: " n
        array[$i]=$n
    done

echo ${array[*]}
echo ${array[@]}
echo ${#array[*]}

min=${array[0]}
max=${array[0]}

    for((i=0 ; i<len ; i++))
    do
        if ((array[$i] < min));then
            min=${array[$i]}
        fi
        if ((array[$i] > max));then
            max=${array[$i]}
        fi
    done
    echo "El maximo es : $max"
    echo "El minimo es: $min"

}
ordenar(){
	array=()
	read -p "Cuantos numeros quieres ordenar: " len
	
	for (( i=0; i<len;i++));
	do
		read -p "Introduce elemento $i : " num
		array[$i]=$num
	done
	
    echo "Array Original"
    echo "${array[@]}"

    for ((i=0; i<len; i++));
    do
        for ((j=0;j<len;j++));
        do
            if [ "${array[j]}" -gt "${array[j+1]}" ];then
                temp=${array[j]}
                array[j]=${array[j+1]}
                array[j+1]=$tem
            fi
        done
    done

    echo "Vector ordenado: "
    echo "${array[@]}"

    
}

while :
do
    clear
    echo "=========== MENU =============="
    echo 
    echo "[1] Saber que dia es hoy"
    echo "[2] Muestrame el calendario"
    echo "[3] Que usuario esta usando la sesion"
    echo "[4] Muestra ficheros del directorio actual"
    echo "[5] Buscar fichero" 
    echo "[6] Borrar un fichero" 
    echo "[7] Comenzar editor"
    echo "[8] Operaciones Math (+, *, /)"
    echo "[9] Numero Positivo/Negativo"
    echo "[10] Copiar archivos de un directorio a otro"
    echo "[11] Buscar nuevo" #Ordenar Numeros"
    echo "[12] Buscar Mayor y Menor"
    echo "[13] Ordenar vector"
    echo "[14] Trabajar con cadenas"
    echo "[15] Salir"
    echo
    echo "================================="
    
    read -p "Seleccione una opcion: " NUM

    case $NUM in
        1)  echo "Hoy es : $(date)"
            read -p "Presione cualquier tecla...";;
        
        2)  cal
            read -p "Presione cualquier tecla...";;
        
        3)  echo "Esta usando la sesion de $USER. Estos son los datos de sesion: $(who)"
            read -p "Presione cualquier tecla...";;
        
        4)  echo "Archivos en $(pwd): " 
            ls -l 
            read -p "Presione cualquier tecla...";;

        5)  echo "Opcion 5. Introduce Fichero a buscar: ";
            read BUSCAR
            sync && grep -ril "$BUSCAR" ./
            read -p "Presione cualquier tecla...";;

        6)  echo "Opcion 6. Introduce nombre del archivo a borrar: "
            read BORRAR
            rm $BORRAR 
            read -p "Presione cualquier tecla...";;

        7)  nano; 
            read -p "Presione cualquier tecla...";;

        8)  operacionesMath
            read -p "Presione cualquier tecla...";;
            
        9)  echo "Ingrese un numero: "
            read numero
            positiveNum "$numero" 
            read -p "Presione cualquier tecla...";;
        
        10) copiarDir
            read -p "Pulse cualquier tecla...";;
        
        11) buscarFichero
            read -p "Pulse cualquier tecla...";;

        12) minMax
            read -p "Pulsa cualquier tecla..." ;;
        
        13) ordenar
            read -p "Pulsa cualquier tecla.." ;;

        14) echo "Opcion 13 - Trabajar con cadenas";;
        
        15) echo "Opcion Salir"
            exit 0;;        
        
        *)  echo "Opcion incorrecta. Elija una de las opciones"
            read -p "Presione cualquier tecla...";;
        esac
     
done
