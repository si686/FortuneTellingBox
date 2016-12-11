import gab.opencv.*;
import KinectPV2.*;

KinectPV2 kinect;
OpenCV opencv;


//Distance in cm
int maxD = 799; //4.5m
int minD = 796; //50cm

PImage contourCopy;
PImage prevFrame; 
PImage hand; 
float threshold = 0.00; 

void setup() {
  size(512, 424);
  opencv = new OpenCV(this, 512, 424);
  kinect = new KinectPV2(this);

  kinect.enableDepthImg(true);
  kinect.enablePointCloud(true);

  kinect.init();

  contourCopy = createImage(512, 424, RGB);
  prevFrame = createImage(contourCopy.width, contourCopy.height, RGB);
  hand = loadImage("hand.jpg");
}

void draw() {
  background(0);
  image(kinect.getPointCloudDepthImage(), 0, 0);
  loadPixels();
  contourCopy.loadPixels();
  for (int y=240; y<258; y++) {
    for (int x=230; x<240; x++) {
      color c = pixels[(y*width)+x];
      contourCopy.pixels[(y*contourCopy.width)+x]=c;
    }
  }
  contourCopy.updatePixels();



  prevFrame.copy(contourCopy, 230, 240, contourCopy.width, contourCopy.height, 230, 240, contourCopy.width, contourCopy.height); 
  prevFrame.updatePixels(); 
  for (int yp=240; yp<258; yp++) {
    for (int xp=230; xp<240; xp++) {
      int loc = xp + yp*contourCopy.width; 
      color current = contourCopy.pixels[loc]; 
      color previous = prevFrame.pixels[loc]; 
      float d1 = brightness(current); 
      float d2 = brightness (current); 
      float d3 = brightness(previous); 
      float d4 = brightness(previous); 
      float difference = dist(d1, d2, d3, d4);
      if ( difference != threshold) {
        println("Different");
        image(hand, 0, 0, 512,424);
        delay(2000); 
        
      }
    }
  }
  updatePixels();

  image(contourCopy, 0, 0);


  //Box which contains all the readings 
  noStroke();
  fill(0);
  rect(0, 0, 130, 100);
  fill(255, 0, 0);
  text("fps: "+frameRate, 20, 20);
  text("minD: "+minD, 20, 60);
  text("maxD: "+maxD, 20, 80);

  kinect.setLowThresholdPC(minD);
  kinect.setHighThresholdPC(maxD);
  //println("X",mouseX);
  //println("Y",mouseY);
  //println(kinect.getPointCloudDepthImage().width);
}

void keyPressed() {
  if (key == '1') {
    minD += 1;
  }

  if (key == '2') {
    minD -= 1;
  }

  if (key == '3') {
    maxD += 1;
  }

  if (key == '4') {
    maxD -= 1;
  }
}