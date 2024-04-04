CorpoCeleste[] sistema = new CorpoCeleste[10];
float G = 1;
PVector zero = new PVector(0,0);

void setup(){
  size(800, 800);
  background(0);
  
  for(int i = 1; i < sistema.length; i++){
    PVector pos = new PVector(random(-width/2,width/2), 0);
    PVector vel = new PVector(0, random(-2, 2));
    PVector acel = zero.copy();
    
    sistema[i] = new CorpoCeleste(pos, vel, acel, random(0.5,3));
  }
  sistema[0] = new CorpoCeleste(zero, zero, zero, 332900, 100, color(#F7CC2D)); //Sol
  
  background(0);
  
  thread("update");
  
}

void update()
{
  int tempo = millis();
  
  while(true){
    int ntempo = millis();
    if(ntempo - tempo < 1) continue;
    
    atualizaForca();
    verificaColisao();
    
    for(int i = 0; i < sistema.length; i++) sistema[i].update((ntempo-tempo)/1000.0); 
    delay(1);
  }
}

void verificaColisao(){
  for(int i = 0; i < sistema.length; i++){
    for(int j = i+1; j < sistema.length; j++){
      CorpoCeleste p1 = sistema[i];
      CorpoCeleste p2 = sistema[j];
        
      float dist = PVector.dist(p1.pos, p2.pos)*2;
       
      if(dist < p1.raio + p2.raio)
      {
        if(p1.massa > p2.massa) p2.ativo = false;
        else p1.ativo = false;
      }
    }
  }
}

void atualizaForca(){
  for(int i = 0; i < sistema.length; i++) sistema[i].zeraForca();
    
  for(int i = 0; i < sistema.length; i++){
    for(int j = i+1; j < sistema.length; j++){
      CorpoCeleste p1 = sistema[i];
      CorpoCeleste p2 = sistema[j];
        
      if(!p1.ativo || !p2.ativo) continue;
        
      PVector r = PVector.sub(p1.pos,p2.pos);
      float d = r.mag()*50;
        
      if (d < 1) continue; // Evite divisão por zero
       
      PVector f = r.copy().normalize().mult(G * p1.massa * p2.massa / (d * d)); // Calcule a força corretamente
          
      p2.adiconaForca(f);
      p1.adiconaForca(f.mult(-1)); 
    }
  } 
}

void draw(){
  translate(width/2, height/2);
  if(mousePressed) background(0);
   //<>//
  for(int i = 0; i < sistema.length; i++) sistema[i].show();  
}
