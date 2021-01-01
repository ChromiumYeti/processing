void setup() {
  size(800, 600);
  background(255);
  stroke(0);
  strokeWeight(1);
  fill(128);
  for (int j=0; j<25; j++) {
    line(0, j*25, width, j*25);
    for (int i=1; i<100; i++) {
      rect(i*random(15, 25), j*25, 5, 25);
    }
  }
}
