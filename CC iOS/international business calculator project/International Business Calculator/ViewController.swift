//
//  ViewController.swift
//  International Business Calculator
//
//  Created by Dana Martens on 10/21/15.
//  Copyright © 2015 Dana Martens. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation




class ViewController: UIViewController {


    
//MARK - Global Variables

//MARK - Speech Synthesis Variables
    var mySpeechSynth = AVSpeechSynthesizer() //default init for speech
    var currentLan = ("en-US",  "English", "United States", "$","🇺🇸")
    var currentCurrency = ("en-US")
    var speechVolume:Float = 1.0
    

    
//MARK - Math Variables
    var total:Float64 = 0
    var modes:Int64 = 0
    var valueString:String! = ""
    var lastButtonWasMode = false
    var totalDisplayed = false
    var lastButtonMultiply = false
    var lastButtonDivide = false
    var lastButtonClear = false
    var lastButtonZero = false
    
//MARK - Language Array
    var allLan = [
        ("en-US",  "English", "United States", "American English","🇺🇸"),
        ("ar-SA","Arabic","Saudi Arabia","العربية","🇸🇦"),
        ("cs-CZ", "Czech", "Czech Republic","český","🇨🇿"),
        ("da-DK", "Danish","Denmark","Dansk","🇩🇰"),
        ("de-DE",       "German", "Germany", "Deutsche","🇩🇪"),
        ("el-GR",      "Modern Greek",        "Greece","ελληνική","🇬🇷"),
        ("en-AU",     "English",     "Australia","Aussie","🇦🇺"),
        ("en-GB",     "English",     "United Kingdom", "Queen's English","🇬🇧"),
        ("en-IE",      "English",     "Ireland", "Gaeilge","🇮🇪"),
        ("en-ZA",       "English",     "South Africa", "South African English","🇿🇦"),
        ("es-ES",       "Spanish",     "Spain", "Español","🇪🇸"),
        ("es-MX",       "Spanish",     "Mexico", "Español de México","🇲🇽"),
        ("fi-FI",       "Finnish",     "Finland","Suomi","🇫🇮"),
        ("fr-CA",       "French",      "Canada","Français du Canada","🇨🇦" ),
        ("fr-FR",       "French",      "France", "Français","🇫🇷"),
        ("he-IL",       "Hebrew",      "Israel","עברית","🇮🇱"),
        ("hi-IN",       "Hindi",       "India", "हिन्दी","🇮🇳"),
        ("hu-HU",       "Hungarian",    "Hungary", "Magyar","🇭🇺"),
        ("id-ID",       "Indonesian",    "Indonesia","Bahasa Indonesia","🇮🇩"),
        ("it-IT",       "Italian",     "Italy", "Italiano","🇮🇹"),
        ("ja-JP",       "Japanese",     "Japan", "日本語","🇯🇵"),
        ("ko-KR",       "Korean",      "Republic of Korea", "한국어","🇰🇷"),
        ("nl-BE",       "Dutch",       "Belgium","Nederlandse","🇧🇪"),
        ("nl-NL",       "Dutch",       "Netherlands", "Nederlands","🇳🇱"),
        ("no-NO",       "Norwegian",    "Norway", "Norsk","🇳🇴"),
        ("pl-PL",       "Polish",      "Poland", "Polski","🇵🇱"),
        ("pt-BR",       "Portuguese",      "Brazil","Portuguese","🇧🇷"),
        ("pt-PT",       "Portuguese",      "Portugal","Portuguese","🇵🇹"),
        ("ro-RO",       "Romanian",        "Romania","Română","🇷🇴"),
        ("ru-RU",       "Russian",     "Russian Federation","русский","🇷🇺"),
        ("sk-SK",       "Slovak",      "Slovakia", "Slovenčina","🇸🇰"),
        ("sv-SE",       "Swedish",     "Sweden","Svenska","🇸🇪"),
        ("th-TH",       "Thai",        "Thailand","ภาษาไทย","🇹🇭"),
        ("tr-TR",       "Turkish",     "Turkey","Türkçe","🇹🇷"),
        ("zh-CN",       "Chinese",     "China","漢語/汉语","🇨🇳"),
        ("zh-HK",       "Chinese",   "Hong Kong","漢語/汉语","🇭🇰"),
        ("zh-TW",       "Chinese",     "Taiwan","漢語/汉语","🇹🇼")
    ]


    
//MARK - Buttons as UI Outlets
    @IBOutlet weak var tipButton: UIButton!

    @IBOutlet weak var divideButton: UIButton!
    
    @IBOutlet weak var multiplyButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var seven: UIButton!
    
    @IBOutlet weak var eight: UIButton!
    
    @IBOutlet weak var nine: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var four: UIButton!
    
