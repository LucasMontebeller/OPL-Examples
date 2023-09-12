/*********************************************
 * OPL 22.1.1.0 Model
 * Author: lucas
 * Creation Date: 11 de set de 2023 at 14:10:42
 *********************************************/
 
 // Resolvendo o Ex2 na forma de soma:
{string} Sexo = {"Homem", "Mulher"};
{string} Evento = {"Comédia", "Futebol"};

int Acessos[Sexo][Evento] = [[2, 12], [7, 2]];
float Minutos[Evento] = [0.5, 1];
int AcessoMinimo[Sexo] = [24, 28];
 
dvar float+ x[Evento];

minimize 
	sum(e in Evento)
	  Minutos[e] * x[e];
	  
subject to {
	forall(s in Sexo)
//	  ct:
	  	sum(e in Evento)
	 		Acessos[s][e] * x[e] >= AcessoMinimo[s];
}