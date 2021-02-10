// drag up and down the left edge to zoom
// drag across the bottom edge to rotate
// drag in the middle to pan

enum UIState {
  NEUTRAL, PANNING, SCALING, ROTATING;
}
UIState UIstate;

float viewScale;
float viewX, viewY;
float viewAng, viewCosAng, viewSinAng;

float seed;

void drawCell( int i, int j ) {
  float a = (atan2( j, i ) / TAU + 1.0) % 1.0;
  float r = sqrt( i*i + j*j );
  stroke( (a * 255 + 5*r) % 256.0, 200, 64 * (1.0 + cos( 0.7*r-a*TAU )) + 127 );
  // generate a random value between 0. and 1. based on (i,j)
  float x = abs((sin(i * 23.615709236 + j * 7.019563) * 12345.2834 + seed)) % 1.0;
  if( x >= 0.75 ) {
    line( -0.5, 0, 0.5, 0 );
    line( 0, -0.5, 0, 0.5 );
  } else {
    rotate( TAU/4 * floor(x*2/0.75) );
    arc( -0.5, -0.5, 1, 1, 0, TAU/4 );
    arc( 0.5, 0.5, 1, 1, TAU*0.5, TAU*0.75 );
  }
}

void draw() {
  background(0);
  strokeWeight( 0.25 );
  strokeCap( SQUARE );
  noFill();
  pushMatrix();
  translate( width*0.5, height*0.5 );
  scale( viewScale );
  rotate( viewAng );
  translate( -viewX, -viewY );

  float wrad = (width * 0.5) / viewScale;
  float hrad = (height * 0.5) / viewScale;
  float rad = sqrt( sq(wrad) + sq(hrad) );
  int left = (int)Math.floor( viewX - rad );
  int right = (int)Math.ceil( viewX + rad );
  int top = (int)Math.floor( viewY - rad );
  int bot = (int)Math.ceil( viewY + rad );
  
  for( int j=top; j<=bot; j++ )
    for( int i=left; i<=right; i++ ) {
      pushMatrix();
      translate( i, j );
      drawCell( i, j );
      popMatrix();
    }
  popMatrix();
  //fill( 42, mousePressed ? 255 : 0, 255 );
  //strokeWeight( 1.0 );
  //stroke( 0 );
  //translate( mouseX, mouseY );
  //rotate( -TAU/16 );
  //triangle( 0, 0, -10, 40, 10, 40 );
}

void setup() {
  orientation( PORTRAIT );
  size( 800, 600 );
//  fullScreen();
  
  colorMode( HSB );
  noStroke();
  
  viewScale = width / 20.0;
  viewX = 0.0;
  viewY = 0.0;
  viewAng = 0.0;
  viewCosAng = 1.0;
  viewSinAng = 0.0;
  
  UIstate = UIState.NEUTRAL;
  
  seed = random(1.0);
}

void mousePressed() {
  if( mouseX < width*0.10 )
    UIstate = UIState.SCALING;
  else if( mouseY > height*0.90 )
    UIstate = UIState.ROTATING;
  else
    UIstate = UIState.PANNING;
}

void mouseDragged() {
  if( UIstate == UIState.SCALING ) {
    float dy = 1.0 + (float)(pmouseY - mouseY) / height * 2.0;
    viewScale *= dy;
  } else if( UIstate == UIState.ROTATING ) {
    float da = (float)(pmouseX - mouseX) / height * 2.0;
    viewAng += da;
    viewCosAng = cos( viewAng );
    viewSinAng = sin( viewAng );
  } else if( UIstate == UIState.PANNING ) {
    float tx = (pmouseX - mouseX) / viewScale;
    float ty = (pmouseY - mouseY) / viewScale;
    float dx = viewCosAng * tx + viewSinAng * ty;
    float dy = -viewSinAng * tx + viewCosAng * ty;
    viewX += dx;
    viewY += dy;
  }
}

void mouseReleased() {
  UIstate = UIState.NEUTRAL;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  viewScale /= pow( 1.10, e );
}
