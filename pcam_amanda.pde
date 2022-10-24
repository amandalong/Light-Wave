/**
 *  Please note that the code for interfacing with Capture devices
 *  will change in future releases of this library. This is just a
 *  filler till something more permanent becomes available.
 *
 *  For use with the Raspberry Pi camera, make sure the camera is
 *  enabled in the Raspberry Pi Configuration tool and add the line
 *  "bcm2835_v4l2" (without quotation marks) to the file
 *  /etc/modules. After a restart you should be able to see the
 *  camera device as /dev/video0.
 */

import gohai.glvideo.*;
GLCapture video;
OPC opc;

void setup() {
  size(160, 210, P2D);

  opc=new OPC(this, "127.0.0.1", 7890);
  opc.setDithering(true);
  opc.setInterpolation(true);

  for(int i=0; i<16; i++){
    opc.ledStrip(i*21, 21, i*width/16.0 + width/32.0, height*0.5, width/16.0, PI*0.5, false);
  }
  init();
frameRate(30);

}

void init(){
  println("Opening Camera...");
  String[] devices = GLCapture.list();
  if (0 < devices.length) {
    println("Camera Found");
    video = new GLCapture(this, devices[0], 640, 360, 30);
    video.start();
    println("Camera Ready!");
  }
  else{
    println("Couldn Open Camera");
    println("Exiting");
    exit();
  }
}

void draw() {
  background(255,0,0);
    if (video.available()) {
      video.read();
    }
    image(video, 0, 0, width, height);
}