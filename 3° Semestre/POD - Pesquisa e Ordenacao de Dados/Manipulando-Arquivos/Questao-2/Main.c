#include <stdio.h>
#include <stdlib.h>

// Metodo Insertion Sort.
int methodInsertion(int *vetor, int tam_vetor) {
    int i, k, aux;
    for(i = 0; i < tam_vetor; i++) {
        aux = vetor[i];
        k = i - 1;
        while(k >= 0) {
            if(vetor[k] > aux) {
                vetor[k + 1] = vetor[k];
                k--;
            }
            else {
                break;
            }
        }
        vetor[k + 1] = aux;
    }
}

int main() {
    int vetor[20];
    int i, j = 0;

    FILE *file;

    file = fopen("numeros.txt", "rt");

    if(file == NULL) {
        printf("Falha ao abrir o arquivo!");
        exit(1);
    }

    for (i=0; i<20; i++) { // Passando dados do arquivo para o vetor.
        fscanf(file, "%d\n", &vetor[i]);
    }
    
    // for (j = 0; j < 20; j++) { // Exibindo dados do vetor.
    //     printf("%d,", vetor[j]);
    // }

    // Ordenando o vetor com o Metodo Insertion.
    methodInsertion(vetor, 20);
    

    // for (j = 0; j < 20; j++) { // Exibindo Vetor ordenado.
    //     printf("\n%d;", vetor[j]);
    // }


    /*
        # Criando um novo arquivo "numeros_ord.txt"
        # E salvando meu vetor dentro do mesmo. 
    */
    file = fopen("numeros_ord.txt", "wt");
    for(i = 0; i < 20; i++) {
        fprintf(file, "%d;\n", vetor[i]);
    }

    return 0;
}