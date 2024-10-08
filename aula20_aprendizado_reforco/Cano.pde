class Cano {
  float x, abertura;
  
  Cano(float larguraTela) {
    x = larguraTela;
    abertura = random(100, height - 100);
  }
  
  void atualizar(float velocidade) {
    x -= velocidade;
  }
  
  void desenhar() {
    fill(0, 255, 0);
    rect(x, 0, 50, abertura - 75);
    rect(x, abertura + 75, 50, height - abertura - 75);
  }
  
  boolean foraDoEcra() {
    return x < -50;
  }
}
