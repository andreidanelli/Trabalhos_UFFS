#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

//************************//
// INÍCIO MÉTODOS DE ORDENAÇÃO
//***********************//

//Método Insertion Sort
int metodoInsertion(int *vetor, int tam_vetor) {
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

//Método Selection Sort
void metodoSelection(int *vetor, int tam_vetor) {
    int i, k, aux;
    for(i = 0; i <= tam_vetor-2; i++) {
        aux = i;
        for(k = i+1; k <= tam_vetor-1; k++) {
            if(vetor[aux] > vetor[k]) {
                aux = k;
            }
        } 
        if (aux != i) {
            int sel = vetor[i];
            vetor[i] = vetor[aux];
            vetor[aux] = sel; 
        }
    }
}

//Método Bubble Sort
void metodoBubblesort(int *vetor, int tam_vetor) {
    int i,k,aux;
    for(i = tam_vetor-1; i >= 1; i--) {
        aux = 0;
        for(k = 0; k <= i-1; k++) {
            if (vetor[k] > vetor[k+1]) {  
                vetor[k] = vetor[k+1];
                aux = 1;
            }
        }
        if (aux == 0) {
            break;
        }
    }
}

//************************//
// FIM MÉTODOS DE ORDENAÇÃO
//***********************//


//Vetor Crescente
void vetorCrescente(int *vetor, int tam_vetor) {
    int i;
    for(i = 0; i < tam_vetor; i++) {
        vetor[i] = i+1;
        // printf("%d ", vetor[i]);
    }
    return 0;
}

//Vetor Decrescente
void vetorDecrescente(int *vetor, int tam_vetor) {
    int i, aux;
        aux = tam_vetor;
    
    for(i = 0; i < tam_vetor; i++) {
        vetor[i] = aux;
        aux--;
        // printf("%d ", vetor[i]);
    }
}
//Vetor Aleatório
void vetorAleatorio(int *vetor, int tam_vetor, int valor) {
    int i;
    for(i = 0; i < tam_vetor; i++) {
        vetor[i] = rand() % valor; //Usando a função Rand pra gerar valores aleatórios
        // printf("%d ", vetor[i]);
    }
}

//Função Opções Geração de Vetores 
void opcoesVetores(int opcao, int tam_vetor, int *vetor, int valor) {
    //Escolhe metodo Vetor Crescente
    if(opcao == 1) {
        vetorCrescente(vetor, tam_vetor);
    }
    //Escolhe metodo Vetor Decrescente
    else if(opcao == 2) {
        vetorDecrescente(vetor, tam_vetor);
    }
    //Escolhe metodo Vetor Aleatório
    else if(opcao == 3) {
        vetorAleatorio(vetor, tam_vetor, valor);
    }
}

int main() {
    //Variáveis para o time
    clock_t inicio, fim;
    double time;

    int valor = 150000;
    int tam_vetor, tipo_vetor, metodo_ordenacao;

    do {
        printf("\n");
        printf("Informe o tamanho do vetor: ");
        scanf("%d", &tam_vetor);
        printf("\n");
        int vetor[tam_vetor];
        printf("Informe o tipo do vetor: \n1 - Vetor Crescente\n2 - Vetor Decrescente\n3 - Vetor Aleatorio\n");
        printf("Escolha a opcao desejada: ");
        scanf("%d", &tipo_vetor);

        //Chama a função opções de vetores
        opcoesVetores(tipo_vetor, tam_vetor, vetor, valor);

        printf("\n");
        printf("Informe o metodo de ordenacao: \n1 - Insertion Sort\n2 - Selection Sort\n3 - Bubble Sort\nOu pressione 0 para finalizar o programa\n");
        printf("Escolha a opcao desejada: ");
        scanf("%d", &metodo_ordenacao);
    
        switch(metodo_ordenacao) {
            case 1:
                inicio = clock();
                metodoInsertion(vetor, tam_vetor);
                fim = clock();
                time = ((double)fim - inicio)/CLOCKS_PER_SEC;
                printf("\nTempo em segundos (s): %lf", time);
                printf("\nTempo em milissegundos (ms): %lf\n", time*1000);
                break;
            case 2:
                inicio = clock();
                metodoSelection(vetor, tam_vetor);
                fim = clock();
                time = ((double)fim - inicio)/CLOCKS_PER_SEC;
                printf("\nTempo em segundos (s): %lf", time);
                printf("\nTempo em milissegundos (ms): %lf\n", time*1000);
                break;
            case 3: 
                inicio = clock();
                metodoBubblesort(vetor, tam_vetor);
                fim = clock();
                time = ((double)fim - inicio)/CLOCKS_PER_SEC;
                printf("\nTempo em segundos (s): %lf", time);
                printf("\nTempo em milissegundos (ms): %lf\n", time*1000);

                break;
            default :
            printf("Sistema finalizado com sucesso!!\nVolte sempre \3\3!");
        }   
    }while (metodo_ordenacao != 0);



    return 0;
}