float[] tempos; 
int nMax = 50; // Quantidade de medições a serem realizadas

void setup() {
  size(800, 600);
  tempos = new float[nMax];
  thread("medir");
}

void draw() {
  background(220);
  int l = width / nMax;
  for (int n = 0; n < nMax; n++) {
    int h = int(tempos[n]*100);
    fill(100, 100, 250);
    rect(n * l, height - h, l, h);
    fill(0);
    textAlign(CENTER);
    text(str(n), n * l, height - h - 10, l, h);
    
    if(int(mouseX/l) == n && mouseY > height - h)
      text(str(tempos[n]), width/2, height/2);
  }
  println(int(mouseX/l));
}

void medir() {
  for (int n = 0; n < nMax; n++) {
    long inicio = millis();
    
    On(n);
    
    long fim = millis(); 
    tempos[n] = (fim - inicio)/1000.0;
  }

}


void O1(int n) {
  delay(1000);
}

void Ologn(int n){
  for(int i = n; i >= 1; i /= 2) delay(100);
}

void On(int n){
  for(int i = 0; i < n; i++) delay(100);
}
  
