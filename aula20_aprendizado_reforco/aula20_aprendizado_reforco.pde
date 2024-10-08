Jogo jogo;
int pontuacaoMax = 0;

void setup() {
  size(400, 600);
  //frameRate(120);
  jogo = new Jogo();
  
  for(int i = 0; i < 100000000; i++){
    jogo.atualizar();
    if (jogo.fimDeJogo){
      pontuacaoMax = max(pontuacaoMax, jogo.pontuacao);
      jogo.reiniciar();
    }
  }
  println(pontuacaoMax);
}

void draw() {
  jogo.atualizar();
  jogo.desenhar();
  
  if (jogo.fimDeJogo) jogo.reiniciar(); 
}

void keyPressed() {
  if (key == 'r') jogo.reiniciar();
}
