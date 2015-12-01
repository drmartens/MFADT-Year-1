//
//  Music.cpp
//  FinalTake2
//
//  Created by Dana Martens on 11/26/15.
//
//

#include "Music.h"
//#include "Box.h"
//#include "Ball.h"
//#include "Sphere.h"

//--------------------------------------------------------------
void Music::setup(){
    width1= ofGetWidth()/4;
    height1 = ofGetHeight()/4;
    
    //MARK - Video Settings
    bool succ2 = true;
    succ2 = bigBangVid.load("summer.mp4");
    if (!succ2) {
        cerr << "loading video failed...\n";
    }
    
    //MARK - Audio Settings
    
    //Music Control --------
    bigBang.load("summer.mp3");
    fftSmooth = new float [8192];
    for (int i = 0; i<8192; i++) {
        fftSmooth[i] = 0;
    }
    
    //    bands = 64;
    bigBang.setLoop(true);
    bigBang.setVolume(volume);
    
    //MARK - GUI SETUP FOR BALL CONTROL-----------
    gui.setup();
    gui.add(volume.set("Volume is (+/-)", 0.4, 0.0, 1.0));
    gui.add(bands.set("Bands (right/left)", 50, 0, 100));
    gui.add(boxControl.set("Box Control (up/down)", 25, 0, 100));
    gui.add(msg4.set("Press 1 to start Video & Music, 2 to stop"));
    gui.add(msg1.set("Press Nunchuk C to Draw Boxes & JoyStick to Control"));
    gui.add(msg2.set("Press Nunchuk Z & Wiimote A to Show Balls"));
    gui.add(msg3.set("Press Wiimote B Trigger to Move All Balls"));
//    gui.add(sphereControl.set("SphereControl", 25, 0, 100));

    
    //MARK - GENERATE BOXES SETUP---------
    
    counter = 0;
    boxControl = 10;
    
//    //MARK - GENERATE SPHERES SETUP------------
//    counter1 = 0;
//    sphereControl = 10;
    
    //MARK - Wii OSC Setup---------------------
    ofSetCircleResolution(50);
    ofSetFrameRate(100);
    ofSetVerticalSync(true);
    ofEnableSmoothing();
    ofSetFullscreen(true);
    
    w = 0;
    h = 0;    // set in update()
    
    // listen on the given port (9000)
    cout << "listening for osc messages on port " << PORT << "\n";
    receiver.setup( PORT );
    
}

