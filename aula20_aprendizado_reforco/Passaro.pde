class Passaro {
  float y, velocidade;
  
  Passaro(float alturaInicial) {
    y = alturaInicial;
    velocidade = 0;
  }
  
  void atualizar(float gravidade) {
    velocidade += gravidade;
    y += velocidade;
  }
  
  void pular(float forcaPulo) {
    velocidade = forcaPulo;
  }
  
  void desenhar() {
    fill(255, 255, 0);
    ellipse(100, y, 30, 30);
  }
}