    @IBOutlet weak var five: UIButton!
    
    @IBOutlet weak var six: UIButton!
    
    @IBOutlet weak var one: UIButton!
    
    @IBOutlet weak var two: UIButton!
    
    @IBOutlet weak var three: UIButton!
    
    @IBOutlet weak var zero: UIButton!
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var equalButton: UIButton!

//MARK - Other UI Elements
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var soundLabel: UILabel!
    
    @IBOutlet weak var dayNightLabel: UILabel!
    
    @IBOutlet weak var pickerOutlet: UIPickerView!

//MARK - UIActions
    
//MARK - Day/Night Mode
    
    @IBAction func dayNightSwitched(sender: UISwitch) {
        if sender.on {
            //Color Changes
            self.view.backgroundColor = UIColor.blackColor()
            tipButton.backgroundColor = UIColor.blackColor()
            divideButton.backgroundColor = UIColor.blackColor()
            multiplyButton.backgroundColor = UIColor.blackColor()
            plusButton.backgroundColor = UIColor.blackColor()
            minusButton.backgroundColor = UIColor.blackColor()
            equalButton.backgroundColor = UIColor.blackColor()
            clearButton.backgroundColor = UIColor.blackColor()
            one.backgroundColor = UIColor.blackColor()
            two.backgroundColor = UIColor.blackColor()
            three.backgroundColor = UIColor.blackColor()
            four.backgroundColor = UIColor.blackColor()
            five.backgroundColor = UIColor.blackColor()
            six.backgroundColor = UIColor.blackColor()
           seven.backgroundColor = UIColor.blackColor()
           eight.backgroundColor = UIColor.blackColor()
            nine.backgroundColor = UIColor.blackColor()
            zero.backgroundColor = UIColor.blackColor()
            
            //Label Changes
            valueLabel.textColor = UIColor.whiteColor()
            soundLabel.textColor = UIColor.whiteColor()
            dayNightLabel.textColor = UIColor.whiteColor()
            dayNightLabel.text = "NIGHT"
            
            //speech
            speakThisString("You are in night mode")
            
        } else {
            //Color Changes
            self.view.backgroundColor = UIColor.whiteColor()
            tipButton.backgroundColor = UIColor(red:0.0, green:0.5, blue:0.5, alpha:1.0)
            divideButton.backgroundColor = UIColor(red:0.0, green:0.5, blue:1.0, alpha:1.0)
            multiplyButton.backgroundColor = UIColor(red:0.0, green:0.5, blue:1.0, alpha:1.0)
            plusButton.backgroundColor = UIColor(red:0.0, green:0.5, blue:1.0, alpha:1.0)
            minusButton.backgroundColor = UIColor(red:0.0, green:0.5, blue:1.0, alpha:1.0)
            equalButton.backgroundColor = UIColor(red:0.0, green:0.5, blue:1.0, alpha:1.0)
            clearButton.backgroundColor = UIColor(red:0.0, green:0.5, blue:1.0, alpha:1.0)
            
            one.backgroundColor = UIColor.darkGrayColor()
            two.backgroundColor = UIColor.darkGrayColor()
            three.backgroundColor = UIColor.darkGrayColor()
            four.backgroundColor = UIColor.darkGrayColor()
            five.backgroundColor = UIColor.darkGrayColor()
            six.backgroundColor = UIColor.darkGrayColor()
            seven.backgroundColor = UIColor.darkGrayColor()
            eight.backgroundColor = UIColor.darkGrayColor()
            nine.backgroundColor = UIColor.darkGrayColor()
            zero.backgroundColor = UIColor.darkGrayColor()
            
            //Label Changes
            valueLabel.textColor = UIColor.darkGrayColor()
            soundLabel.textColor = UIColor.blackColor()
            dayNightLabel.textColor = UIColor.blackColor()
            dayNightLabel.text = "DAY"
            
            //speech
            speakThisString("You are in day mode")

        }
    }
    
    //MARK - TappedNumber
    
