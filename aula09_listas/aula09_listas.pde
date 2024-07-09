ListaEncadeada<PVector> lst = new ListaEncadeada<PVector>();


void setup(){
  size(600, 600);
}

void draw(){
  background(255);
  fill(0);
  ellipse(mouseX, mouseY, 50, 50);
  fill(200);
  int n = lst.count();
  for(int i = 0; i < n; i++){
    PVector v = lst.get(i);
    ellipse(v.x, v.y, 50, 50);
    
    text(str(i), v.x, v.y);
  }
}

void mouseClicked(){
  lst.add(new PVector(mouseX, mouseY));
}
