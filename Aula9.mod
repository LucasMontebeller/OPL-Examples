/*********************************************
 * OPL 22.1.1.0 Model
 * Author: lucas
 * Creation Date: 18 de set de 2023 at 16:19:00
 *********************************************/
// Planejamento agregado

{int} Mes = ...;
{string} Tipo_Hora = ...;
float Custo_Estoque = ...;

float Custo_Unitario[Tipo_Hora] = ...;
int Capacidade_Mensal[Tipo_Hora] = ...;
int Demanda[Mes] = [5100, 5200, 5400, 5700, 5800, 5500, 5200, 5400, 5800, 5500, 5300, 5100];

// Unidades produzidas mensalmente
dvar int+ x[Tipo_Hora][Mes];
dvar int+ Estoque[Mes];

minimize
	sum(i in Tipo_Hora, j in Mes)
		((Custo_Unitario[i] * x[i][j]) + (Custo_Estoque * Estoque[j]));

subject to {
  	forall(i in Tipo_Hora, j in Mes)
		x[i][j] <= Capacidade_Mensal[i];
}

subject to {
  	Estoque[1] == 0;
  	
  	// Primeiro mês
  	sum(i in Tipo_Hora)
        x[i][1] - Estoque[1] == Demanda[1];
    // Restante
  	forall(j in Mes : j >= 2)
		sum(i in Tipo_Hora)
			x[i][j] + (Estoque[j-1] - Estoque[j]) == Demanda[j];
}

