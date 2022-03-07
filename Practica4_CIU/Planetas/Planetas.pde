PShape sun, mercury, venus, tierra, luna, marte, fobos, jupiter, saturno, nave;
PImage sunImg, mercuryImg, venusImg, tierraImg, lunaImg, marteImg, fobosImg, jupiterImg, saturnoImg, espacio;
int grado;
int x, y, z;
int px, py, pz;
boolean cerca;

void setup(){
  size(800,534,P3D);
  noStroke();    
  grado = 1;  
  
  px=0;
  py=0;
  pz=0;  
  cerca = false;  
  
  x = 500;
  y = 400;
  z = 100;  
  
  espacio = loadImage("img/espacio3.jpg");  
  
  sunImg = loadImage("img/sun.jpg");
  sun = createShape(SPHERE, 120);
  sun.setTexture(sunImg);
  
  mercuryImg = loadImage("img/mercurio.jpg");
  mercury = createShape(SPHERE, 30); 
  mercury.setTexture(mercuryImg);
  
  venusImg = loadImage("img/venus.jpg");
  venus = createShape(SPHERE, 50); 
  venus.setTexture(venusImg);
  
  tierraImg = loadImage("img/tierra.jpg");
  tierra = createShape(SPHERE, 60); 
  tierra.setTexture(tierraImg);
  
  lunaImg = loadImage("img/luna.jpg");
  luna = createShape(SPHERE, 20); 
  luna.setTexture(lunaImg);
  
  marteImg = loadImage("img/marte.jpg");
  marte = createShape(SPHERE, 40); 
  marte.setTexture(marteImg);
  
  fobosImg = loadImage("img/fobos.jpg");
  fobos = createShape(SPHERE, 15); 
  fobos.setTexture(fobosImg);
  
  jupiterImg = loadImage("img/jupiter.jpg");
  jupiter = createShape(SPHERE, 80); 
  jupiter.setTexture(jupiterImg);
  
  saturnoImg = loadImage("img/saturno.jpg");
  saturno = createShape(SPHERE, 70); 
  saturno.setTexture(saturnoImg);
  
  nave = loadShape("perro/13463_Australian_Cattle_Dog_v3.obj");
  nave.scale(4);  
  camera(width/2.0-px, height/2.0 , height+pz, width/2.0 , height/2.0, 0, 0, 1, 0);
}



void draw(){
  textSize(24);       
  background(espacio);
  
  grado += 1;  
  showPlanets();
  
  if(key == 'c' && cerca == false){
    px=0;
    py=0;
    pz=0;  
    cerca = true;
  }
  
  if(key == 'v' && cerca == true){
    x = 500;
    y = 400;
    z = 100;  
    cerca = false;
  }
    
  if(!cerca){
    controlesNave();
    showNave();  
  }
  
  if(cerca){
    controlesCerca();  
    fill(255);
    textSize(15);
    text("Pulsa las teclas UP, DOWN, LEFT, RIGHT", 35,36);
    text("para mover la camara", 35,56);
  
    text("Pulsa la tecla 'v' para ir al modo lejos", 35,510);
  }
  
}


void controlesNave(){
  camera();  
  if (key == CODED){
    switch(keyCode){
      case UP:
        y -= 2;
        break;
        
      case DOWN:
        y += 2;
        break;
        
      case LEFT:
        x -= 2;
        px -= 2;
        break;
        
      case RIGHT:
        x += 2;
        break;            
    
    }
  }
  
  if(key == 'b'){
    z+=1;
  }
  
  if(key == 'a'){
    z-=1;
  }


}

void controlesCerca(){
   camera(width/2.0+px, height/2.0 , height+pz, width/2.0 , height/2.0, 0, 0, 1, 0);
   if (key == CODED){
    switch(keyCode){
      case UP:
        pz -= 2;
        break;
        
      case DOWN:
        pz += 2;
        break;
        
      case LEFT:
        px -= 2;
        break;
        
      case RIGHT:
        px += 2;
        break;    
    }
  }
  
}


void showPlanets(){
  translate(width/2,height/2, -500);  
  
  //Sol
  pushMatrix();
  rotateY(PI * grado / 500);  
  shape(sun);  
  
  rotateY(-PI * grado / 500); 
  text("Sol",-20,-150); 
  fill(255);
  popMatrix();


  //Mercurio  
  pushMatrix();
  //pointLight(255,  255,  255,  255, 255, 255); 
  rotateY(PI * grado / 200);  
  translate(100, 0, 200);
  shape(mercury);
  
  rotateY(-PI * grado / 200);   
  text("Mercurio",-30,-40);  
  popMatrix();
  
  //Venus
  pushMatrix();
  rotateY(PI * grado / 300);  
  translate(-200, 0, 280);
  shape(venus);  
  
  rotateY(-PI * grado / 300);  
  text("Venus",-30,-80); 
  popMatrix();
  
  //Tierra
  pushMatrix();
  rotateY(PI * grado / 300);
  translate(500, 0, 420);
  shape(tierra);  
  
  rotateY(-PI * grado / 300);  
  text("Tierra",-30,-80);   
  rotateY(PI * grado / 300);
  
  //Luna
  rotateY(PI * grado / 250);    
  translate(0, 0, 100);
  shape(luna);    
  rotateY(-PI * grado / 300);
  rotateY(-PI * grado / 250);    
  text("Luna",-30,-80);  
    
  popMatrix();
  
  //Marte
  pushMatrix();
  rotateY(PI * grado / 300);
  translate(0, 0, 580);
  shape(marte);  
  
  rotateY(-PI * grado / 300);
  text("Marte",-30,-80); 
  rotateY(PI * grado / 300);
  
    //Fobos
    rotateY(PI * grado / -200);
    translate(0, 0, 95);
    shape(fobos); 
   
    rotateY(-PI * grado / 300);
    rotateY(-PI * grado / -200); 
    fill(255);
    text("Fobos",-30,-80);  
  popMatrix();
  
  //Jupiter
  pushMatrix();
  rotateY(PI * grado / 300);
  translate(-500, 0, 720);  
  shape(jupiter);  
  
  rotateY(-PI * grado / 300); 
  text("Jupiter",-30,-100);  
  popMatrix();
  
  //Saturno
  pushMatrix();
  rotateY(PI * grado / 300);
  translate(-1000, 0, 860);  
  shape(saturno);   
  
  rotateY(-PI * grado / 300); 
  text("Saturno",-30,-100);  
  popMatrix(); 
}

void showNave(){
  //Nave  
  fill(255);
  textSize(15);
  text("Pulsa las teclas UP, DOWN, LEFT, RIGHT", 35,36);
  text("'a' y 'b' para mover al perro", 35,56);
  
  text("Pulsa la tecla 'c' para ir al modo cerca", 35,510);
  
  pushMatrix();
  translate(x, y, z);  
  rotateX(radians(90));
  shape(nave); 
  popMatrix();

}
