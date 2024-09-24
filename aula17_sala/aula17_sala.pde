int numPop = 100;
int numComida = 10;
ArrayList<Organismo> populacao = new ArrayList<Organismo>();
ArrayList<PVector> comida = new ArrayList<PVector>();

void setup(){
  size(600, 600);
  
  for(int i = 0; i < numPop; i++){
    PVector p = new PVector(random(width), random(height));
    populacao.add(new Organismo(p));
  }
  
  criaComida();
}

void criaComida(){
  for(int i = 0; i < numComida; i++){
    PVector p = new PVector(random(width), random(height));
    comida.add(p);
  }
}

void draw(){
  background(255);
  
  for(int i = 0; i < comida.size(); i++){
    PVector p = comida.get(i);
    fill(#AF2929);
    circle(p.x, p.y, 10);
  }
  
  for (int i = populacao.size() - 1; i >= 0; i--) {
    Organismo o = populacao.get(i);
    o.atualiza();
    o.detectaComida();
    o.mostra();
    
    if(o.morreu()) populacao.remove(i);
    o.reproducao();
  }
  if(comida.size() == 0) criaComida();
}
