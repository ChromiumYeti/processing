void setup() {
  size(800, 600);
  strokeWeight(1);
  stroke(0);
}

void draw() {
  background(128);
  ellipse(mouseX, mouseY, 50, 50);
  if (mousePressed == true) {
    //fill(random(0, 255), random(0, 255), random(0, 255));
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 80, 80);
  }
  else {
    fill(0, 0, 255);
  }
}
