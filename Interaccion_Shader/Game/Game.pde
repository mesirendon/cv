//Libraries for pitch detection
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.*;

//Frames libraries
import frames.primitives.*;
import frames.core.*;
import frames.processing.*;


//Scene and frames
Scene scene;
Frame frame, camera;

//Game level and menus
Level level;
Background back;
//Bar bar;
Character character;
boolean playing = false;
int initialAnimation = 0;
//PitchDetectorAutocorrelation PD; //Autocorrelation
//PitchDetectorHPS PD; //Harmonic Product Spectrum -not working yet-
PitchDetectorFFT PD; // Naive
ToneGenerator TG;
AudioSource AS;
Minim minim;
boolean addX = false, restX = false;

//Some arrays just to smooth output frequencies with a simple median.
float []freq_buffer = new float[10];
float []sorted;
int freq_buffer_index = 0;

long last_t = -1;
float avg_level = 0;
float last_level = 0;
String filename;
float begin_playing_time = -1;

int tone;
float[][] toneFrec; 
float[][] notes;
int octave = 0, note=0;

float frec;

float time;
float xpos = 0;

PShader munchShader;
//Graph.Type shadowMapType = Graph.Type.ORTHOGRAPHIC;
//PGraphics shadowMap;

void setup(){
  size(1200,700,P3D);
  frameRate(30);
  
  scene = new Scene(this);
  level = new Level();
  camera = new Frame(scene);
  back = new Background();
  //bar = new Bar(11,60,1);
  toneFrec = new float[5][11];
  notes = new float[5][11];
  minim = new Minim(this);
  minim.debugOn();

  AS = new AudioSource(minim);
  AS.OpenMicrophone();
  //PD = new PitchDetectorAutocorrelation();
  PD = new PitchDetectorFFT();
  PD.ConfigureFFT(2048, AS.GetSampleRate());
  PD.SetSampleRate(AS.GetSampleRate());
  AS.SetListener(PD);
  camera.setPosition(new Vector(170,0,300));
  //TG = new ToneGenerator (minim, AS.GetSampleRate());
  poblateTones();
  munchShader = loadShader("munchShader.glsl","munchVertex.glsl");
  //toonShader = loadShader("toonShader.glsl");
  //toonShader.set("near",50);
  //toonShader.set("far",5000);
  
}

void draw(){  
  background(0,0,100);
  //ambientLight(128, 128, 128);
  directionalLight(255, 255, 255, -512+xpos*10000, xpos*10000, -175);
  time = (float) millis();
  munchShader.set("u_time",time/2000.0);
  munchShader.set("u_resolution",1280.0,720.0);
  camera.setPosition(new Vector(170,0,300));
  scene.eye().setReference(camera);
  scene.fit(camera);
  //scene.drawAxes();
  scene.traverse();
  if(playing){
    if (begin_playing_time == -1)
    begin_playing_time = millis();
  
    float f = 0;
    float slevel = AS.GetLevel();
    long t = PD.GetTime();
    boolean selectedNote = false;
    xpos = slevel;
    //print(xpos);
    if (t == last_t) return;
    last_t = t;
    if(slevel >=0.01){
      f = PD.GetFrequency();
    }else{
      f = 0;
    }
    
  
    /*freq_buffer[freq_buffer_index] = f;
    freq_buffer_index++;
    freq_buffer_index = freq_buffer_index % freq_buffer.length;
    sorted = sort(freq_buffer);
  
    f = sorted[5];*/
    frec = f;
    //TG.SetFrequency(f);
    //TG.SetLevel(slevel * 10.0);
    //print(f,"  ");
    //stroke(level * 255.0 * 10.0);
    //line(xpos, height, xpos, height - f / 5.0f);
    avg_level = slevel;
    last_level = f;
    for(int i = 0;i<5;i++){
      for(int j = 0; j<11;j++ ){
        if(!selectedNote && f < notes[i][j]){
          selectedNote = true;
          note=j*(i%2 + 1);
          //print(notes[i][j], "    ",i,"    ",j,"    ",note,"   ,");
        }
      }
    }
  }
  //if(addX){
  //    xpos = xpos + 1;
  //    print("x = ",xpos);
  //  }
  //  if(restX){
  //    xpos = xpos - 1;
  //    print("x = ",xpos);
  //  }
}

void keyPressed(){
  switch (key) {
    case 'w':
      playing = !playing;
    break;
    case 'z':
      addX = !addX;
      restX = false;
    break;
    case 'x':
      restX = !restX;
      addX = false;
      print("x = ",restX);
  }
}

void poblateTones(){
  toneFrec[0]=new float[] {32.7,34.65,36.71,38.89,41.2,43.65,46.25,49,51.91,55,58.27,61.74};
  toneFrec[1]=new float[] {65.41,69.3,73.42,77.78,82.41,87.31,92.5,98,103.83,110.00,116.54,123.47};
  toneFrec[2]=new float[] {130.81,138.59,146.83,155.56,164.81,174.61,185,196,207.65,220,233.08,246.94};
  toneFrec[3]=new float[] {261.63,277.18,293.66,311.13,329.63,349.23,369.99,392,415.30,440,446.16,493.88};
  toneFrec[4]=new float[] {523.25,554.34,587.33,622.25,659.26,698.46,739.99,783.99,830.61,880,932.33,987.77};
  for(int i=0; i<5;i++){
    for(int j=0; j<11;j++){
      if(i==0 && j==0){
        notes[i][j] = 37.7/2;
      }else{
        if(j==0){
          notes[i][j] = toneFrec[i][j] - (toneFrec[i][j] - toneFrec[i-1][10])/2;
        }else{
          notes[i][j] = toneFrec[i][j] - (toneFrec[i][j] - toneFrec[i][j-1])/2;
        }
      }
    }    
  }
}

void currentNote(){
  
}

void mouseDragged() {
  if (scene.eye().reference() == null)
    if (mouseButton == LEFT)
      // same as: scene.spin(scene.eye());
      scene.spin();
    else if (mouseButton == RIGHT)
      // same as: scene.translate(scene.eye());
      scene.translate();
    else
      scene.moveForward(mouseX - pmouseX);
}


//void mouseWheel(MouseEvent event) {
//  // same as: scene.scale(event.getCount() * 20, scene.eye());
//  scene.scale(event.getCount() * 200);
//}
