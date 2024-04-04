CorpoCeleste[] sistema = new CorpoCeleste[10]; // Array para armazenar os corpos celestes //<>//
float G = 1; // Constante gravitacional
PVector zero = new PVector(0,0); // Vetor zero para inicialização
float zoom = 1; // Variável para controle de zoom
int dx = 0, dy = 0; // Variáveis para controle de deslocamento

void setup(){
  size(1000, 800); // Define o tamanho da janela
  //fullScreen();
  background(0); // Define a cor de fundo
  
  // Inicializa os corpos celestes
  for(int i = 1; i < sistema.length; i++){
    //PVector pos = new PVector(random(-width/2,width/2), 0); // Posição aleatória
    PVector pos = new PVector(i*800/sistema.length, 0); // Posição distribuída
    PVector vel = new PVector(0, random(-2, 2)); // Velocidade aleatória
    PVector acel = zero.copy(); // Aceleração inicial é zero
    
    sistema[i] = new CorpoCeleste(pos, vel, acel, random(0.1,3)); // Cria um novo corpo celeste
  }
  sistema[0] = new CorpoCeleste(zero, zero, zero, 332900, 100, color(#F7CC2D)); // Cria o Sol

  thread("update"); // Inicia a thread de atualização
}

void update()
{
  int tempo = millis(); // Tempo inicial
  
  while(true){
    int ntempo = millis(); // Tempo atual
    if(ntempo - tempo < 1) continue; // Se o tempo não avançou, continua o loop
    
    atualizaForca(); // Atualiza as forças
    verificaColisao(); // Verifica colisões
    
    // Atualiza a posição e velocidade de cada corpo celeste
    for(int i = 0; i < sistema.length; i++) sistema[i].update((ntempo-tempo)/1000.0); 
    delay(1); // Delay para controle de velocidade de execução
  }
}

void verificaColisao(){
  // Verifica colisões entre todos os pares de corpos celestes
  for(int i = 0; i < sistema.length; i++){
    for(int j = i+1; j < sistema.length; j++){
      CorpoCeleste p1 = sistema[i];
      CorpoCeleste p2 = sistema[j];
        
      float dist = PVector.dist(p1.pos, p2.pos)*2; // Calcula a distância entre os corpos celestes
       
      // Se a distância for menor que a soma dos raios, um dos corpos celestes é desativado
      if(dist < p1.raio + p2.raio)
      {
        if(p1.massa > p2.massa) p2.ativo = false;
        else p1.ativo = false;
      }
    }
  }
}

void atualizaForca(){
  // Zera a força de todos os corpos celestes
  for(int i = 0; i < sistema.length; i++) sistema[i].zeraForca();
    
  // Calcula a força entre todos os pares de corpos celestes
  for(int i = 0; i < sistema.length; i++){
    for(int j = i+1; j < sistema.length; j++){
      CorpoCeleste p1 = sistema[i];
      CorpoCeleste p2 = sistema[j];
        
      if(!p1.ativo || !p2.ativo) continue; // Se algum dos corpos celestes não está ativo, continua o loop
        
      PVector r = PVector.sub(p1.pos,p2.pos); // Calcula o vetor de posição relativa
      float d = r.mag()*50; // Calcula a distância
        
      if (d < 1) continue; // Se a distância é muito pequena, continua o loop
       
      // Calcula a força de acordo com a lei da gravitação universal
      PVector f = r.copy().normalize().mult(G * p1.massa * p2.massa / (d * d)); 
          
      // Adiciona a força aos corpos celestes
      p2.adiconaForca(f);
      p1.adiconaForca(f.mult(-1)); 
    }
  } 
}

void draw(){
  translate(width/2+dx, height/2+dy); // Translada o sistema de coordenadas
  scale(zoom); // Aplica o zoom
  background(0); // Limpa o fundo
  for(int i = 0; i < sistema.length; i++) sistema[i].show();  // Desenha os corpos celestes
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount(); // Lê o movimento do scroll do mouse
  if(e < 0) zoom*=2; // Se o scroll foi para cima, aumenta o zoom
  else zoom/=2; // Se o scroll foi para baixo, diminui o zoom
}

void mouseDragged(MouseEvent event){
  dx += mouseX - pmouseX; // Atualiza o deslocamento em x
  dy += mouseY - pmouseY; // Atualiza o deslocamento em y
}
