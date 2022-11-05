Firework [] leaf;
Firework [] test; // not used
boolean keepLooping = false;
boolean keyLoop = false;
int j = 0;
int c;

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(0);

  if (mousePressed || keepLooping) {
    if (j <= 150) keepLooping = true;
    else {
      keepLooping = false;
      j = 0;
    }

    for (int i = 0; i < leaf.length; i++) {
      leaf[i].show();
      leaf[i].move();
    }
    j++;
  }
  System.out.println(c);
}

void keyPressed() { // currently has no function
  //background(0);
  //if (key == ENTER || keyLoop) {
  //  if (j <= 100) keyLoop = true;
  //  else {
  //    keyLoop = false;
  //    j = 0;
  //  }
    
  //  for (int i = 0; i < leaf.length; i++) {
  //    leaf[i].show();
  //    leaf[i].step();
  //  }
  //  j++;
  //}
}

void mousePressed() {
  c++;
  j = 0;

  //test = new Firework[50];
  //for (int i = 0; i < leaf.length; i++)
  //  test[i] = new Firework[100];



  leaf = new Firework[150];
  for (int i = 0; i < leaf.length - 30; i++)
    leaf[i] = new Firework(mouseX, mouseY);
  for (int i = leaf.length - 30; i < leaf.length; i++)
    leaf[i] = new Slower(mouseX, mouseY);
}

class Firework {
  double myX, myY, myAngle, myV;
  int myC, mySize, stepNum;


  Firework(int x, int y) {
    myX = x;
    myY = y;
    myC = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySize = (int)(Math.random()*3 + 2);
    myAngle = (Math.random()*2*Math.PI);
    myV = (Math.random()*10) + 5;
    stepNum = 0;
  }

  void show() {
    fill(myC);
    ellipse((float)myX, (float)myY, mySize, mySize);
  }

  void move() {
    myX += Math.cos(myAngle) * myV;
    myY += Math.sin(myAngle) * myV + stepNum/2;
    stepNum++;
  }
}

class Slower extends Firework { // Oddball particle
  Slower(int x, int y) {
    super(x, y);
    myC = color(255, 255, 255);
    mySize = (int)(Math.random()*10 + 7);
  }
  
  void move() {
    myX += Math.cos(myAngle) * myV/1.5;
    myY += Math.sin(myAngle) * myV/1.5 + stepNum/2;
    if(stepNum > 30)
      myY +=  -(stepNum-30);
    stepNum++;
  }
}
