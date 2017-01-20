import peasy.*;

ArrayList<Firework> fireworks;
PVector gravity = new PVector(0, 0.2);;
//PeasyCam cam;
void setup(){
  size(1440, 2560, P2D); 
  //cam = new PeasyCam(this, 500);
  colorMode(HSB);
  fireworks = new ArrayList<Firework>();
  stroke(255);
  strokeWeight(4);
  background(0);
}

void draw(){
  background(0, 0, 0, 25);
  if(random(1) < 0.03){
    
  fireworks.add(new Firework());
  
  }
  for(int i = fireworks.size()- 1; i >= 0; i--){
  fireworks.get(i).update();
  fireworks.get(i).show();
  if(fireworks.get(i).done()){
   fireworks.remove(i); 
  }
  }
  //println(fireworks.size());
}