    @IBAction func tappedNumber(sender: UIButton) {
        
        let str:String! = sender.titleLabel!.text
        
        let beast:String! = "Mark of the beast"
        let num: Float64! = Float64(str)
        
        if num == 0
        {
            let formatter5:NSNumberFormatter = NSNumberFormatter()
            formatter5.numberStyle = NSNumberFormatterStyle.CurrencyStyle
            formatter5.locale = NSLocale(localeIdentifier: currentCurrency)
            valueLabel.text = formatter5.stringFromNumber(num)
              speakThisString(valueLabel.text!)
        }
        
        if (num == 0 && total == 0)
        {
            return
        }
        
        if (totalDisplayed)
        {
            totalDisplayed = false
            valueString = ""
        }
        
        
        if valueString == "666"
        {
        speakThisString(beast)
        }
        
        if (lastButtonWasMode)
        {
            lastButtonWasMode = false
            valueString = ""
            speakThisString(str)
            
        }

        valueString = valueString.stringByAppendingString(str)
        
        let formatter2:NSNumberFormatter = NSNumberFormatter()
        formatter2.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter2.locale = NSLocale(localeIdentifier: currentCurrency)
    
        let formatter:NSNumberFormatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let n:NSNumber = formatter.numberFromString(valueString)!
        valueLabel.text = formatter2.stringFromNumber(n)
        
        if lastButtonMultiply || lastButtonDivide {
            let val = formatter.numberFromString(valueString!)
            valueLabel.text = formatter.stringFromNumber(val!)
            speakThisString(valueLabel.text!)
            
        } else if ((lastButtonMultiply || lastButtonDivide) && total == 0) {
                let val = formatter2.numberFromString(valueString!)
                valueLabel.text = formatter2.stringFromNumber(val!)
                speakThisString(valueLabel.text!)
        } else {
            valueLabel.text = formatter2.stringFromNumber(n)
            speakThisString(valueLabel.text!)
        }
        
        
        if (total == 0)
        {
            total = Float64(valueString)!
        }
        
    }
    
//MARK - Switches
    
    
    @IBAction func soundSwitch(sender: UISwitch) {
        if sender.on {
        speechVolume = 1.0
            soundLabel.text = "SOUND ON"
            
        } else {
            speechVolume = 0.0
              soundLabel.text = "SOUND OFF"
        }
    }
    
//MARK - Tapped Button Calculations
    
    //MARK - Tapped Plus
    
    @IBAction func tappedPlus(sender: UIButton) {
        self.setMode(1)
        speakThisString("plus")
        lastButtonMultiply = false
        lastButtonDivide = false
    }
     //MARK - Tapped Minus
    
    @IBAction func tappedMinus(sender: UIButton) {
        self.setMode(-1)
        speakThisString("minus")
        lastButtonMultiply = false
        lastButtonDivide = false
    }
     //MARK - Tapped Multiply
    
    @IBAction func tappedMultiply(sender: UIButton) {
        self.setMode(2)
        speakThisString("times")
        lastButtonMultiply = true
    }
     //MARK - Tapped Divide
    @IBAction func tappedDivide(sender: UIButton) {
        self.setMode(3)
        speakThisString("divided by")
        lastButtonDivide = true
    }
    
     //MARK - Tapped Tip
    @IBAction func tappedTip(sender: UIButton) {
        if total == 0 {
            return
        }
        
        let formatter4:NSNumberFormatter = NSNumberFormatter()
        formatter4.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter4.locale = NSLocale(localeIdentifier: currentCurrency)
    
        let iNum:Float64 = Float64(valueString)!
        total = iNum * 0.20
        valueLabel.text = formatter4.stringFromNumber(total)
        let iNum2 = formatter4.stringFromNumber(iNum)
        speakThisString("A 20% tip on \(iNum2!) equals \(valueLabel.text!)")
        totalDisplayed = true
        lastButtonMultiply = false
        lastButtonDivide = false
    }
    //MARK - Tapped Equals
    
    @IBAction func tappedEquals(sender: UIButton) {
        if (modes == 0)
        {
            let formatter7:NSNumberFormatter = NSNumberFormatter()
            formatter7.numberStyle = NSNumberFormatterStyle.CurrencyStyle
            formatter7.locale = NSLocale(localeIdentifier: currentCurrency)
           let num3 = formatter7.stringFromNumber(total)
            
            speakThisString("Equals \(num3!)") //NEED TO FIX THIS!!!
            return
            
        }
        if (modes == 0 && lastButtonClear == true) {
            speakThisString("Equals")
        }
        
        let iNum:Float64 = Float64(valueString)!
        if (modes == 1)
        {
            total += iNum
        }
        if (modes == -1)
        {
            total -= iNum
        }
        if (modes == 2)
        {
            total *= iNum
        }
        if (modes == 3) {
            total /= iNum
        }
        valueString = "\(total)"
        let formatter2:NSNumberFormatter = NSNumberFormatter()
        formatter2.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter2.locale = NSLocale(localeIdentifier: currentCurrency)
        
        let formatter:NSNumberFormatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        valueLabel.text = formatter2.stringFromNumber(total)
        modes = 0
        totalDisplayed = true
        speakThisString("equals \(valueLabel.text!)")
        lastButtonMultiply = false
        lastButtonDivide = false
    }
    
