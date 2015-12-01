//
//  Sphere.h
//  FinalTake2
//
//  Created by Dana Martens on 12/1/15.
//
//

#pragma once

#include "ofMain.h"

class Sphere : public ofBaseApp{
    
public:
    void setup(float aX, float aY, float aZ, int size1);
    void update();
    void draw();
    
    //an ofVec3f works like ofVec2f. Vec 3 is 3D, so need x,y,z. Vec2 is only in 2d so just need x and y.
    ofVec3f pos1;
    ofVec3f vel1;
    
    ofColor color1;
    int size1;
    
    
    
};
