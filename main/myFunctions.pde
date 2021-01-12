
void drawCircle(int x, int y, int r, int points, int actDelay) {
  
  actions.add(new Action(new MoveMouse(x+r, y), actDelay));
  
  actions.add(new Action(new MousePress()));
  for (float i = 0; i <= TWO_PI; i += TWO_PI/points) {
    actions.add(new Action(new MoveMouse(x + r * cos(i), y + r * sin(i)), actDelay));
  }
  actions.add(new Action(new MouseRelease()));
}

void drawCross(int x, int y, int w, int h, int actDelay) {

  actions.add(new Action(new MoveMouse(x, y), actDelay));

  actions.add(new Action(new MousePress()));
  actions.add(new Action(new MoveMouse(x +w, y +h), actDelay));
  actions.add(new Action(new MouseRelease()));

  actions.add(new Action(new MoveMouse(x +w, y), actDelay));

  actions.add(new Action(new MousePress()));
  actions.add(new Action(new MoveMouse(x, y +h), actDelay));
  actions.add(new Action(new MouseRelease()));
}

void pickRandomColor() {
  selectColor((int)random(11), (int)random(2));
  actions.add(new Action(new MouseClick()));
}

void selectColor(int col, int row) {
  println(col, row);
  int tx = 815 + col*20;
  int ty = 60 + row*20;
  actions.add(new Action(new MoveMouse(tx, ty), 100));
}
