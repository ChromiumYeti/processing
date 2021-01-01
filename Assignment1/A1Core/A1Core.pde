void setup() {
  size(500, 500);
  background(255);
  stroke(0);

  fill(0, 0, 255);
  rect(50, 50, 200, 100);

  fill(0, 255, 0);
  ellipse(150, 250, 200, 100);

  fill(255, 0, 0);
  triangle(50, 400, 150, 350, 250, 450);

  fill(255, 255, 0);
  beginShape();
  vertex(300, 100);
  vertex(350, 100);
  vertex(350, 50);
  vertex(450, 125);
  vertex(350, 200);
  vertex(350, 150);
  vertex(300, 150);
  endShape(CLOSE);

  //Could put these in a loop if the colour values incremented evenly
  stroke(255, 165, 0);
  strokeWeight(5);
  line(300, 250, 350, 450);

  stroke(0, 255, 0);
  strokeWeight(10);
  line(350, 250, 400, 450);

  stroke(0, 0, 255);
  strokeWeight(15);
  line(400, 250, 450, 450);
}
