
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

void drawText(String text, float x, float y) {
  final int SPACE = 50;
  final int SIZE = 200;
  final int DELAY = 300;
  
  int letterX = 0;
  int letterY = 0;
  
  for (int i = 0; i < text.length(); i++) {
    drawLetter(text.charAt(i), x +letterX, y +letterY, SIZE, DELAY);
    letterX  += SIZE + SPACE;
  }
}

void drawLetter(char c, float x, float y, float size, int actDelay) {
  switch(c) {
  case 'a':
    actions.add(new Action(new MoveMouse(x, y +size), actDelay));

    actions.add(new Action(new MousePress()));
    actions.add(new Action(new MoveMouse(x +size/2, y), actDelay));
    actions.add(new Action(new MoveMouse(x +size, y +size), actDelay));
    actions.add(new Action(new MouseRelease()));
    
    actions.add(new Action(new MoveMouse(x, y +size/2), actDelay));
    
    actions.add(new Action(new MousePress()));
    actions.add(new Action(new MoveMouse(x +size, y +size/2), actDelay));
    actions.add(new Action(new MouseRelease()));
    break;
  case 'b':

    actions.add(new Action(new MoveMouse(x, y), actDelay));

    actions.add(new Action(new MousePress()));
    actions.add(new Action(new MoveMouse(x, y +size), actDelay));
    actions.add(new Action(new MoveMouse(x +size/4*3, y +size), actDelay));
    actions.add(new Action(new MoveMouse(x +size, y +size/6*5), actDelay));
    actions.add(new Action(new MoveMouse(x +size, y +size/6*4), actDelay));
    actions.add(new Action(new MoveMouse(x +size/4*3, y +size/6*3), actDelay));
    actions.add(new Action(new MoveMouse(x, y +size/6*3), actDelay));
    actions.add(new Action(new MouseRelease()));
    
    actions.add(new Action(new MoveMouse(x +size/2, y +size/6*3), actDelay));
    
    actions.add(new Action(new MousePress()));
    actions.add(new Action(new MoveMouse(x +size/3*2, y +size/6*2), actDelay));
    actions.add(new Action(new MoveMouse(x +size/3*2, y +size/6*1), actDelay));
    actions.add(new Action(new MoveMouse(x +size/2, y), actDelay));
    actions.add(new Action(new MoveMouse(x, y), actDelay));
    actions.add(new Action(new MouseRelease()));
    
    break;
  case 'c':

    actions.add(new Action(new MoveMouse(x +size, y +size/6*5), actDelay));

    actions.add(new Action(new MousePress()));
    actions.add(new Action(new MoveMouse(x +size, y +size/6*5), actDelay));
    actions.add(new Action(new MoveMouse(x +size/4*3, y +size), actDelay));
    actions.add(new Action(new MoveMouse(x, y +size), actDelay));
    actions.add(new Action(new MoveMouse(x, y), actDelay));
    actions.add(new Action(new MoveMouse(x +size/4*3, y), actDelay));
    actions.add(new Action(new MoveMouse(x +size, y +size/6*1), actDelay));
    actions.add(new Action(new MouseRelease()));
    
    break;
  }
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
