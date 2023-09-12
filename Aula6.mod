/*********************************************
 * OPL 22.1.1.0 Model
 * Author: lucas
 * Creation Date: 12 de set de 2023 at 12:10:56
 *********************************************/
 
{string} Ingredientes = ...; // i
{string} Racoes = ...; // j
{string} Nutrientes = ...;  // k

// i x k
int Tabela_Nutricional[Ingredientes][Nutrientes] = ...;

int Demanda[Racoes] = ...;
int Suprimento[Ingredientes] = ...;
float Custo[Ingredientes] = ...;

int Min_Nutrientes[Racoes][Nutrientes] = ...;
int Max_Nutrientes[Racoes][Nutrientes] = ...;

// Quantidade(ton) de ingrediente i para a racao j
dvar float+ x[Ingredientes][Racoes];

minimize
	sum(i in Ingredientes, j in Racoes)
	  Custo[i] * x[i][j];
	  
subject to {
	forall(j in Racoes)
		sum(i in Ingredientes)
		  x[i][j] == Demanda[j];
}

subject to {
	forall(i in Ingredientes)
		sum(j in Racoes)
			x[i][j]	<= Suprimento[i];
}

// Limites de nutrientes
subject to {
	forall(j in Racoes, k in Nutrientes)
		sum(i in Ingredientes)
			x[i][j] * Tabela_Nutricional[i][k] >= Min_Nutrientes[j][k] * Demanda[j];
}


subject to {
	forall(j in Racoes, k in Nutrientes)
		sum(i in Ingredientes)
			x[i][j] * Tabela_Nutricional[i][k] <= Max_Nutrientes[j][k] * Demanda[j];
}

	