    //MARK - Tapped Clear Button
    
    
    @IBAction func tappedClear(sender: UIButton) {
        total = 0
        modes = 0
        valueString = ""
        valueLabel.text = ""
        lastButtonWasMode = false
        lastButtonClear = true
        speakThisString("Clear")
        lastButtonMultiply = false
        lastButtonDivide = false
        
    }
    
//MARK - Functions
    
//MARK - Set Mode
    func setMode(m:Int64)
    {
    if (total == 0)
    {
    return
    }
    
    modes = m
    lastButtonWasMode = true
    total = Float64(valueString)!
    
    }

//MARK - Speak This String
    func speakThisString(myString: String) {
        mySpeechSynth.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate) //stop speaking when done with action
    let utterance = AVSpeechUtterance(string: myString)
        utterance.voice = AVSpeechSynthesisVoice(language: currentLan.0)
        utterance.volume = speechVolume
        mySpeechSynth.speakUtterance(utterance)
    }
    
//MARK - UIPickerView Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allLan.count
    }
    
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        
//        let myLanString = "\(allLan[row].4) \(allLan[row].3) \(allLan[row].2) (\(allLan[row].1))"
//        return myLanString
//    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: "\(allLan[row].4) \(allLan[row].3) \(allLan[row].2) (\(allLan[row].1))", attributes: [NSForegroundColorAttributeName : UIColor.darkGrayColor()])
        return attributedString
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentLan = allLan[row]
        currentCurrency = allLan[row].0
        speakThisString("\(allLan[row].3)")
    }
    
//    func pickerView(pickerView: UIPickerView, viewForRow row: Int, inComponent component: Int) {
//        let hue = CGFloat(row)/CGFloat(allLan.count)
//        pickerView.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness:1.0, alpha: 1.0)
//    }
    
    
    
//MARK - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//MARK - Speech Welcome
        valueLabel.text = "Welcome"
        let utterance = AVSpeechUtterance(string: "Welcome to my international calculator app, bitches")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        mySpeechSynth.speakUtterance(utterance)
        
        
//Mark - Button Styling (want to happen from beginning)
        self.tipButton.layer.cornerRadius = 10
        self.tipButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.tipButton.layer.borderWidth = 3
        
        self.clearButton.layer.cornerRadius = 10
        self.clearButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.clearButton.layer.borderWidth = 3
        
        self.multiplyButton.layer.cornerRadius = 10
        self.multiplyButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.multiplyButton.layer.borderWidth = 3
        
        self.divideButton.layer.cornerRadius = 10
        self.divideButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.divideButton.layer.borderWidth = 3
        
        self.plusButton.layer.cornerRadius = 10
        self.plusButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.plusButton.layer.borderWidth = 3
        
        self.seven.layer.cornerRadius = 10
        self.seven.layer.borderColor = UIColor.whiteColor().CGColor
        self.seven.layer.borderWidth = 3
        
        self.eight.layer.cornerRadius = 10
        self.eight.layer.borderColor = UIColor.whiteColor().CGColor
        self.eight.layer.borderWidth = 3
        
        self.nine.layer.cornerRadius = 10
        self.nine.layer.borderColor = UIColor.whiteColor().CGColor
        self.nine.layer.borderWidth = 3
        
        self.six.layer.cornerRadius = 10
        self.six.layer.borderColor = UIColor.whiteColor().CGColor
        self.six.layer.borderWidth = 3
        
        self.five.layer.cornerRadius = 10
        self.five.layer.borderColor = UIColor.whiteColor().CGColor
        self.five.layer.borderWidth = 3
        
        self.four.layer.cornerRadius = 10
        self.four.layer.borderColor = UIColor.whiteColor().CGColor
        self.four.layer.borderWidth = 3
        
        self.three.layer.cornerRadius = 10
        self.three.layer.borderColor = UIColor.whiteColor().CGColor
        self.three.layer.borderWidth = 3
        
        self.two.layer.cornerRadius = 10
        self.two.layer.borderColor = UIColor.whiteColor().CGColor
        self.two.layer.borderWidth = 3
        
        self.one.layer.cornerRadius = 10
        self.one.layer.borderColor = UIColor.whiteColor().CGColor
        self.one.layer.borderWidth = 3
        
        self.zero.layer.cornerRadius = 10
        self.zero.layer.borderColor = UIColor.whiteColor().CGColor
        self.zero.layer.borderWidth = 3
        
        self.equalButton.layer.cornerRadius = 10
        self.equalButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.equalButton.layer.borderWidth = 3

        self.valueLabel.layer.cornerRadius = 20
        
        self.minusButton.layer.cornerRadius = 10
        self.minusButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.minusButton.layer.borderWidth = 3
        
        
        
        self.pickerOutlet.layer.cornerRadius = 10
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
