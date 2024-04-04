class CorpoCeleste {
  float raio, massa;
  color cor;
  PVector pos, vel, acel; 
  Boolean ativo = true;
  
  CorpoCeleste(PVector pos, PVector vel, PVector acel, float massa){
    this.pos = pos;
    this.vel = vel;
    this.acel = acel;
    this.raio = massa*20;
    this.cor = color((int)random(256),(int)random(256),(int)random(256));
    this.massa = massa;
  }
  
  CorpoCeleste(PVector pos, PVector vel, PVector acel, float massa, float raio, color cor){
    this.pos = pos;
    this.vel = vel;
    this.acel = acel;
    this.massa = massa;
    this.raio = raio;
    this.cor = cor;
  }
  
  void zeraForca(){
    acel = new PVector(0, 0);
  }
  
  void adiconaForca(PVector forca){
    acel = PVector.add(acel, forca.mult(1/massa));
  }
  
  void update(float dt){
    vel = PVector.add(vel, PVector.mult(acel, dt));
    pos = PVector.add(pos, PVector.mult(vel,  dt));
  }
  
  void show(){
    if(!ativo) return;
    fill(cor);
    ellipse(pos.x, pos.y, raio, raio);
  }
}
