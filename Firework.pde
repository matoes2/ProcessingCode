class Firework{
  
 float hu = random(255);
 Particle firework;
 boolean exploded = false;
 ArrayList<Particle> particles;
 
 Firework(){
   firework = new Particle(random(-width/2, width / 2), height/2, hu, true);
   particles = new ArrayList<Particle>();
 }
 
  boolean done(){
  if(exploded && particles.size() == 0){
    return true;
  }
  else{
   return false;
  }
 }
 
 void update(){
  if(!exploded){
  firework.applyForce(gravity);
  firework.update();
  if(firework.velocity.y >= 0){
   exploded = true; 
   explode();
   }
  }
  for(int i = particles.size()-1; i >= 0; i--){
    particles.get(i).applyForce(gravity);
    particles.get(i).update(); 
    if(particles.get(i).done()){
     particles.remove(i); 
    }
  }
 }
 
 void explode(){
  for(int i = 0; i < 100; i++){
   Particle p = new Particle(firework.pos.x, firework.pos.y, hu, false); 
   particles.add(p);
  }
 }
 
 void show(){
   if(!exploded){
  firework.show(); 
   }
   for(int i = 0; i < particles.size(); i++){
     particles.get(i).show();
  }
 }
}