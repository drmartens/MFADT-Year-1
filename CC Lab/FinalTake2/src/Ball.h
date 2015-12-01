//
//  Ball.h
//  FinalTake2
//
//  Created by Dana Martens on 11/27/15.
//
//

#pragma once

#include "ofMain.h"

class Ball : public ofBaseApp{
    
public:
    void setup(float bX, float bY, float bRadius, float speed);
    void update();
    void draw(float bX, float bY, float bRadius, float speed);
    
    float speed;
    float sine;
    float cosine;
};
