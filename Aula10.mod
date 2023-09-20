/*********************************************
 * OPL 22.1.1.0 Model
 * Author: lucas
 * Creation Date: 20 de set de 2023 at 09:44:28
 *********************************************/
// PCV (simplficado)
 
tuple Coordenada {
   int x;
   int y;
}

{Coordenada} Cidades = {};
int TotalCidades = 31; // Limite de 1000 variáveis nesta versão
float MatrizDistancia[Cidades][Cidades];

dvar boolean x[Cidades][Cidades]; // Variavél que indica se o caixeiro irá da cidade i para a j

// Pré processamento
execute {
  
  	function GeraCidades(limiteX, limiteY) {
		for (i = 0; i < TotalCidades; i++) {
			Cidades.add(Opl.rand(limiteX), Opl.rand(limiteY));
		}
  	}
  	
  	function CalculaDistancia(cidadeA, cidadeB) {
  	 	var deltaX = cidadeA.x - cidadeB.x;
  	 	var deltaY = cidadeA.y - cidadeB.y;
  		return Math.sqrt(Math.pow(deltaX, 2) + Math.pow(deltaY, 2));
  	}
  	
  	GeraCidades(100, 100);
	for (var i in Cidades) {
  		for (var j in Cidades) {
  		  MatrizDistancia[i][j] = CalculaDistancia(i, j);
  		}
  	}
}

minimize 
	sum(i in Cidades, j in Cidades)
		MatrizDistancia[i][j] * x[i][j];

subject to {
	forall(i in Cidades) {
		sum(j in Cidades : i != j)
			x[i][j] == 1;
	}
}
