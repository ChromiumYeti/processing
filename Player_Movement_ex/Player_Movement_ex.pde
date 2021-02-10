int x = 370; 
int y = 370; 
char keypress;

float zoom;

PGraphics pg;

int offsetX=-1000, offsetY=-1000;


void setup() { 
  size(750, 750);

  pg = createGraphics(2000, 2000);

  pg.beginDraw();
  pg.background(0, 244, 2);
  pg.stroke(255);
  pg.line(pg.width*0.5, pg.height*0.5, mouseX, mouseY);

  pg.fill(9, 9, 255);

  pg.rect(pg.width/2+100, pg.height/2+200, 100, 100);

  for (int i = 0; i < 2000; i+=60)
    for (int j = 0; j < 2000; j+=60) {
      pg.fill(9, i, 255);
      pg.ellipse (i, j, 30, 30);
    }
  pg.endDraw();

  zoom = 1;

  smooth ();
}

void draw() {

  background(255);

  fill(128);

  noStroke();

  pushMatrix(); 
  scale(zoom);

  image(pg, offsetX, offsetY); 

  // map(); 
  fill (60, 60, 180); 
  ellipse (x, y, 30, 30);

  popMatrix();
}

void keyPressed() { 
  switch (key) { 
  case 'w': 
    { 
      // y = y - 5;
      offsetY+=5; 
      break;
    } 
  case 's': 
    { 
      //y = y + 5;
      offsetY-=5; 
      break;
    } 
  case 'd': 
    { 
      //x = x + 5; 
      //   if (x>width-100) 
      offsetX-=5;
      break;
    } 
  case 'a': 
    { 
      //x = x - 5; 
      // if (x<100) 
      offsetX+=5;
      break;
    }
  } // switch
}
