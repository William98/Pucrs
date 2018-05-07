#include <stdio.h>
#define LINHA  4
#define COLUNA 5

int ANOS[LINHA][COLUNA] = {
	2018,2016,2014,2012,2010,
	1980,1979,1978,1977,1976,
	1968,1966,1964,1962,1960,
	1948,1946,1944,1942,1940};

int copa_cnt, olim_cnt = 0;
int copa_anos[COLUNA]  = {0,0,0,0,0};
int olim_anos[COLUNA]  = {0,0,0,0,0};

void imprimir() {
	int i;
	printf("Total de Copas do Mundo: %d", copa_cnt);
	printf("\nOs anos das Copas do Mundo foram: ");
  for(i = 0; i < COLUNA; i++){
		if(copa_anos[i] != 0){
			printf("%d,", copa_anos[i]);
		}
	}
	printf("\nTotal de Olimpiadas: %d", olim_cnt);
	printf("\nOs anos das Olimpiadas foram: ");
  for(i = 0; i < COLUNA; i++){
		if(olim_anos[i] != 0){
			printf("%d,", olim_anos[i]);
		}
	}
}

int f_copa(int l, int c){
	int a = ANOS[l][c];
	if ((2018-a) % 4 == 0)
		return a;
	else
		return 0;
}

int f_olimpiada(int l, int c){
	int a = ANOS[l][c];
	if ((((2020-a) % 4 == 0) && (a != 1916) && (a != 1940) && (a != 1944)) || (a == 1906))
		return a;
	else
		return 0;
}

int main() {
  int l, i, tmp;

  do{
	  printf("Qual linha deseja verificar?");
		scanf("%d", &l);
  }while(l >= LINHA);

  for(i = 0; i < COLUNA; i++){
		tmp = f_copa(l, i);
		if(tmp){
			copa_anos[copa_cnt] = tmp;
			copa_cnt++;
		}
		tmp = f_olimpiada(l, i);
		if(tmp){
			olim_anos[olim_cnt] = tmp;
			olim_cnt++;
		}
	}

	imprimir();

	return 0;
}
