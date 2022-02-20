#include <stdio.h>
#include <stdlib.h>

typedef struct student {
    char name[50];
    float n1, n2;
} Students;

int main() {
    int n, i, j= 0;
    FILE *file;
    file = fopen("alunos.txt", "rt");
    if(file == NULL) {
        printf("Falha ao abrir o arquivo!");
    }

    Students studentsRead;

    fscanf(file, "%d", &n);
    fgets(studentsRead.name, 50, file);
    for(i = 0; i < n; i++) {
        fgets(studentsRead.name, 50, file);
        fscanf(file, "%f %f", &studentsRead.n1, &studentsRead.n2);
        printf("%s\n", studentsRead.name);
        printf("%.1f\n", studentsRead.n1);
        printf("%.1f\n", studentsRead.n2);
    }

    fclose(file);

    return 0;
}