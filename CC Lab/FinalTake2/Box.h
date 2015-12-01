//
//  Box.h
//  FinalTake2
//
//  Created by Dana Martens on 11/26/15.
//
//

#pragma once

#include "ofMain.h"

class Box : public ofBaseApp{
    
public:
    void setup(float mx, float mY, float mZ, int size);
    void update();
    void draw();
    
    //an ofVec3f works like ofVec2f. Vec 3 is 3D, so need x,y,z. Vec2 is only in 2d so just need x and y.
    ofVec3f pos;
    ofVec3f vel;
    
    ofColor color;
    int size;
    
    
    
};
