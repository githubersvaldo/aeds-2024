class CorpoCeleste {
  float raio, massa; // Define o raio e a massa do corpo celeste
  color cor; // Define a cor do corpo celeste
  PVector pos, vel, acel; // Define a posição, velocidade e aceleração do corpo celeste
  Boolean ativo = true; // Define se o corpo celeste está ativo
  ArrayList<PVector> rastro = new ArrayList<PVector>(); // Lista para armazenar o rastro do corpo celeste
  
  // Construtor para criar um corpo celeste com uma cor aleatória e raio proporcional à massa
  CorpoCeleste(PVector pos, PVector vel, PVector acel, float massa){
    this.pos = pos;
    this.vel = vel;
    this.acel = acel;
    this.raio = massa*20;
    this.cor = color((int)random(256),(int)random(256),(int)random(256));
    this.massa = massa;
  }
  
  // Construtor para criar um corpo celeste com cor, raio e massa definidos
  CorpoCeleste(PVector pos, PVector vel, PVector acel, float massa, float raio, color cor){
    this.pos = pos;
    this.vel = vel;
    this.acel = acel;
    this.massa = massa;
    this.raio = raio;
    this.cor = cor;
  }
  
  // Método para zerar a força aplicada ao corpo celeste
  void zeraForca(){
    acel = new PVector(0, 0);
  }
  
  // Método para adicionar uma força ao corpo celeste
  void adiconaForca(PVector forca){
    acel = PVector.add(acel, forca.mult(1/massa));
  }
  
  // Método para atualizar a posição e velocidade do corpo celeste
  void update(float dt){
    vel = PVector.add(vel, PVector.mult(acel, dt));
    pos = PVector.add(pos, PVector.mult(vel,  dt));
    rastro.add(pos);
    
    // Limita o tamanho do rastro a 100 pontos
    if(rastro.size() > 1000) rastro.remove(0);
  }
  
  // Método para exibir o corpo celeste e seu rastro
  void show(){
    if(!ativo) return;
    fill(cor);
    stroke(cor);
    for(int k = 0; k < rastro.size(); k++) point(rastro.get(k).x, rastro.get(k).y);
    stroke(0);
    ellipse(pos.x, pos.y, raio, raio);    
  }
}
