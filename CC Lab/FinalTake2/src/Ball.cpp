//
//  Ball.cpp
//  FinalTake2
//
//  Created by Dana Martens on 11/27/15.
//
//

#include "Ball.h"
//--------------------------------------------------------------
void Ball::setup(float bX, float bY, float bRadius, float speed){
    speed = 10;
    
}

//--------------------------------------------------------------
void Ball::update(){
    sine = sin(ofGetElapsedTimef() * speed+5);
    cosine = cos(ofGetElapsedTimef() * speed+5);

}

//--------------------------------------------------------------
void Ball::draw(float bX, float bY, float bRadius, float speed){
    ofSetColor(255, 255, 255);
    ofCircle(sine*bX, cosine*bY, 100);
    ofCircle(cosine, sine, 100);
}