//--------------------------------------------------------------
void Music::update(){
    
    
    //MARK- Video -------
    bigBangVid.update();
    ofSoundUpdate();
    bigBang.setVolume(volume);
    
    float * value = ofSoundGetSpectrum(bands);
    for (int i = 0; i < bands; i++){
        fftSmooth[i] *= 0.3f; //controls how fast dies down
        if (fftSmooth[i] < value[i]) {
            fftSmooth[i] = value[i];
        }
    }
    
    if (nunchukCButton == true) {
        
        //box behavior
        counter++;
        
        if (counter >= 1) {
            Box boxee;
            boxee.setup(wiiX, wiiY, -25, 2000);
            boxVector.push_back(boxee);
            counter = 0;
        }
        
        
        //on every loop update each element in box
        for (int i=0; i<boxVector.size(); i++) {
            boxVector[i].update();
        }
        
        //if more tahn 100 erase extra
        while (boxVector.size() > boxControl) {
            boxVector.erase(boxVector.begin());
            
        }
    }
    
    
    if (buttonB == true){
        width1 = roll *= ofGetWidth();
        height1 = yaw *= ofGetHeight();
        width2 = nunchukRoll *= ofGetWidth();
        height2 = nunchukYaw *= ofGetHeight();
    }
    
    if (buttonB == false) {
        width1 = ofGetWidth()/4;
        height1 = ofGetHeight()/4;
        width2 = ofGetWidth()/8;
        height2 = ofGetHeight()/8;
    }
    
   
    for (int i = 0; i<bands; i++) {
        if (nunchukZbutton == true) {
            ball.setup(ofGetWidth()/2, ofGetHeight()/2, -(fftSmooth[i]*300), 50);
        }
    }
    
    
    for (int i = 0; i < bands; i++){
    if (buttonA == true) {
        ball.setup(ofGetWidth()/2, ofGetHeight()/2, -(fftSmooth[i] * 200), 50);
}
        
    }
    
    
    
//    if (nunchukCButton == true) {
//        
//        //sphere behavior
//        counter1++;
//        
//        if (counter1 >= 1) {
//            Sphere sph;
//            sph.setup(ofGetWidth()/2, ofGetHeight()/2, -50, 500);
//            sphereVector.push_back(sph);
//            counter1 = 0;
//        }
//        
//        
//        //on every loop update each element in sphere
//        for (int j=0; j<sphereVector.size(); j++) {
//            sphereVector[j].update();
//        }
//        
//        //if more than Sphere Control Parameter
//        while (sphereVector.size() > sphereControl) {
//            sphereVector.erase(sphereVector.begin());
//            
//        }
//
//    }
    

    
    
    
       
    //MARK - Wii REMOTE SETUP-----------------------------------
    //MARK - Update Wii OSC - Get the Devices
    //Wii Remote Updating
    // check for waiting messages
    while( receiver.hasWaitingMessages() )
    {
        if(w == 0 || h == 0){
            w = ofGetWidth();
            h = ofGetHeight();
        }
        // get the next message
        ofxOscMessage m;
        float x,y;
        receiver.getNextMessage( &m );
        
        
        //Nunchuk Joystick
        
        if ( m.getAddress() == "/wii/2/nunchuk/joy/0" )
        {
            x = m.getArgAsFloat( 0 );
            wiiX = x * w;
            cout << "x: " << wiiX << " y: " << wiiY << "\n";
        }
        else if ( m.getAddress() == "/wii/2/nunchuk/joy/1" )
        {
            y = 1 - m.getArgAsFloat( 0 );
            wiiY = y * h;
            cout << "x: " << wiiX << " y: " << wiiY << "\n";
        }
        
        //Nunchuk Buttons
        
        else if (m.getAddress() == "/wii/2/nunchuk/button/C") {
            nunchukCButton = m.getArgAsBool(false);
        }
        
        else if (m.getAddress() == "/wii/2/nunchuk/button/Z") {
            nunchukZbutton = m.getArgAsBool(false);
        }
        
        //Nunchuk Orientation
        else if (m.getAddress() == "/wii/2/nunchuk/accel/pry/0") {
            nunchukRoll = m.getArgAsFloat(0);
        }
        
        else if (m.getAddress() == "/wii/2/nunchuk/accel/pry/1") {
            nunchukYaw = m.getArgAsFloat(0);
        }
        
        else if (m.getAddress() == "/wii/2/nunchuk/accel/pry/2") {
            nunchukPitch = m.getArgAsFloat(0);
        }
        
        else if (m.getAddress() == "/wii/2/nunchuk/accel/pry/3") {
            nunchukAccel = m.getArgAsFloat(0);
        }
        
        
        //Wii Remote Orientation & Acceleration
        else if (m.getAddress() == "/wii/2/accel/pry/1") {
            roll = m.getArgAsFloat(0);
            
        } else if (m.getAddress() == "/wii/2/accel/pry/2") {
            yaw = m.getArgAsFloat(0);
        }
        else if (m.getAddress() == "/wii/2/accel/pry/0") {
            pitch = m.getArgAsFloat(0);
            
        } else if (m.getAddress() == "/wii/2/accel/pry/3") {
            accel = m.getArgAsFloat(0);
        }
        
        //Wii Remote Buttons
        
        else if (m.getAddress() == "/wii/2/button/1") {
            button1 = m.getArgAsBool(false);
        }
        
        else if (m.getAddress() == "/wii/2/button/2") {
            button2 = m.getArgAsBool(false);
        }
        
        else if (m.getAddress() == "/wii/2/button/A") {
            buttonA = m.getArgAsBool(false);
        }
        
        else if (m.getAddress() == "/wii/2/button/B") {
            buttonB = m.getArgAsBool(false);
        }
        
        else if (m.getAddress() == "/wii/2/button/Plus") {
            buttonPlus = m.getArgAsBool(false);
        }
        
        else if (m.getAddress() == "/wii/2/button/Minus") {
            buttonMinus = m.getArgAsBool(false);
        }
        
        else if (m.getAddress() == "/wii/2/button/Home") {
            buttonHome = m.getArgAsBool(false);
        }
        
        //Wii Directional Pad
        else if (m.getAddress() == "/wii/2/button/Down") {
            buttonDown = m.getArgAsBool(false);
        }
        else if (m.getAddress() == "/wii/2/button/Up") {
            buttonUp = m.getArgAsBool(false);
        }
        else if (m.getAddress() == "/wii/2/button/Left") {
            buttonLeft = m.getArgAsBool(false);
        }
        else if (m.getAddress() == "/wii/2/button/Right") {
            buttonRight = m.getArgAsBool(false);
        }
        
        else
        {
            cout << "unrecognized message: " << m.getAddress() << "\n";
        }
//------------------------------------------------------------------

    }
    
    //Use Wii to Play Music & Video
    
    if (button1 == true) {
        bigBang.play();
        bigBangVid.play();
    } else if (button2 == true) {
        bigBang.stop();
        bigBangVid.stop();
    }
    
    //Use Plus and Minus to Control Volume
    if (buttonPlus == true) {
        volume = volume + .01f;
    } else if (buttonMinus == true) {
        volume = volume - .01f;
    }
    
    //Use Right Left to Control Speed Multiplier
    if (buttonRight == true) {
        bands++ ;
    } else if (buttonLeft == true) {
        bands--;
    }
    
    //Box Control
    if (nunchukCButton == true && buttonUp == true) {
        boxControl++;
    } else if (nunchukCButton == true && buttonDown == true) {
        boxControl--;
    }
//    
//    //Sphere Control
//    if (nunchukCButton == true && buttonUp == true) {
//        sphereControl++;
//    } else if (nunchukCButton == true && buttonDown == true) {
//        sphereControl--;
//    }
//    
    
    
//    if (nunchukCButton == true && buttonA == true) {
//        boxControl++;
//    } else if (nunchukZbutton == true && buttonA == true) {
//        boxControl--;
//    }
    
    
    //Sphere Control
//    sine = sin(ofGetElapsedTimef() * speed+5) * sinPar;
//    cosine = cos(ofGetElapsedTimef() * speed+5) * cosPar;

    
    
}


