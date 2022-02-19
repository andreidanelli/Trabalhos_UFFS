#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
    int ano;
    char modelo[40];
} Veiculo;

//Procura o maior ano do veículo
int SearchMaior(Veiculo veiculos[], int n) {
    int maior = veiculos[0].ano;
    int i;

    for (i = 1; i < n; i++) {
        if (veiculos[i].ano > maior) {
            maior = veiculos[i].ano;
        }
    }
    return maior;
}

void countingSort(Veiculo veiculos[], int n, int pos) {
    int aux[n], digito, i;
    char aux2[15][40];
    int count[15] = {0};

    for (i = 0; i < n; i++) {
        digito = (veiculos[i].ano / pos) % 15;
        count[digito]++;
    }

    for (i = 1; i < 15; i++) {
        count[i] += count[i - 1];
    }

    for (i = n - 1; i >= 0; i--) {
        digito = (veiculos[i].ano / pos) % 15;
        aux[count[digito] - 1] = veiculos[i].ano;
        strcpy(aux2[count[digito] - 1], veiculos[i].modelo);
        count[digito]--;
    }

    for (i = 0; i < n; i++) {
        veiculos[i].ano = aux[i];
        strcpy(veiculos[i].modelo, aux2[i]);
    }

}

void radixSortOrder(Veiculo veiculos[], int n) {
    int pos;
    int max = SearchMaior(veiculos, n);
    for (pos = 1; max / pos > 0; pos *= 15) {
        countingSort(veiculos, n, pos);
    }
}

int main() {
    int i;
    int ano_veiculo[15] = {2009,2002,2005,2006,2004,2001,2003,2007,2010,2015,2016,2013,2011,2019,2012};
    char modelo_veiculo[15][40] = {{"Volkswagen Gol"}, {"Fiat Uno"}, {"Hyundai HB20"}, {"Chevrolet Onix"}, {"Ford KA"}, 
    {"Toyota Hilux"}, {"Toyota Corolla"}, {"Volkswagen Golf"}, {"Fiat 500"}, {"Nissan Frontier"}, {"Chevrolet Cruze"},
    {"Chevrolet Cobalt"}, {"Honda Civic"}, {"Volkswagen Jetta"}, {"Citroen C4"}};


    Veiculo veiculos[15];

    //Atribui os dados na struct conforme os indices
    for(i = 0; i < 15; i++) {
        veiculos[i].ano = ano_veiculo[i];
        strcpy(veiculos[i].modelo, modelo_veiculo[i]);
    }

    //Exibe em ordem de inserção
    printf("\nOrdem Aleatoria\n");
    for (i = 0; i < 15; i++) {
        printf("%d - %s\n", veiculos[i].ano, veiculos[i].modelo);
    }

    radixSortOrder(veiculos, 15);

    //Exibe em ordem
    printf("\nOrdenado por Radix Sort\n");
    for (i = 0; i < 15; i++) {
        printf("%d - %s\n", veiculos[i].ano, veiculos[i].modelo);
    }

    return 0;
}