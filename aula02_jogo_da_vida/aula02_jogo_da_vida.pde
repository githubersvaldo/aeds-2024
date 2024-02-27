int[][] grid;
int n = 100;

void setup(){
  size(600,600);
  frameRate(60);
  grid = criaGrid();
 
}

int[][] criaGrid(){
  int[][] m = new int[n][n];
  
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      m[i][j] = (random(1) > 0.8)? 1 : 0;
    }
  }
  return m;
}

void mostraGrid(){
  float l = width/(float)n;
  float h = height/(float)n;
  
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      stroke(200);
      fill(grid[i][j] == 0 ? 255 : 0);
      rect(j*l, i*h, l, h);
    }
  }
  
}

int vizinhosVivos(int i, int j){
  int soma = 0;
  for(int ki = -1; ki < 2; ki++){
    for(int kj = -1; kj < 2; kj++){
      soma += grid[(n+i+ki)%n][(n+j+kj)%n];
    }
  }
  
  return soma - grid[i][j];
}

void atualizaGrid(){
  int[][] novoGrid = new int[n][n];
  
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      int viz = vizinhosVivos(i,j);
      
      if(grid[i][j] == 1){
        if(viz < 2 || viz > 3) novoGrid[i][j] = 0;
        else novoGrid[i][j] = 1;
      }
      else{
        if(viz == 3) novoGrid[i][j] = 1;
        else novoGrid[i][j] = 0;
      }
    }
  }
  
  grid = novoGrid;
}

void draw(){
  mostraGrid();
  atualizaGrid();
  
  if(mousePressed) grid = criaGrid();
}
