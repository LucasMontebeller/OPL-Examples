/*********************************************
 * OPL 22.1.1.0 Model
 * Author: lucas
 * Creation Date: 12 de set de 2023 at 09:07:01
 *********************************************/

{string} Usinas = {"u1", "u2", "u3"};
{string} Cidades = {"c1", "c2", "c3", "c4"};

int Custo[Usinas][Cidades] = [[8, 6, 10, 9], [9, 12, 13, 7], [14, 9, 16, 5]];
int KWh_Hora[Usinas] = [35, 50, 40];
int Demanda_Pico[Cidades] = [45, 20, 30, 30];

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