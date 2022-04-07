/*
 Este é um esqueleto que deve ser utilzado como base para implementação da Lista de tarefas;
	- As funções não têm os parâmetros definidos; se necessário, estes devem ser incluídos;
 	- Devem ser respeitados os nomes atribuidos aos métodos e estruturas, porém, novas estruturas e funções podem ser criadas, caso julgue necessário;
	- Faça os includes necessários;
	- A organização das funções fica a critério do programador;
	- Códigos não indentados sofrerão duras penalidades;
	- Não serão toleradas variaveis globais;
	- Caso seja detectado plágio, os grupos envolvidos receberão nota 0.
*/

#include <stdio.h> 
#include <stdlib.h>
#include <string.h>

#define EXIT 10  // valor fixo para a opção que finaliza a aplicação

//Struct que representa a data.
typedef struct {
	int day;
	int month;
}Date;

// Estrutura que contém os campos dos registros das tarefas
typedef struct {
       char nome[50];
       int prioridade;
       Date entrega; 
	   struct task *next; // implemente como lista, como árvore BST, AVL...
	   struct task *prev;
}task;
// Tipo criado para instanciar variaveis do tipo acima
typedef struct{
     task *head;
     task *tail;
}estrutura;

// Apresenta o menu da aplicação e retorna a opção selecionada
int menu(){
     int op=0;
		  printf("\n\n");
          printf("+-------------------------------+\n");
          printf("|      1  Incluir   Tarefa      |\n");
          printf("|      2  Deletar   Tarefa      |\n");
          printf("|      3  Atualizar Tarefa      |\n");
          printf("|      4  Buscar    Tarefa      |\n");
          printf("|      5  Listar    Tarefas     |\n");
          printf("|      10   Sair e Salvar       |\n");
          printf("+-------------------------------+\n");
          printf("Opcao: ");
          scanf("%d",&op);

    return op;
}


//Consulta uma tarefa da lista pelo nome
task *SeekTask(estrutura *E,char TSK_name[50]){

     task *aux;

     	for(aux=E->head;aux!=NULL;aux=aux->next){
		if((strcmp(aux->nome,TSK_name)==0)){
			return aux;
			break;
		}
	}

     return aux;
}

// Permite o cadastro de uma tarefa, Inserindo-a em ordem Alfabética.

task *insTask(estrutura *E, task *T){

    task *aux,*auxx;
     if(E->head!=NULL){
		 for(aux=E->head;aux!=NULL;aux=aux->next){
			if((strcmp(T->nome,aux->nome))<0){
				
				if(aux==E->head){
					if(E->head==E->tail){

						T->next=E->tail;
						E->tail->prev=T;
						E->head=T;
						break;
					}else{

						T->next=E->head;
						E->head->prev=T;
						E->head=T;
						break;
					}
				}else if(aux==E->tail){

					auxx=E->tail->prev;
					auxx->next=T;
					T->prev=auxx;
					T->next=E->tail;
					E->tail->prev=T;
					break;
				}else{

					auxx=aux->prev;
					auxx->next=T;
					T->prev=auxx;
					T->next=aux;
					aux->prev=T;
					break;
				}


			}else if((strcmp(T->nome,E->tail->nome))>0){

				E->tail->next=T;
				T->prev=E->tail;
				E->tail=T;
			}
		 }

     }else{

	     E->head=T;
	     E->tail=T;

     }
return E;
}

//Permite excluir uma tarefa
task *delTask(estrutura *E, char TSK_name[50]){
	printf("Deletando Tarefa... ");
	task *repeat,*aux,*prev=NULL,*pnext;
    aux=SeekTask(E,TSK_name);

	if(aux!=NULL){
		if((aux==E->head)&&(aux==E->tail)){
			E->head=NULL;
			E->tail=NULL;
		}else if(aux==E->head){
			E->head=E->head->next;
			E->head->prev=NULL;
		}else if(aux==E->tail){
			E->tail=E->tail->prev;
			E->tail->next=NULL;
		}else{
			prev=aux->prev;
			prev->next=aux->next;
			pnext=prev->next;
			pnext->prev=prev;
		}
		free(aux);
	}
		
	printf("OK\n");
	return E;
}


// Lista o conteudo da lista de tarefas (todos os campos)
void listTasks(estrutura *E){

     task *aux;
     for(aux=E->head;aux!=NULL;aux=aux->next)
          printf("Tarefa: %s\t\tPrioridade: %d\tEntrega: %02d/%02d\n",aux->nome,aux->prioridade,aux->entrega.day,aux->entrega.month);
     return;
}

// Permite a atualização dos dados de uma tarefa
task *upTask(task *tarefa){

	char TSK_nome[50];
    int TSK_dia,TSK_mes,TSK_prioridade;
	
	do{
			printf("\nDigite a prioridade da tarefa: ");
			scanf("%d",&TSK_prioridade);
	}while((TSK_prioridade!=1)&&(TSK_prioridade!=2)&&(TSK_prioridade!=3));
	
	tarefa->prioridade=TSK_prioridade;
	printf("\nDigite a Data de entrega(dd/mm): ");
	scanf("%d/%d",&TSK_dia,&TSK_mes);
	tarefa->entrega.day=TSK_dia;
	tarefa->entrega.month=TSK_mes;
    return tarefa;
}

