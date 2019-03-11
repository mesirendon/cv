class Birdy {
  float x;
  float y;
  PImage spriteSheet;
  // PImage temp;
  PImage movement[][];
  boolean inMotion;
  int currentDirection;
  float currentFrame;
  final int UP = 0;
  final int DOWN = 2;
  final int LEFT = 1;  
  final int RIGHT = 3;  
  
  Birdy() {
    inMotion = false;
    currentDirection = 1;
    currentFrame = 0;
    x = 300;
    y = 300;
    
    setupSprites();
  }   
  
  void setupSprites() {
    movement = new PImage[4][5];
    spriteSheet = loadImage("bird.jpg");
    // temp = spriteSheet.get(338, 90, 70, 85);
    for(int i = 0; i < 5; i++) {
      movement[0][i] = spriteSheet.get(10 + 100 * i, 12, 86, 75);
      movement[1][i] = spriteSheet.get(10 + 100 * i, 96, 86, 75);
      movement[2][i] = spriteSheet.get(10 + 100 * i, 180, 86, 75);
      movement[3][i] = spriteSheet.get(10 + 100 * i, 276, 86, 75);
    }
    // movement[0][2] = spriteSheet.get(10 + 100 * 2, 12, 86, 75);
  }
  
  void drawBird() {
    // for(int i = 0; i < 5; i++) {
    //   image(movement[0][i], i * 90, 0);  
    //   image(movement[1][i], i * 90, 80);
    //   image(movement[2][i], i * 90, 160);
    //   image(movement[3][i], i * 90, 240);
    // }
    if(inMotion)
      image(movement[currentDirection][1], x, y);
    else
      image(movement[currentDirection][0], x, y);
   }
  
  void updateBird(int xDelta, int yDelta) {
    currentFrame = (currentFrame + 0.5) % 5;
    inMotion = true;
    
    if(xDelta == 0 && yDelta == 0) 
      inMotion = false;
    else if(xDelta == -1)
      currentDirection = LEFT;
    else if(xDelta == 1)
      currentDirection = RIGHT;
    else if(yDelta == -1)
      currentDirection = UP;
    else if(yDelta == 1)
      currentDirection = DOWN;      
      
    x = x + xDelta;
    y = y + yDelta;
  } 
}
