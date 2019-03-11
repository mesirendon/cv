class Background{
  Frame back;
  PShape myBack;
  Background(){
    setupBack();
    back = new Frame(scene){
      @Override
      public void visit(){
        render();
      }
    };
    back.setPosition(new Vector(0,0,-20));
  }
  void setupBack(){
    myBack = createShape(BOX,800,600,2);
  }
  void render(){
    shader(munchShader);
    //shape(myBack);
  }
}