//Metodo para salvar as informaões no arquivo
void saveListTask(estrutura *E) {
	task *aux;
	FILE *arquivo = fopen("tarefas.txt", "w");

	for(aux = E->head; aux!=NULL; aux=aux->next) {
		fprintf(arquivo,"%s\n%d\n%02d/%02d\n", aux->nome, aux->prioridade, aux->entrega.day, aux->entrega.month);
	}
	fclose(arquivo);
}

/*Metodo para pegar ultimo elemento da lista
task *getLast(estrutura *E) {
	task *aux;
	for(aux=E;aux->next!=NULL;aux=aux->next);
	return aux;
}
*/

task *readListTask(FILE *arquivo, estrutura *E) {
	task *aux,*novo;
	char nome[50];
	int dia, mes, prioridade = 0;

	while(fscanf(arquivo,"%s\n%d\n%02d/%02d\n", &nome, &prioridade, &dia, &mes) != EOF) {
		novo = (task *) malloc(sizeof(task));
		strcpy(novo->nome, nome);
		novo->prioridade = prioridade;
		novo->entrega.day = dia;
		novo->entrega.month = mes;
		novo->next = NULL;
		novo->prev = NULL;
		E=insTask(E,novo);
	}
	return E;
}

// Programa principal
int main(){	 
    int op, i = 0;
    char TSK_nome[50];
    int TSK_dia,TSK_mes,TSK_prioridade;
    task *tarefa, *aux;
    estrutura *E;

    E = (estrutura *) malloc(sizeof(estrutura));
    E->head = NULL;
    E->tail = NULL;

	FILE *arquivoE = fopen("tarefas.txt", "rt");
	if(arquivoE == NULL) {
		printf("\n\n Sem registros de tarefas\n\n");
	}else {
		E = readListTask(arquivoE, E);
	}
	fclose(arquivoE);

    while (op!=EXIT){

        op=menu();
        switch(op){

            case 1 :

				system("cls");
				printf("\nIncluindo Tarefa...\n");
            	tarefa=(task *)malloc(sizeof(task));
            	do{
					printf("Digite o nome da tarefa: ");
					scanf("%s", &TSK_nome);
				}while((aux=SeekTask(E,TSK_nome))!=NULL);
					strcpy(tarefa->nome,TSK_nome);
				do{
					printf("\nDigite a prioridade da tarefa (1 - Baixa | 2 - Media | 3 - Alta): ");
		            scanf("%d", &TSK_prioridade);
				}while((TSK_prioridade!=1)&&(TSK_prioridade!=2)&&(TSK_prioridade!=3));
	            tarefa->prioridade=TSK_prioridade;
				printf("\nDigite a Data de entrega(dd/mm): ");
	            scanf("%d/%d", &TSK_dia,&TSK_mes);	
	            tarefa->entrega.day=TSK_dia;
	            tarefa->entrega.month=TSK_mes;
	            tarefa->next=NULL;
	            tarefa->prev=NULL;
				
            	E=insTask(E,tarefa);
				printf("\nTarefa Incluida com Sucesso!\n");
            	break;

            case 2 : 
				system("cls");
            	if(E->head!=NULL){
               
	                printf("\nDigite o nome da Tarefa: ");
	                scanf("%s",&TSK_nome);
	                delTask(E,TSK_nome);
                    
                }else{
					printf("Sem dados para Deletar!\n");	
				}
               break;

            case 3 : 
				system("cls");
				printf("Atualizando Tarefa...\n");
				printf("Digite o nome da tarefa a atualizar: ");
				scanf("%s",&TSK_nome);
				aux=SeekTask(E,TSK_nome);
				if(aux!=NULL)
					aux=upTask(aux);
				else
					printf("\nTarefa Inexistente!\n");

				break;
        	case 4 :
				system("cls");
				printf("Buscar Tarefa...\n");
				if(E->head!=NULL){
					printf("Digite o nome da tarefa: ");
					scanf("%s",&TSK_nome);
					aux=SeekTask(E,TSK_nome);
					printf("\nTarefa:%s\t\tPrioridade:%d\tEntrega:%02d/%02d\n",aux->nome,aux->prioridade,aux->entrega.day,aux->entrega.month);
				}else
					printf("\nLista de Tarefas Vazia!\n");
			break;
			  
            case 5 : 
				system("cls");
				printf("\nListando Tarefas...\n");
				if(E->head!=NULL)
					listTasks(E);
				else
					printf("\nLista de Tarefas Vazia!\n");
			break;

          }
    }

	printf("\t\nSalvando as suas tarefas!!\n\n");
	//Metodo para salvar as tarefas no arquivo externo
	saveListTask(E);

    return 0;
}


