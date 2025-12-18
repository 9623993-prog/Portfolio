// Jack Quinn | 11/11/2025 | BallBounce
ArrayList<Ball> bubbles = new ArrayList<Ball>();

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  // Display All bubbles
  for (int i = 0; i < bubbles.size(); i++) {
    Ball b = bubbles.get(i);
    b.display();
    b.move();
  }
}

void mousePressed() {
  bubbles.add(new Ball(mouseX, mouseY));
}
