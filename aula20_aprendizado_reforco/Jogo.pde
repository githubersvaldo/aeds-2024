class Jogo {
  Passaro passaro;
  Cano cano;
  AgenteRL agente;
  
  float gravidade = 0.6;
  float forcaPulo = -5;
  float velocidadeCano = 2;
  
  int pontuacao;
  boolean fimDeJogo;
  int quadroAtual;
  int quadroUltimaAcao;
  String estadoUltimaAcao; 
  int ultimaAcao;
  
  Jogo() {
    passaro = new Passaro(height / 2);
    cano = new Cano(width);
    agente = new AgenteRL(0.1, 0.99, 1.0, 0.01, 0.001);
    reiniciar();
  }
  
  void reiniciar() {
    passaro = new Passaro(height / 2);
    cano = new Cano(width);
    pontuacao = 0;
    fimDeJogo = false;
    quadroAtual = 0;
    quadroUltimaAcao = 0;
    estadoUltimaAcao = obterEstado();
    ultimaAcao = 0;
  }
  
  String obterEstado() {
    int canoX =  round(map(cano.x, 0, width, 0, 10));
    int aberturaErro = round(map(cano.abertura - passaro.y, 0, height, 0, 20));
    return  canoX + "," + aberturaErro;
  }
  
  void atualizar() {
    quadroAtual++;
    
    // Ação do RL
    if (quadroAtual - quadroUltimaAcao >= 5) {
      
      // Atualizar valor Q após a ação
      float recompensa = fimDeJogo ? -100 : 1;
      String estadoAtual = obterEstado();
      agente.atualizarValorQ(estadoUltimaAcao, ultimaAcao, recompensa, estadoAtual);
      
      ultimaAcao = agente.escolherAcao(estadoAtual);
      if (ultimaAcao == 1) passaro.pular(forcaPulo);
      
      estadoUltimaAcao = estadoAtual;
      quadroUltimaAcao = quadroAtual;  
    }
    
    passaro.atualizar(gravidade);
    cano.atualizar(velocidadeCano);
    
    // Verifica colisão
    if ((abs(100 - cano.x) < 25 && (passaro.y < cano.abertura - 75 || passaro.y > cano.abertura + 75)))
      fimDeJogo = true;
    
    
    if(passaro.y > height || passaro.y < 0)
      fimDeJogo = true;//passaro.y = constrain(passaro.y, 0, height);
    
    // Atualiza pontuação e cria novo cano
    if (cano.foraDoEcra()) {
      cano = new Cano(width);
      pontuacao++;
    }
  }
  
  void desenhar() {
    background(135, 206, 235);
    surface.setTitle(estadoUltimaAcao);
    
    passaro.desenhar();
    cano.desenhar();
    
    // Exibe pontuação
    fill(0);
    textSize(32);
    text("Pontuação: " + pontuacao, 10, 40);
    
    if (fimDeJogo) {
      text("Fim de Jogo", width/2 - 70, height/2);
    }
  }
}
