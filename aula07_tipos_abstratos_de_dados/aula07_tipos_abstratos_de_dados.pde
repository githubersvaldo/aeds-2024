Planeta[] sistema = new Planeta[5];

void setup(){
  size(600, 600);
  for(int i = 0; i < sistema.length; i++){
    sistema[i] = new Planeta(random(160,300), 0, random(-10,10));
  }
}


void draw(){
  translate(300, 300);
  background(0);
  fill(#FFED4B);
  ellipse(0, 0, 150, 150);
  
  for(int i = 0; i < sistema.length; i++){
    sistema[i].update();
    sistema[i].show();
  }
  
  
}
