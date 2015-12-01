//
//  Sino.hpp
//  FinalTake2
//
//  Created by Dana Martens on 11/27/15.
//
//

#pragma once

#include "ofMain.h"

class Sino : public ofBaseApp{
    
public:
    void setup(float sX, float sY, float sRadius);
    void update();
    void draw();
    
    float sine;
    float cosine;
    
};
