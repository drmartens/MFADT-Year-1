//
//  Sino.cpp
//  FinalTake2
//
//  Created by Dana Martens on 11/27/15.
//
//

#include "Sino.h"
#include "Music.h"
//--------------------------------------------------------------
void Sino::setup(float sX, float sY, float sRadius) {
    
    
}

//--------------------------------------------------------------
void Sino::update(){
    //Movement------
    
    sine = sin(ofGetElapsedTimef() * speed+5) * sinPar;
    cosine = cos(ofGetElapsedTimef() * speed+5) * cosPar;
}

//--------------------------------------------------------------
void Sino::draw(){
    ofCircle(sine * -(fftSmooth[i] * 150), cosine2, radius2);
}
    
}
