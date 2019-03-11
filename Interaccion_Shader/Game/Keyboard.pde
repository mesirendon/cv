boolean keys[];
Bird bird;
// int x;
// int y;

void move() {
  int xDelta = 0;
  int yDelta = 0;
  
  if(keys['w'])
    yDelta--;
  if(keys['s'])
    yDelta++;
  if(keys['a'])
    xDelta--;
  if(keys['d'])  
    xDelta++;
    
  bird.updateBird(xDelta, yDelta);
}
