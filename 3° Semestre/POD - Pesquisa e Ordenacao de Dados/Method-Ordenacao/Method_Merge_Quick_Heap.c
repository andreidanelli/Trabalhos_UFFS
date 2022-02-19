#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>

//************************//
// INÍCIO MÉTODOS DE ORDENAÇÃO
//***********************//

//<!-- Merge Sort -->
void intercala(int *vetor, int inicio, int meio, int fim) {
    int aux[fim - inicio + 1];
    int i, j, k;
    i = inicio;
    j = meio + 1;
    k = 0;

    while (meio >= i && fim >= j) {
        if (vetor[i] <= vetor[j]) {
            aux[k] = vetor[i];
            i++;
        } else {
            aux[k] = vetor[j];
            j++;
        }
        k++;
    }
    
    while (i <= meio) {
        aux[k++] = vetor[i++];
    }

    while (j <= fim) {
        aux[k++] = vetor[j++];
    }

    for (i = inicio; i < fim + 1; i++) {
        vetor[i] = aux[i-inicio];
    }
}

void mergeSort(int *vetor, int inicio, int fim) {
    if(inicio < fim) {
        int meio = (inicio + fim) / 2;
        mergeSort(vetor, inicio, meio);
        mergeSort(vetor, meio + 1, fim);
        intercala(vetor, inicio, meio, fim);
    }
}

void showMergeOrder(int *vetor, int tam_vetor, clock_t inicio, clock_t fim, double tempo) {
    inicio = clock();

    mergeSort(vetor, 0, tam_vetor-1);

    fim = clock();

    tempo = ((double) fim - inicio)/CLOCKS_PER_SEC;
    printf("\n\t\tMerge Sort: %lf Segundos - %lf Milissegundos", tempo, tempo*1000);
}
//</!-- Merge Sort -->


//<!-- Quick Sort -->
void reverseQuick(int *vet_a, int *vet_b) {
    int aux;
    aux = *vet_a;
    *vet_a = *vet_b;
    *vet_b = aux;
}

int particiona(int *vetor, int inicio, int fim) {
   int i, j;
   j = inicio;

   for(i = inicio; i < fim - 1; i++) {
       if (vetor[i] <= vetor[fim - 1]) {
            reverseQuick(&vetor[i], &vetor[j]);
            j++;
       }
   }

   if (vetor[j] > vetor[fim - 1]) {
       reverseQuick(&vetor[j], &vetor[fim - 1]);
   }
   
   return j;
}

void quickSort(int *vetor, int inicio, int fim) {
    if (inicio < fim) {
        int pivo = particiona(vetor, inicio, fim);
        quickSort(vetor, inicio, pivo - 1);
        quickSort(vetor, pivo + 1, fim);
    }
}

void showQuickOrder(int *vetor, int tam_vetor, clock_t inicio, clock_t fim, double tempo) {
    inicio = clock();

    quickSort(vetor, 0, tam_vetor);

    fim = clock();

    tempo = ((double) fim - inicio)/CLOCKS_PER_SEC;

    printf("\n\t\tQuick Sort: %lf Segundos - %lf Milissegundos", tempo, tempo*1000);

}
//</!-- Quick Sort -->

//<!-- Heap Sort -->
void reverseHeap(int *vet_a, int *vet_b) {
    int aux;
    aux = *vet_a;
    *vet_a = *vet_b;
    *vet_b = aux;
}

void heapCreate(int *vetor, int n, int tam_vetor) {
    int maior, esquerda, direita;
    maior = n;
    esquerda = 2 * n + 1;
    direita = 2 * n + 2;

    if (esquerda < tam_vetor && vetor[esquerda] > vetor[n]) {
        maior = esquerda;
    }

    if (direita < tam_vetor && vetor[direita] > vetor[maior]) {
        maior = direita;
    }

    if (maior != n) {
        reverseHeap(&vetor[n], &vetor[maior]);
        heapCreate(vetor, maior, tam_vetor);
    }
}

