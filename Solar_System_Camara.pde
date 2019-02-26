float ang, SpaceAngle, rotacion, px,py,pz,SpaceX, SpaceY, SpaceZ;
float velocidadX, velocidadY;
PImage img;
PImage ship;
float ang2 = random(2,10);
boolean vista_nave;

void setup(){
 size(1093,653, P3D);
 strokeWeight(.25);
 stroke(255);
 ang=0; 
 img = loadImage("./space.jpg");
 ship = loadImage("./falcon.png"); 
 vista_nave=false;
 textSize(25);

}

void draw(){
 background(img);
 text("Press SPACE to change view from Millenium Falcon", width/4, height/8);
 text("Use A,S,W,D to move the ship.",width/4,2*height/8);
 fill(232,132,12); //color
 planetas();
 nave();
 if(vista_nave){
 VistaDeLaNave();
 }
}

void planetas(){
   translate(width/2, height/2,0);
   pushMatrix();
   rotateY(ang*.1);
   sphere(80);
   popMatrix();
  pushMatrix();  
   rotateY(radians(-ang));
   rotateX(radians(ang*2));
  pushMatrix();
    translate(-150, -200,50);
    fill(255,242,65);
    sphere(50);
    translate(-180, -205);
    fill(156,226,255);
    sphere(5);
  popMatrix();
  pushMatrix();
   translate(180,0,20); 
   rotateX(radians(7*ang)); 
   rotateY(radians(-ang));
    fill(241,91,255);
    sphere(25);
   popMatrix();
    pushMatrix();
    translate(100, 100, 15);
    rotateX(radians(ang2));
    fill(251,29,25);
    sphere(30);
    popMatrix();
    pushMatrix();
    translate(-230, -100,3);
    rotateX(radians(-45));
    rotateY(radians(ang));
    fill(148,125,100);
      sphere(30);
    popMatrix();
    pushMatrix();
    translate(378, 92,50);
    rotateX(radians(18));
    fill(55,95,154);
    sphere(44);
    popMatrix();
  popMatrix();
  }
  
  void nave(){
  pushMatrix();
  SpaceAngle+= rotacion;
  SpaceX = SpaceX+ velocidadX* cos(radians(SpaceAngle)) + pz* sin(radians(SpaceAngle));
  SpaceZ= SpaceZ- velocidadX* sin(radians(SpaceAngle)) + pz* cos(radians(SpaceAngle));
  translate(SpaceX, SpaceY+= velocidadY,SpaceZ);
  rotateY(radians(SpaceAngle));
  scale(0.3);
  image(ship,0,0) ;
  if(mousePressed==true){
    translate(ship.width,0,2); 
    scale(-1.0,1.0); 
    image(ship,0,0); 
  }
  popMatrix();
  
  ang= ang+.25;
  if(ang>=360){
  ang = 0;
  } 
  }
 void keyPressed(){
  if (key == 'w') { 
    rotacion = -5;
  } else if
    (key == 's') {
      rotacion = 5;
    } else 
    if (key == 'a'){
      velocidadX = -5;
    }else 
    if
      (key == 'd') {
        velocidadX = 5;
      } else 
    if (key == ' ') {
    if (vista_nave) {
      camera();
    }
    vista_nave = !vista_nave;
  }
}
void keyReleased() {
  if (key == 'a' || key == 'd') {
    velocidadX = 0;
  } else 
  if (key == 'w' || key == 's') {
    rotacion = 0;
  }   
}
 void VistaDeLaNave(){
  camera(width/2 + SpaceX + 200 * sin(radians(SpaceAngle)), height/2 + SpaceY - 100, SpaceZ + 200 * cos(radians(SpaceAngle)), width/2 + SpaceX, height/2 + SpaceY, SpaceZ, 0, 1, 0);
 }
