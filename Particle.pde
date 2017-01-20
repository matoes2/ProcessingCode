class Particle{
 PVector pos;
 PVector velocity;
 PVector acc;
 float lifespan;
 boolean Firework;
 
 //boolean seed = false;
 
 float hu;
 
 Particle(float x, float y, float h, boolean firework){
  hu = h;
  Firework = firework;
  pos = new PVector(x, y);
  if(Firework){
   velocity = new PVector(0, random(-15, -5)); 
  }
  else{
   velocity = PVector.random2D();
   velocity.mult(random(2, 10));
  }
  acc = new PVector(0, 0);
  
  //seed = true;
  lifespan = 255.0;
 }
 
 void applyForce(PVector force){
  acc.add(force); 
 }
 
 void update(){
  if(!Firework){
    velocity.mult(0.85);
    lifespan -= 4;
   }
  velocity.add(acc);
  pos.add(velocity);
  acc.mult(0);
 }
 
 boolean done(){
  if(lifespan < 0){
   return true;
  }
  else{
   return false; 
  }
 }
 
 void show(){
   if(!Firework){
     strokeWeight(2);
     stroke(hu, 255, 255, lifespan);
   }
   else{
    strokeWeight(4);
    stroke(hu, 255, 255); 
   }
   //pushMatrix();
   //translate(pos.x, pos.y, pos.z);
  //point(0, 0); 
  //popMatrix();
}
}