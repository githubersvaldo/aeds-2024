class Planeta {
  float dist, r, ang, omega;
  color cor;
  
  Planeta(float dist, float ang, float omega){
    this.dist = dist;
    this.ang = ang;
    this.omega = omega;
    this.r = random(10,50);
    this.cor = color((int)random(256),(int)random(256),(int)random(256));
  }
  
  void update(){
    ang += omega/frameRate;
    if(ang > 360) ang -= 360;
    if(ang < 0) ang += 360;
  }
  
  void show(){
    fill(cor);
    float x = dist*cos(radians(ang));
    float y = dist*sin(radians(ang));
    ellipse(x, y, r, r);
    println(x + " " + y);
  }
}
