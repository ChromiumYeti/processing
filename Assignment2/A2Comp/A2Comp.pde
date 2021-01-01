float x, y, vx, vy, ax, ay;
float r=25;

void setup() {
  size(800, 600);
  x=100; 
  y=100;
  vx=3; 
  vy=1;
  ax=0; 
  ay=0.1;
}

void draw() {
  float ypos = height*0.9; 
  background(200);
  fill(0);
    stroke(128, 0, 0);
  //debugging text
  text(mouseX, 20, 20);
  

  
  fill(255, 0, 0);

  ellipse(x, y, r*2, r*2);

  vx+=ax;
  vy+=ay;
  x+=vx;
  y+=vy;

  if (x >width-r || x <0+r) {
    vx = -vx;
  }
  if (y >height-r || y <0+r) {
    vy = -vy;
  }
  
    
  fill(0, 255, 0);
  rectMode(CENTER);
  //rect(mouseX, ypos, 80,20);
  rect(mouseX, ypos, 80, 20);
}
