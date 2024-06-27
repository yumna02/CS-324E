void setup() {
  size(600, 600);
}

void draw() {
  color black = #000000;
  color red1 = #100000;
  color red2 = #1c0000;
  color red3 = #2a0000;
  color red4 = #380000;
  color red5 = #460000;
  color red6 = #530000;
  color red7 = #610000;
  color red8 = #6f0000;
  color red9 = #7d0000;
  color red10 = #8b0000;
  color red11 = #9a0000;
  color red12 = #9f0000;
  for(int i = 0; i < 600; i = 50 + i) {
      stroke(red1);
      fill(red1);
      rect(i, i, 50, 50);
      stroke(black);
      fill(black);
      ellipse(i, i, 50, 50);
  }
  for(int i = 50; i < 600; i = 50 + i) {
      stroke(red2);
      fill(red2);
      rect(i, i - 50, 50, 50);
      rect(i - 50, i, 50, 50);
      stroke(red1);
      fill(red1);
      ellipse(i - 50, i, 50, 50);
      ellipse(i, i - 50, 50, 50);
      strokeWeight(2);
      stroke(red12);
      point(i, i);
  }
  for(int i = 100; i < 600; i = 50 + i) {
      stroke(red3);
      fill(red3);
      rect(i, i - 100, 50, 50);
      rect(i - 100, i, 50, 50);
      stroke(red2);
      fill(red2);
      ellipse(i - 100, i, 50, 50);
      ellipse(i, i - 100, 50, 50);
      strokeWeight(1);
      stroke(red11);
      point(i, i);
  }
  for(int i = 150; i < 600; i = 50 + i) {
      stroke(red4);
      fill(red4);
      rect(i, i - 150, 50, 50);
      rect(i - 150, i, 50, 50);
      stroke(red3);
      fill(red3);
      ellipse(i - 150, i, 50, 50);
      ellipse(i, i - 150, 50, 50);
      strokeWeight(0);
      stroke(red10);
      point(i, i);
  }
  for(int i = 200; i < 600; i = 50 + i) {
      stroke(red5);
      fill(red5);
      rect(i, i - 200, 50, 50);
      rect(i - 200, i, 50, 50);
      stroke(red4);
      fill(red4);
      ellipse(i - 200, i, 50, 50);
      ellipse(i, i - 200, 50, 50);
  }
  for(int i = 250; i < 600; i = 50 + i) {
      stroke(red6);
      fill(red6);
      rect(i, i - 250, 50, 50);
      rect(i - 250, i, 50, 50);
      stroke(red5);
      fill(red5);
      ellipse(i - 250, i, 50, 50);
      ellipse(i, i - 250, 50, 50);
  }
  for(int i = 300; i < 600; i = 50 + i) {
      stroke(red7);
      fill(red7);
      rect(i, i - 300, 50, 50);
      rect(i - 300, i, 50, 50);
      stroke(red6);
      fill(red6);
      ellipse(i - 300, i, 50, 50);
      ellipse(i, i - 300, 50, 50);
  }
  for(int i = 350; i < 600; i = 50 + i) {
      stroke(red8);
      fill(red8);
      rect(i, i - 350, 50, 50);
      rect(i - 350, i, 50, 50);
      stroke(red7);
      fill(red7);
      ellipse(i - 350, i, 50, 50);
      ellipse(i, i - 350, 50, 50);
  }
  for(int i = 400; i < 600; i = 50 + i) {
      stroke(red9);
      fill(red9);
      rect(i, i - 400, 50, 50);
      rect(i - 400, i, 50, 50);
      stroke(red8);
      fill(red8);
      ellipse(i - 400, i, 50, 50);
      ellipse(i, i - 400, 50, 50);
  }
  for(int i = 450; i < 600; i = 50 + i) {
      stroke(red10);
      fill(red10);
      rect(i, i - 450, 50, 50);
      rect(i - 450, i, 50, 50);
      stroke(red9);
      fill(red9);
      ellipse(i - 450, i, 50, 50);
      ellipse(i, i - 450, 50, 50);
  }
  for(int i = 500; i < 600; i = 50 + i) {
      stroke(red11);
      fill(red11);
      rect(i, i - 500, 50, 50);
      rect(i - 500, i, 50, 50);
      stroke(red10);
      fill(red10);
      ellipse(i - 500, i, 50, 50);
      ellipse(i, i - 500, 50, 50);
  }
  for(int i = 550; i < 600; i = 50 + i) {
      stroke(red12);
      fill(red12);
      rect(i, i - 550, 50, 50);
      rect(i - 550, i, 50, 50);
      stroke(red11);
      fill(red11);
      ellipse(i - 550, i, 50, 50);
      ellipse(i, i - 550, 50, 50);
  }
}
