/*********************************************
 * OPL 22.1.1.0 Model
 * Author: lucas
 * Creation Date: 11 de set de 2023 at 11:54:34
 *********************************************/
 
// variaveis de decisão
dvar int+ x1;
dvar int+ x2;

// funcao objetivo
maximize 
	(27*x1 + 21*x2) - (10*x1 + 9*x2) - (14*x1 + 10*x2);
	
// restricoes
subject to {
  2*x1 + x2 <= 100;
  x1 + x2 <= 80;
  x1 <= 40;
}