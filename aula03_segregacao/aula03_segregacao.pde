// Declaração da matriz grid para armazenar o estado de cada célula.
int[][] grid;
// Número de células em cada dimensão da grade.
int n = 30;

void setup(){
  size(600, 600); // Define o tamanho da janela de visualização.
  frameRate(100); // Define a taxa de atualização da janela.
  grid = criaGrid(); // Inicializa a grade com valores aleatórios.
}

// Cria e retorna uma matriz n x n com valores aleatórios.
int[][] criaGrid(){
  int[][] m = new int[n][n];
  
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      //m[i][j] = int(random(3)); // Atribui um valor aleatório entre 0 e 2 a cada célula.
      m[i][j] = (random(1) < 0.3)? 1: m[i][j];
      m[i][j] = (random(1) < 0.3)? 2: m[i][j];
    }
  }
  return m;
}

// Desenha a grade na janela de visualização.
void mostraGrid(){
  float l = width / (float)n; // Calcula a largura de cada célula.
  float h = height / (float)n; // Calcula a altura de cada célula.
  
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      stroke(200); // Define a cor das bordas das células.
      
      // Define a cor de preenchimento com base no valor da célula.
      switch(grid[i][j]){
        case 1:
          fill(#63A751); // Cor verde.
          break;
        case 2:
          fill(#5187A7); // Cor azul.
          break;
        default:
          fill(255); // Cor branca.
          break;
      }
      // Desenha o retângulo representando a célula.
      rect(j*l, i*h, l, h);
    }
  }
}

// Calcula o número de vizinhos diretos iguais à célula na posição (i, j).
int vizinhosIguais(int i, int j){
  int soma = -1; // Inicia a contagem excluindo a própria célula.
  for(int ki = -1; ki <= 1; ki++){
    for(int kj = -1; kj <= 1; kj++){
      // Usa o operador módulo para implementar condições de contorno periódicas.
      if(grid[(n + i + ki) % n][(n + j + kj) % n] == grid[i][j]) soma++;
    }
  }
  return soma;
}

// Atualiza o estado da grade com base no número de vizinhos.
void atualizaGrid(){
  int[][] novoGrid = new int[n][n]; // Cria uma nova grade para os estados atualizados.
  
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      if(grid[i][j] == 0) continue; // Ignora células vazias.
      
      int viz = vizinhosIguais(i, j); // Calcula o número de vizinhos iguais.
      if(viz < 3){
        while(true){
          int ki = (int)random(n); 
          int kj = (int)random(n);
          
          // Move a célula para uma nova posição aleatória se estiver vazia.
          if(grid[ki][kj] == 0 && novoGrid[ki][kj] == 0){
            novoGrid[ki][kj] = grid[i][j];
            novoGrid[i][j] = 0;
            break;
          }
        }
      }
      else{
        novoGrid[i][j] = grid[i][j]; // Mantém a célula na mesma posição.
      }
    }
  }
  
  grid = novoGrid; // Atualiza a grade.
}

// A função draw é chamada repetidamente e é responsável por atualizar a visualização.
void draw(){
  mostraGrid(); // Mostra a grade atual na janela.
  atualizaGrid(); // Atualiza o estado da grade.
  
  // Se o mouse é pressionado, reinicializa a grade com valores aleatórios.
  if(mousePressed) grid = criaGrid();
}
