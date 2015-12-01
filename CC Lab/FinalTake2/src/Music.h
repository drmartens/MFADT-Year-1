//
//  Music.h
//  FinalTake2
//
//  Created by Dana Martens on 11/26/15.
//
//

#pragma once

#include "ofMain.h"
#include "Box.h"
#include "Sphere.h"
#include "Ball.h"
#include "ofxGui.h"
#include "ofxColorGradient.h"
#include "ofxOsc.h"

#define PORT 9000

class Music : public ofBaseApp{
    
public:
    void setup();
    void update();
    void draw();
    
    
    //MARK - Setup Wii OSC control
    int w, h;
    float roll, yaw, pitch, accel; //orientation of the Wii Remote
    float wiiX, wiiY; // x, y of either the IR reading of Wii Remote or the thumbstick on Nunchuk
    float button1, button2, buttonA, buttonB, buttonUp, buttonDown, buttonLeft, buttonRight,buttonPlus, buttonMinus, buttonHome; //buttons on the Wii Remote
    float nunchukX, nunchukY,nunchukCButton, nunchukZbutton; // buttons on Wii nunchuk
    float nunchukRoll, nunchukYaw, nunchukPitch, nunchukAccel; //orientation of Wii Nunchuk
    
    ofxOscReceiver receiver;

    //MARK - Setup Sound & Video Players
    ofSoundPlayer bigBang;
    
    float * fftSmooth; //how fast/slow shapes moves
    //int bands; //of frequency, you can have many bands
    
   
    //MARK - Setup Video Player
    ofVideoPlayer bigBangVid;
    
    //create vector container to hold flying boxes  & spheres and counter to control how many boxes we create
    vector<Box> boxVector;
    vector<Sphere> sphereVector;
    int counter;
    int counter1;

    
    //MARK - Setup GUI
    ofxPanel gui;
    ofParameter<int> boxControl;
    ofParameter<float> volume;
    ofParameter<float> bands;
    ofParameter<string> msg1;
    ofParameter<string> msg2;
    ofParameter<string> msg3;
    ofParameter<string> msg4;

    
    int width1;
    int height1;
    int width2;
    int height2;
    
    
    ofxColorGradient<ofColor> gradient;

    Ball ball;

    
    
};
