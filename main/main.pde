import java.awt.Robot;
import java.awt.event.InputEvent;

Robot rbt;

ArrayList<Action> actions = new ArrayList<Action>();

long start = 0;

float MouseX = 0, MouseY = 0;

final int FPS = 999;

void setup() {
  size(300, 300);
  frameRate(FPS);

  try {
    rbt = new Robot();
  } 
  catch(Exception e) {
    e.printStackTrace();
  }

  /*
  final int N = 50;
  
  final int MIN_X = 20;
  final int MIN_Y = 160;
  final int MAX_X = displayWidth -20;
  final int MAX_Y = displayHeight -80;
  
  for (int i = 0; i < N; i++) {

    pickRandomColor();
    
    int size = (int)random(100, 400);
    drawCross((int)random(MIN_X, MAX_X-size), (int)random(MIN_Y, MAX_Y-size), size, size, 100); 
  }
  */
  actions.add(new Action(new MoveMouse(displayWidth/2, displayHeight/2), 1000));
  actions.add(new Action(new MouseClick()));
  
    //pickRandomColor();
  drawText("bac", 767, 280);
    //pickRandomColor();
  drawText("cba", 767 +10, 280+10);
    //pickRandomColor();
  drawText("acb", 767 +10 +10, 280+10+10);


  final int N = 0;

  for (int i = 0; i < N; i++) {

    pickRandomColor();
    
    int size = (int)random(1, 444);
    drawCircle(displayWidth/2, displayHeight/2, size, (int)random(1, 64), 100);
  }
  
  frame.setVisible(false); 
}

int actualIndex = 0;

void draw() {

  Action a = actions.get(actualIndex); // Actual Action

  if (a.startTime == -1) {
    a.born();
    println("Borning action " + actualIndex);
  }

  a.refresh();

  if (!a.alive) {
    println("Action " + actualIndex + " died");
    actualIndex++;
    if (actualIndex >= actions.size()) {
      exit();
    }
  }

  rbt.mouseMove((int)(MouseX), (int)(MouseY));
}