//--------------------------------------------------------------
void Music::draw(){
    bigBangVid.draw(0, 0, ofGetWidth(), ofGetHeight());
    bigBangVid.setVolume(0.0f);
    gui.draw();
    
    //Wii Remote Draw DeBug
    if ((ofGetFrameNum() % 100) == 0) {
        printf("roll = %f, pitch = %f, yaw = %f, accel = %f\n",
               roll,pitch,yaw,accel);
    }

    
   //MARK - Draw Boxes
    
    if (nunchukCButton == true){
    for (int i = 0; i<boxVector.size();i++) {
        boxVector[i].draw();
            }
    }
    
//    //MARK - Draw Spheres
//    
//    if (nunchukCButton == true){
//        for (int j = 0; j<sphereVector.size();j++) {
//            sphereVector[j].draw();
//        }
//    }

   //MARK - buttonZ Circles to Music
    
    gradient.addColor( ofColor::aquamarine );
    gradient.addColor( ofColor::skyBlue );
    gradient.addColor( ofColor::teal );
    
    //query the gradient for a color at a specific spot
    ofColor color = gradient.getColorAtPercent(.04);
    
    //rinse and repeat to draw the full gradient
    for(float i = 0.0f; i < 1.0f; i+= 0.1f){
        ofSetColor( gradient.getColorAtPercent(i) );
        //draw using that color
        for (int i = 0; i < bands; i++){
            ofCircle(width1, (ofGetHeight()-height2), -(fftSmooth[i] * 200));
            ofCircle((ofGetWidth() - width1), (ofGetHeight() - height2), -(fftSmooth[i] * 200));
            ofCircle(width1, height2, -(fftSmooth[i] * 200));
            ofCircle((ofGetWidth() - width1), height2, -(fftSmooth[i] * 200));
        }

    }

        if (nunchukZbutton == true) {
    
//MARK - More Circles
        gradient.addColor( ofColor::blueSteel );
        gradient.addColor( ofColor::fuchsia );
        gradient.addColor( ofColor::papayaWhip );
        
        //query the gradient for a color at a specific spot
        ofColor color2 = gradient.getColorAtPercent(.05);
        
        //rinse and repeat to draw the full gradient
        for(float i = 0.0f; i < 1.0f; i+= 0.1f){
            ofSetColor( gradient.getColorAtPercent(i) );
            //draw using that color
            for (int i = 0; i < bands; i++){
                ofTranslate(ofGetWidth()/2, ofGetHeight()/2);
                ofCircle(width1*accel, height1*pitch, -(fftSmooth[i] * 100));
                ofCircle(pitch*width2, roll*height2, -(fftSmooth[i] * 100));
                ofCircle(nunchukYaw*height1, nunchukAccel*width1, -(fftSmooth[i] * 100));
                ofCircle(nunchukPitch*width2, nunchukRoll*height2, -(fftSmooth[i] * 100));
            }
    }
}
    
            if (buttonA == true) {
    
            //MARK - More Circles
            gradient.addColor( ofColor::orchid );
            gradient.addColor(ofColor::silver);
                gradient.addColor(ofColor::seaGreen);
            
            //query the gradient for a color at a specific spot
            ofColor color1 = gradient.getColorAtPercent(.03);
            
            //rinse and repeat to draw the full gradient
            for(float i = 0.0f; i < 1.0f; i+= 0.1f){
                ofSetColor( gradient.getColorAtPercent(i) );
                //draw using that color
                for (int i = 0; i < bands; i++){
                    ofTranslate(ofGetWidth()/4, ofGetHeight()/4);
                    ofRect(width1*roll, height1*roll, width2*roll,  -(fftSmooth[i] * 100));
                     ofRect(width2*pitch,  -(fftSmooth[i] * 100), width2*pitch, height1*nunchukRoll);
                     ofRect(width1*yaw, height1*roll,  -(fftSmooth[i] * 100), width1*nunchukYaw);
                     ofRect(width2*roll, height1*roll, width1*roll, width2*(roll/pitch));
                     ofRect(width1*nunchukYaw,  -(fftSmooth[i] * 100), width2*roll, width1*nunchukYaw);
                     ofRect(width2*nunchukAccel, height2*nunchukPitch, width2*roll, height1*roll);
                     ofRect( -(fftSmooth[i] * 100), height1*roll, width1*nunchukYaw,width1*nunchukYaw);
                     ofRect(width2*roll, height1*roll, width2*(roll/pitch), width1*yaw);
                    ofRect(width1*nunchukPitch, height2*nunchukYaw, height1*nunchukAccel,  -(fftSmooth[i] * 100));
                    
                }
            }
        }


    
}
