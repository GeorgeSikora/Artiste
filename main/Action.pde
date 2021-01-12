
abstract class Task {
  Action action;
  int duration;
  Task() {
  }
  void process() {
  }
  void setup() {
  }
  void exit() {
  }
  Task sendAction(Action a) {
    this.action = a;
    return this;
  }
}

class MoveMouse extends Task {
  float tx, ty; // target
  float dx, dy; // delta
  float sx, sy; // start
  MoveMouse(float tx, float ty) {
    this.tx = tx;
    this.ty = ty;
  }
  void setup() {
    this.dx = abs(MouseX - tx);
    this.dy = abs(MouseY - ty);
    this.sx = MouseX;
    this.sy = MouseY;
  }
  void process() {
    //MouseX += (tx - MouseX) * 1./duration * dx * frameRate/FPS;
    //MouseY += (ty - MouseY) * 1./duration * dy * frameRate/FPS;
    MouseX = lerp(sx, tx, map(millis()-action.startTime, 0, action.duration, 0, 1));
    MouseY = lerp(sy, ty, map(millis()-action.startTime, 0, action.duration, 0, 1));
  }
}
class MouseClick extends Task {
  void setup() {
    rbt.mousePress(InputEvent.BUTTON1_MASK);
  }
  void exit() {
    rbt.mouseRelease(InputEvent.BUTTON1_MASK);
  }
}
class MousePress extends Task {
  void setup() {
    rbt.mousePress(InputEvent.BUTTON1_MASK);
  }
}
class MouseRelease extends Task {
  void setup() {
    rbt.mouseRelease(InputEvent.BUTTON1_MASK);
  }
}

class Action {
  boolean alive;
  long startTime = -1;

  Task task;
  int duration;

  Action(Task task, int duration) {
    this.task = task.sendAction(this);
    this.duration = duration;
  }
  Action(Task task) {
    this.task = task.sendAction(this);
    this.duration = 0;
  }
  
  void born() {
    task.setup();
    alive = true;
    startTime = millis();
  }
  void die() {
    alive = false;
  }
  void refresh() {
    task.process();

    if (startTime + duration < millis() && alive) {
      task.exit();
      die();
    }
  }
}
