#include <stdio.h>
#include <stdlib.h>

int main() {
    int countEspaco = 0;
    int countQuebra = 0;
    int countCaracter = 0;
    char caracter;

    FILE *fp = fopen("arquivo1.txt", "rt");
    if(fp == NULL) {
        printf("Falha ao abrir o arquivo!");
        exit(1);
    }

    while (!feof(fp)) {
        caracter = fgetc(fp);
        
        if(caracter == ' ') {
            countEspaco++;
        }
        else if(caracter == '\n') {
            countQuebra++;
        }
        else {
            countCaracter++;
        }
    }
    
    fclose(fp);
    
    printf("Espacos em branco: %d\n", countEspaco);
    printf("Quebras de linha: %d\n", countQuebra);
    printf("Caracteres em geral: %d", countCaracter);

    return 0;
}