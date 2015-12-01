//
//  Sphere.cpp
//  FinalTake2
//
//  Created by Dana Martens on 12/1/15.
//
//

#include "Sphere.h"

//--------------------------------------------------------------
void Sphere::setup(float aX, float aY, float aZ, int size1){
    pos1.set(aX, aY, aZ);
    color1 = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
    
    vel1.x = ofRandom(-10, 10);
    vel1.y = ofRandom(-7, 20);
    vel1.z = ofRandom(1, 100);
    
    
}

//--------------------------------------------------------------
void Sphere::update(){
    pos1 += vel1;
   }

//--------------------------------------------------------------
void Sphere::draw(){
    ofSetColor(color1);
    ofDrawSphere(pos1.x, pos1.y, pos1.z, size1);
    
}