void heapSort(int *vetor, int tam_vetor) {
    int i;
    for (i = (tam_vetor/2) - 1; i >= 0; i--) {
        heapCreate(vetor, i, tam_vetor);
    }
    for (i = tam_vetor - 1; i > 0; i--) {
        reverseHeap(&vetor[0], &vetor[i]);
        heapCreate(vetor, 0, i);
    }
}

void showHeapOrder(int *vetor, int tam_vetor, clock_t inicio, clock_t fim, double tempo) {
    inicio = clock();

    heapSort(vetor, tam_vetor);

    fim = clock();

    tempo = ((double) fim - inicio)/CLOCKS_PER_SEC;

    printf("\n\t\tHeap Sort: %lf Segundos - %lf Milissegundos\n\n", tempo, tempo*1000);

}
//</!-- Heap Sort -->


//************************//
// FIM MÉTODOS DE ORDENAÇÃO
//***********************//

//Crescente
void vetorCrescente(int *vetor, int tam_vetor) {
    int i;
    for(i = 0; i < tam_vetor; i++) {
        vetor[i] = i+1;
        // printf("%d ", vetor[i]);
    }
    return 0;
}

//Decrescente
void vetorDecrescente(int *vetor, int tam_vetor) {
    int i, aux;
        aux = tam_vetor;
    
    for(i = 0; i < tam_vetor; i++) {
        vetor[i] = aux;
        aux--;
        // printf("%d ", vetor[i]);
    }
}
//Aleatório
void vetorAleatorio(int *vetor, int tam_vetor, int valor) {
    int i;
    for(i = 0; i < tam_vetor; i++) {
        vetor[i] = rand() % valor; //Usando a função Rand pra gerar valores aleatórios
        // printf("%d ", vetor[i]);
    }
}

//Função Opções Geração de Vetores 
void opcoesVetores(int opcao, int tam_vetor, int *vetor, clock_t inicio, clock_t fim, double tempo) {
    int valor = 15000;
    //Escolhe metodo Vetor Crescente
    if(opcao == 1) {
        vetorCrescente(vetor, tam_vetor);
        showMergeOrder(vetor, tam_vetor, inicio, fim, tempo);
        showQuickOrder(vetor, tam_vetor, inicio, fim, tempo);
        showHeapOrder(vetor, tam_vetor, inicio, fim, tempo);
    }
    //Escolhe metodo Vetor Decrescente
    else if(opcao == 2) {
        vetorDecrescente(vetor, tam_vetor);
        showMergeOrder(vetor, tam_vetor, inicio, fim, tempo);
        showQuickOrder(vetor, tam_vetor, inicio, fim, tempo);
        showHeapOrder(vetor, tam_vetor, inicio, fim, tempo);
    }
    //Escolhe metodo Vetor Aleatório
    else if(opcao == 3) {
        vetorAleatorio(vetor, tam_vetor, valor);
        showMergeOrder(vetor, tam_vetor, inicio, fim, tempo);
        showQuickOrder(vetor, tam_vetor, inicio, fim, tempo);
        showHeapOrder(vetor, tam_vetor, inicio, fim, tempo);
    }
}

int main() {
    clock_t inicio, fim;
    double tempo;
    int tam_vetor, tipo_vetor;

    printf("\n");
    printf("Informe o tamanho do vetor: ");
    scanf("%d", &tam_vetor);
    printf("\n");
    int vetor[tam_vetor];
    printf("Informe o tipo do vetor: \n1 - Vetor Crescente\n2 - Vetor Decrescente\n3 - Vetor Aleatorio\n");
    printf("Escolha a opcao desejada: ");
    scanf("%d", &tipo_vetor);

    //Chama a função opções de vetores
    opcoesVetores(tipo_vetor, tam_vetor, vetor, inicio, fim, tempo);

    return 0;
}