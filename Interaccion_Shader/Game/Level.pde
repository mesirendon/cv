class Level{
  Frame level;
  Frame character,bar;
  PShape topBar, bottomBar;
  PShape characterShape;
  int currentNote;
  float bps, noteLenght;
  PShape [] bottomBars = new PShape [100];
  PShape [] topBars = new PShape [100];
  
  Level(){
    level = new Frame(scene){
      @Override
      public void visit(){
          renderLevel();
      }
    };
    level.setPosition(new Vector(0,110,0));
    setupLevel();
  }
  
  void renderLevel(){
  }
  
  void setupLevel(){
    setupCharacter();
  }
  
  void setupCharacter(){
    character = new Frame(level){
      @Override
      public void visit(){
        renderCharacter();
      }
    };
    int bpm = 60;
    bps = bpm/60;
    float noteLen = 1;
    currentNote = note;
    setupBar(abs(random(12)),1);

    bar = new Frame(level){
      @Override
      public void visit(){
        renderBar();
      }
    };
    characterShape = createShape(SPHERE,10);    
    characterShape.setStroke(false);    
  }
  
void createBar(float time){
  float myRandom = abs(random(12));
  translate(500+40-time,myRandom*10,0);
  box(40,500,20);
  translate(500+40,-500+myRandom*10-40,0);
  box(40,500,20);
    
}
  
 void setupBar(float tone, int distance){
   for (int i = 0; i<100; i++){
    float myRandom = abs(random(10)); 
    bottomBars[i] = createShape(BOX,40,500,20);
    bottomBars[i].setStroke(false);
    topBars[i] = createShape(BOX,40,500,20); 
    topBars[i].setStroke(false);
    bottomBars[i].translate(500+distance*40 + i*300,100+myRandom*10,0);
    topBars[i].translate(500+distance*40+ i*300,-400+myRandom*10-80,0);   
   }
  }
  
  void renderCharacter(){
    if(playing){
      shape(characterShape);
      character.setPosition(new Vector(0,110-note*10,0));
    }
  }
  
 void renderBar(){
   for(int i=0;i<100;i++){
    shape(bottomBars[i]);
    noStroke();
    shape(topBars[i]);
    bottomBars[i].translate(-time/10000,0,0);
    topBars[i].translate(-time/10000,0,0);
   }
      //float myRandom = abs(random(12));
      //for(int i=0; i<1000; i++){
      //  translate(-1,8*10,0);
      //  box(40,500,20);
      //  translate(-1,-500+8*10-40,0);
      //  box(40,500,20);
      //}
  }
  
}
