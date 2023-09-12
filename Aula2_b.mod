/*********************************************
 * OPL 22.1.1.0 Model
 * Author: lucas
 * Creation Date: 11 de set de 2023 at 13:56:45
 *********************************************/

/* Variáveis binárias : 
0 : Não retirou o investimento x_j
1 : Retirou
*/

dvar boolean x1;
dvar boolean x2;
dvar boolean x3;
dvar boolean x4;

maximize 
	((16 * x1) + (22 * x2) + (12 * x3) + (8 * x4));
	
subject to {
	(5 * x1) + (7 * x2) + (4 * x3) + (3 * x4) <= 14;
} 