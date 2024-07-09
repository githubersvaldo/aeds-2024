Grafo grafo;

void setup() {
  size(800, 600);
  
  int n = 10;
  int[][] adj = new int[n][n];
  
  for(int i = 0; i < n; i++)
    for(int j = 0; j < n; j++)
      adj[i][j] = random(1) > 0.5 ? int(random(1, 5)) : 0;
  
  grafo = new Grafo(adj);


  for(int i = 0; i < 1000; i++) grafo.atualizar();
  
  background(255);
  grafo.desenhar();
}
