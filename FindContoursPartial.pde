import gab.opencv.*;
import KinectPV2.*;

KinectPV2 kinect;
OpenCV opencv;

float polygonFactor = 1;

int threshold = 10;

//Distance in cm
int maxD = 805; //4.5m
int minD = 790; //50cm

boolean    contourBodyIndex = false;
PImage contourCopy;

void setup() {
  size(512, 424);
  opencv = new OpenCV(this, 512, 424);
  kinect = new KinectPV2(this);

  kinect.enableDepthImg(true);
  kinect.enableBodyTrackImg(true);
  kinect.enablePointCloud(true);

  kinect.init();

  contourCopy = createImage(512, 424, RGB);
}

void draw() {
  background(0);

  noFill();
  strokeWeight(3);

  //  image(kinect.getDepthImage(), 0, 0);

  //  contourCopy.copy(kinect.getBodyTrackImage(),0,0,kinect.getBodyTrackImage().width,kinect.getBodyTrackImage().height,0,0,kinect.getBodyTrackImage().width,kinect.getBodyTrackImage().height);

  //change contour extraction from bodyIndexImg or to Depth
  //  if (contourBodyIndex)
  //    image(kinect.getBodyTrackImage(), 512, 0);
  //  else
  image(kinect.getPointCloudDepthImage(), 0, 0);
  loadPixels();
  contourCopy.loadPixels();
  for (int y =200; y<330; y++) {
    for (int x =195; x<330; x++) {
      color c = pixels[(y*width)+x];
      //if(red(c)<1){
      //  c = color(255,0,0);
      //}
      //if (kinect.getPointCloudDepthImage().width>0) {
      //  c = kinect.getPointCloudDepthImage().get(x, y);
      //}

      contourCopy.pixels[(y*contourCopy.width)+x]=c;
    }
  }
  contourCopy.updatePixels();
  
  background(0);
  image(contourCopy, 0, 0);

  //if (contourBodyIndex) {
  //  opencv.loadImage(kinect.getBodyTrackImage());
  //  opencv.gray();
  //  opencv.threshold(threshold);
  //  PImage dst = opencv.getOutput();
  //} else {
  //opencv.loadImage(kinect.getPointCloudDepthImage());
  //opencv.gray();
  //opencv.threshold(threshold);
  //PImage dst = opencv.getOutput();
  //}

  //ArrayList<Contour> contours = opencv.findContours(false, false);

  //if (contours.size() > 0) {
  //  for (Contour contour : contours) {

  //    contour.setPolygonApproximationFactor(polygonFactor);
  //    if (contour.numPoints() > 50) {

  //      stroke(0, 200, 200);
  //      beginShape();

  //      for (PVector point : contour.getPolygonApproximation ().getPoints()) {
  //        vertex(point.x + 512*2, point.y);
  //      }
  //      endShape();
  //      fill(#ff0000); 
  //      rect(1000, 50, 50, 50);
  //    }
  //  }
  //}

  noStroke();
  fill(0);
  rect(0, 0, 130, 100);
  fill(255, 0, 0);
  text("fps: "+frameRate, 20, 20);
  text("threshold: "+threshold, 20, 40);
  text("minD: "+minD, 20, 60);
  text("maxD: "+maxD, 20, 80);

  kinect.setLowThresholdPC(minD);
  kinect.setHighThresholdPC(maxD);
  //  println(mouseX);
  //  println(mouseY);
  //println(kinect.getPointCloudDepthImage().width);
}


void keyPressed() {
  //change contour finder from contour body to depth-PC
  if ( key == 'b') {
    contourBodyIndex = !contourBodyIndex;
    if (contourBodyIndex)
      threshold = 200;
    else
      threshold = 40;
  }

  if (key == 'a') {
    threshold+=1;
  }
  if (key == 's') {
    threshold-=1;
  }

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

  if (key == '5')
    polygonFactor += 0.1;

  if (key == '6')
    polygonFactor -= 0.1;
}