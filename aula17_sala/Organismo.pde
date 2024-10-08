class Organismo{
  float[] dna;
  PVector pos;
  PVector vel;
  PVector velOrig;
  
  float percepcao;
  float velMax;
  float tam;
  
  
  float vida = 100;
  
  Organismo(float[] dna, PVector pos){
     this.dna = dna;
     this.pos = pos;
     
     this.vel = new PVector(random(-1,1), random(-1,1));
     velOrig = vel;
     
     percepcao = map(dna[0], 0, 1, 0, 50);
     velMax = map(dna[1], 0, 1, 1, 5);
     tam = map(dna[2], 0, 1, 10, 20);
  }
  
  Organismo(PVector pos){
    dna = new float[3];
    for(int k = 0; k < dna.length; k++) dna[k] = random(1);
      
    this.pos = pos;
       
    this.vel = new PVector(random(-1,1), random(-1,1));
    velOrig = vel;
    percepcao = map(dna[0], 0, 1, 0, 50);
    velMax = map(dna[1], 0, 1, 1, 5);
    tam = map(dna[2], 0, 1, 10, 20);
  }
  
  void atualiza(){
    pos.add(vel);
    if(pos.x > width){
      pos.x = width;
      vel.x = -vel.x;
    }
    if(pos.x < 0){
      pos.x = 0;
      vel.x = -vel.x;
    }
    if(pos.y > height){
      pos.y = height;
      vel.y = -vel.y;
    }
    if(pos.y < 0){
      pos.y = 0;
      vel.y = -vel.y;
    }
    vida -= 0.5;
  }
  void mostra(){
    fill(map(dna[1], 0, 1, 0, 255));
    circle(pos.x, pos.y, tam);
  }
  
  boolean morreu(){
    return vida < 0; 
  }
  
  void detectaComida(){
    PVector prox = null;
    float dist = 1000000;
    for(int i = 0; i < comida.size(); i++){
      PVector p = comida.get(i);
      float d = pos.dist(p);
      
      if(d <= percepcao && d < dist){
        prox = p;
        dist = d;
      }
    }
    
    if(prox != null){
      PVector dir = PVector.sub(prox, pos).setMag(velMax);
      vel = dir;
      
      if(dist < tam){
        vida += 50;
        comida.remove(prox);
        vel = velOrig;
      }
    }
  }
  
  void reproducao(){
    if(random(1) < 0.001 && vida > 50){
      float[] novoDna = new float[3];
      arrayCopy(dna, novoDna);
      
      for(int k = 0; k < novoDna.length; k++)
        if(random(1) < 0.5) 
          novoDna[k] = 
            constrain(novoDna[k] + random(-0.1,0.1), 0, 1);
      
      populacao.add(new Organismo(novoDna, pos));
    }
  }
  
  
}
