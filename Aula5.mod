/*********************************************
 * OPL 22.1.1.0 Model
 * Author: lucas
 * Creation Date: 12 de set de 2023 at 11:56:43
 *********************************************/
 
 // Importando dados do arquivo .dat
{string} Usinas = ...;
{string} Cidades = ...;

int Custo[Usinas][Cidades] = ...;
int KWh_Hora[Usinas] = ...;
int Demanda_Pico[Cidades] = ...;

// Milhões de KWh da usina i para cidade j
dvar float+ x[Usinas][Cidades];

minimize 
	sum(i in Usinas, j in Cidades)
	  	Custo[i][j] * x[i][j];
	  
subject to {
  	forall(i in Usinas)
		sum(j in Cidades)
			x[i][j] <= KWh_Hora[i];
}

subject to {
  	forall(j in Cidades)
		sum(i in Usinas)
			x[i][j] >= Demanda_Pico[j];
}