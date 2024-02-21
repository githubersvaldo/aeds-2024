float x = 300, y = 300;
float vx = 5, vy = 2;

void setup(){
  size(600, 600); 
}

void draw(){
  x += vx;
  y += vy;
  
  background(#D1A0A0);
  fill(#82E066);
  
  int d = 50; //diametro
  ellipse(x, y, d, d);
  
  if(x < 0 + d/2 || x > width - d/2) vx = -vx;
  if(y < 0 + d/2 || y > height - d/2) vy = -vy;
}
