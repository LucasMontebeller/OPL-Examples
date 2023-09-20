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
Coordenada PrimeiraCidade;
int TotalCidades = 31; // Limite de 1000 variáveis nesta versão
float MatrizDistancia[Cidades][Cidades];

dvar boolean x[Cidades][Cidades]; // Variavél que indica se o caixeiro irá da cidade i para a j
dvar float+ u[Cidades]; // Variável auxiliar para controle de subRotas

// Pré processamento
execute {
  
  	function GeraCidades(limiteX, limiteY) {
		for (i = 0; i < TotalCidades; i++) {
		  	var x = Opl.rand(limiteX);
		  	var y = Opl.rand(limiteY);
		  	if (i == 0) {
		  		PrimeiraCidade.x = x;
		  		PrimeiraCidade.y = y;
		  	}
			Cidades.add(x, y);
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

//dexpr float Caminho = sum(i in Cidades, j in Cidades : i != j) MatrizDistancia[i][j] * x[i][j];

minimize 
	sum(i in Cidades, j in Cidades : i != j) 
		MatrizDistancia[i][j] * x[i][j];

subject to {
	// Restrição de saida
	forall(i in Cidades) {
		sum(j in Cidades : i != j)
			x[i][j] == 1;
	}
	
	// Restrição de entrada
	forall(j in Cidades) {
		sum(i in Cidades : i != j)
			x[i][j] == 1;
	}
	
	// Eliminar Subrotas
	forall(i in Cidades, j in Cidades : i != PrimeiraCidade && j != PrimeiraCidade && i != j) {
		u[i] - u[j] + TotalCidades * x[i][j] <= TotalCidades - 1;
	}
}
