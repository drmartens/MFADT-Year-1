//
//  Box.cpp
//  FinalTake2
//
//  Created by Dana Martens on 11/26/15.
//
//

#include "Box.h"
//--------------------------------------------------------------
void Box::setup(float mX, float mY, float mZ, int size){
    pos.set(mX, mY, mZ);
    color = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
    
    vel.x = ofRandom(-5, 5);
    vel.y = ofRandom(-5, 5);
    vel.z = ofRandom(3, 50);
    
    
}

//--------------------------------------------------------------
void Box::update(){
    pos += vel;
    if (pos.x <= 0 || pos.x >= ofGetWidth()) {
        vel.x = -vel.x;
    } else if (pos.y <=0 || pos.y >= ofGetHeight() ){
        vel.y = -vel.y;
    }
}

//--------------------------------------------------------------
void Box::draw(){
    ofSetColor(color);
    ofDrawBox(pos.x, pos.y, pos.z, size);

}
