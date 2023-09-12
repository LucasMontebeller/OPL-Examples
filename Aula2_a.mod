/*********************************************
 * OPL 22.1.1.0 Model
 * Author: lucas
 * Creation Date: 11 de set de 2023 at 13:16:17
 *********************************************/
 
// Tempo --> custo
dvar float+ x1; // minutos de comédia
dvar float+ x2; // minutos de futebol

minimize 
	(0.5 * x1) + (x2);

subject to {
	(7 * x1) + (2 * x2) >= 28; // mulheres
	(2 * x1) + (12 * x2) >= 24; // homens
}