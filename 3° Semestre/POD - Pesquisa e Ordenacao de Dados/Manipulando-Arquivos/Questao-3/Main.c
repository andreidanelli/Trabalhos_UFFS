#include <stdio.h>
#include <stdlib.h>

int main() {
    int n, i = 0;
    float n1, n2 = 0;
    char nome[50];

    FILE* file = fopen("alunos.txt", "rt");
    if(file == NULL) {
        printf("Falha ao abrir o arquivo!");
    }

    fscanf(file, "%d", &n);
    fgets(nome, 50, file);  
    for (i = 0; i < n; i++) {
        fgets(nome, 50, file);
        fscanf(file, "%f %f", &n1, &n2);
        if(((n1+n2) / 2) < 7) {
            printf("%s\n", nome);
        }
        fgets(nome, 50, file);
    }
    fclose(file);

    return 0;
}