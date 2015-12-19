//
//  ViewController.swift
//  StealfieV1
//
//  Created by Dana Martens on 12/7/15.
//  Copyright © 2015 Dana Martens. All rights reserved.
//
import Social
import Accounts
import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,  UINavigationControllerDelegate {
    //MARK - GLOBAL VARIABLES
    
    var currentImage: UIImage!
    var context: CIContext!  //handles rendering
    var currentFilter: CIFilter! // use to pass filters throughout the app
    var filterPressed: Bool! = false
    var stealfieImage: UIImage!
//    var shareImage: UIImage
    
    
    //Mark Counters
    
    var counterCamera: Int!
    var counterNatural: Int!
    var counterArtistic: Int!
    var counterFantasy: Int!
    var counterZen: Int!
    var counter1969: Int!
    var counterDiva: Int!
    var counterVintage: Int!
    var counterCamelot: Int!
    var counterDystopia: Int!
    
//    var information = [Information]()
    var newInfo = Information(name: nil, male: nil, organic: nil, techie: nil, old: nil, travelAbroad: nil, beyonce: nil, oldSchool:nil, religion: nil, drink: nil, geek: nil, finalFilter: nil)
    
    
    
    //MARK - UI Outlets/Elements
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var naturalButton: UIBarButtonItem!
    @IBOutlet weak var fantasyButton: UIBarButtonItem!
    @IBOutlet weak var artisticButton: UIBarButtonItem!
    @IBOutlet weak var toolBar: UIToolbar!
    
    
    //MARK - FUNCTIONS/ACTIONS ----------------
    
    
    
    //Mark Share Tapped
    @IBAction func shareTapped(sender: UIButton) {
        
        if imageView.image != UIImage(named: "stealfiecircle.png") {
            
            let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            let completionHandler: SLComposeViewControllerCompletionHandler!
            let account = ACAccountStore()
            let accountType = account.accountTypeWithAccountTypeIdentifier(
                ACAccountTypeIdentifierTwitter)
            
            
            //Information Variables
            let nameResult = String(newInfo.name!)
            let maleResult = newInfo.male
            let organicResult = newInfo.organic
            let techieResult = newInfo.techie
            let oldResult = newInfo.old
            let travelResult = newInfo.travelAbroad
            let beyonceResult = newInfo.beyonce
            let oldSchoolResult = newInfo.oldSchool
            let religionResult = newInfo.religion
            let drinkResult = newInfo.drink
            let geekResult = newInfo.geek
            
            var finalResultShown: String
            var finalResultHidden:String
            
            var genderText = String()
            var organicText = String()
            var techieText = String()
            var oldText = String()
            var travelText = String()
            var beyonceText = String()
            var oldSchoolText = String()
            var religionText = String()
            var drinkText = String()
            var geekText = String()
            
            //Male Logic
            
            if maleResult != nil {
                var gender = newInfo.male
            } else if maleResult == nil {
                genderText = ("androgynous")
            }
            
            if maleResult == true {
                genderText = ("male")
            } else if maleResult == false {
                genderText = ("female")
            }
            
            
            //Organic Logic
            if organicResult != nil {
                var organic = newInfo.organic
            } else if organicResult == nil {
                organicText = ("so-so")
            }
            
            if organicResult == true {
                organicText = ("health-concious")
            } else if organicResult == false {
                organicText = ("unconcientious")
            }
            
            
            if techieResult != nil {
                var techie = newInfo.techie
            } else if techieResult == nil {
                techieText = ("normal")
            }
            
            if techieResult == true {
                techieText = ("tech-savvy")
            } else if techieResult == false {
                techieText = ("tech-averse")
            }
            
            if oldResult != nil {
                var old = newInfo.old
            } else if oldResult == nil {
                oldText = ("timeless")
            }
            
            if oldResult == true {
                oldText = ("old")
            } else if oldResult == false {
                oldText = ("young")
            }
            
            if travelResult != nil {
                var travel = newInfo.travelAbroad
            } else if travelResult == nil {
                travelText = ("boring")
            }
            
            if travelResult == true {
                travelText = ("jet setting")
            } else if travelResult == false {
                travelText = ("ethnocentric")
            }
            
            if beyonceResult != nil {
                var beyonce = newInfo.beyonce
            } else if beyonceResult == nil {
                beyonceText = ("ambivalent")
            }
            
            if beyonceResult == true {
                beyonceText = ("diverse")
            } else if beyonceResult == false {
                beyonceText = ("racist")
            }
            
            if oldSchoolResult != nil {
                var oldSchool = newInfo.oldSchool
            } else if oldSchoolResult == nil {
                oldSchoolText = ("tried & true")
            }
            
            if oldSchoolResult == true {
                oldSchoolText = ("traditinal")
            } else if oldSchoolResult == false {
                oldSchoolText = ("trend-setter")
            }
            
            if religionResult != nil {
                var religion = newInfo.religion
            } else if religionResult == nil {
                religionText = ("indecisive")
            }
            
            if religionResult == true {
                religionText = ("god-loving")
            } else if religionResult == false {
                religionText = ("atheist")
            }
            
            if drinkResult != nil {
                var drink = newInfo.drink
            } else if drinkResult == nil{
                drinkText = ("freaky")
            }
            
            if drinkResult == true {
                drinkText = ("boozing")
            } else if drinkResult == false {
                drinkText = ("depressingly sober")
            }
            
            if geekResult != nil {
                var geek = newInfo.geek
            } else if geekResult == nil {
                geekText = ("bougie")
            }
            
            if geekResult == true {
                geekText = ("geeky")
            } else if geekResult == false {
                geekText = ("vanilla")
            }
            
            
            var finalFilterText = String()
            
            if newInfo.finalFilter == "Zen" {
                finalFilterText = ("hippie.")
            } else if newInfo.finalFilter == "1969" {
                finalFilterText = ("communist!")
            } else if newInfo.finalFilter == "Diva" {
                finalFilterText = ("narcissist.")
            } else if newInfo.finalFilter == "Vintage" {
                finalFilterText = ("hipster fuck.")
            } else if newInfo.finalFilter == "Camelot" {
                finalFilterText = "social pariah."
            } else if newInfo.finalFilter == "Dystopia" {
                finalFilterText = "paranoid fuck."
            } else if newInfo.finalFilter == nil {
                finalFilterText = "fascist."
            }
            
            
            finalResultHidden = "\(nameResult) is a \(genderText), \(organicText), \(techieText), \(oldText), \(travelText), \(beyonceText), \(oldSchoolText), \(religionText), \(drinkText), \(geekText), and is a \(finalFilterText)."
            
            
            //Shown Tweet
            if (imageView.image != UIImage(named: "stealfiecircle.png")) {
                vc.setInitialText("I'm a \(finalFilterText) \(nameResult) was just stealfied! #stealfie")
                vc.addImage(imageView.image)
                vc.addURL(NSURL(string: "https://twitter.com/hashtag/Stealfie?src=hash"))
                presentViewController(vc, animated: true, completion: nil)
                
                
            } else {
                
                vc.setInitialText("I haven't taken a selfie yet... :( But I've still been stealfied!")
                vc.addImage(stealfieImage)
                vc.addURL(NSURL(string: "https://twitter.com/hashtag/Stealfie?src=hash"))
                presentViewController(vc, animated: true, completion: nil)
                
            }
            
            vc.completionHandler = ({
                switch($0) {
                    //  This means the user cancelled without sending the Tweet
                case .Cancelled:
                    vc.dismissViewControllerAnimated(true, completion: nil)
                    print("Cancelled")
                    self.webPopUp()
                    //                self.didDismissShareDialog(ShareResult.ShareCancelled)
                    //  This means the user hit 'Send'
                case .Done:
                    vc.dismissViewControllerAnimated(true, completion: nil)
                    print("Done")
                    self.webPopUp()
                    
                    //self.didDismissShareDialog(ShareResult.ShareSuccess)
                }
            })
            
            
            
            
            
            
            //Hidden Tweet
            account.requestAccessToAccountsWithType(accountType, options: nil,
                completion: {(success: Bool, error: NSError!) -> Void in
                    if success {
                        let arrayOfAccounts =
                        account.accountsWithAccountType(accountType)
                        
                        if arrayOfAccounts.count > 0 {
                            let twitterAccount = arrayOfAccounts.first as! ACAccount
                            var message = Dictionary<String, AnyObject>()
                            message["status"] = "#Stealfie #mfadt \(nameResult) is a \(genderText), \(religionText), \(drinkText), \(geekText), \(finalFilterText)"
                            print("This is final result: \(finalResultHidden)", self.imageView.image!)
                            
                            
                            
                            let requestURL = NSURL(string:
                                "https://api.twitter.com/1.1/statuses/update.json")
                            let postRequest = SLRequest(forServiceType:
                                SLServiceTypeTwitter,
                                requestMethod: SLRequestMethod.POST,
                                URL: requestURL,
                                parameters: message)
                            
                            
                            print("This is my image \(self.imageView.image!.description)")
                            postRequest.account = twitterAccount
                            
                            
                            
                            //                        let mediaKey = "media" as NSString
                            //                        let imageData = UIImagePNGRepresentation(self.imageView.image!)
                            //                        postRequest.addMultipartData(imageData, withName: "mediaKey", type: nil, filename: nil)
                            
                            
                            //                        if let data = UIImagePNGRepresentation(self.imageView.image!) {
                            //                            return
                            //                        }
                            
                            //
                            //                    postRequest.addMultipartData(imageView.image, withName: "shareImage", type: nil, filename: nil)
                            
                            postRequest.performRequestWithHandler({
                                (responseData: NSData!,
                                urlResponse: NSHTTPURLResponse!,
                                error: NSError!) -> Void in
                                if let err = error {
                                    print("Error : \(err.localizedDescription)")
                                }
                                print("Twitter HTTP response \(urlResponse.statusCode)")
                                
                            })
                        }
                    }
                    else
                    {
                        var alert = UIAlertController(title: "Twitter Account", message: "Please login to your Twitter account.", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                    }
            })
            
            
        } else if imageView.image == UIImage(named: "stealfiecircle.png") {
            return
        }
    }
    



    @IBAction func showFilter(sender: AnyObject) {
    filterPressed = !filterPressed  //every time you press switches the values between if/else below
 
        
        if filterPressed == true {
               toolBar.hidden = false
        } else if filterPressed == false {
               toolBar.hidden = true
        }
         print(newInfo.male)
        
       
    }
    //Camera Controls
   
    @IBAction func importCamera(sender: UIButton) {
        
        if counterCamera == 0 {
            questionCamera()
        } else {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.Camera
        
        picker.cameraCaptureMode = .Photo
        picker.cameraDevice = .Front
        picker.allowsEditing = true
        presentViewController(picker, animated: true, completion: nil)
    }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var newImage: UIImage
        
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        
        
        dismissViewControllerAnimated(true, completion: nil)
        currentImage = newImage

        imageView.image = currentImage  //call this if no CI Filters set up
        
    }
    
    //MARK - FILTERS
    func applyZenFilter() {
        let beginImage = CIImage(image: currentImage)
        
        currentFilter = CIFilter(name: "CIKaleidoscope")
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
//        currentFilter.setValue(20, forKey: kCIInputIntensityKey)
        
        let cgimg = context.createCGImage(currentFilter.outputImage!, fromRect: currentFilter.outputImage!.extent)
        let processedImage = UIImage(CGImage: cgimg)
        
        imageView.image = processedImage
    }
    
    func apply1969Filter() {
        let beginImage = CIImage(image: currentImage)
        
        currentFilter = CIFilter(name: "CIPhotoEffectTransfer")
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        let cgimg = context.createCGImage(currentFilter.outputImage!, fromRect: currentFilter.outputImage!.extent)
        let processedImage = UIImage(CGImage: cgimg)
        
        imageView.image = processedImage
    }
    
    func applyDivaFilter() {
        let beginImage = CIImage(image: currentImage)
        
        currentFilter = CIFilter(name: "CIColorPosterize")
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        let cgimg = context.createCGImage(currentFilter.outputImage!, fromRect: currentFilter.outputImage!.extent)
        let processedImage = UIImage(CGImage: cgimg)
        
        imageView.image = processedImage
    }
    
    func applyVintageFilter() {
        let beginImage = CIImage(image: currentImage)
        
        currentFilter = CIFilter(name: "CIPhotoEffectNoir")
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        let cgimg = context.createCGImage(currentFilter.outputImage!, fromRect: currentFilter.outputImage!.extent)
        let processedImage = UIImage(CGImage: cgimg)
        
        imageView.image = processedImage
    }
    
    func applyCamelotFilter() {
        let beginImage = CIImage(image: currentImage)
        
        currentFilter = CIFilter(name: "CIComicEffect")
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        let cgimg = context.createCGImage(currentFilter.outputImage!, fromRect: currentFilter.outputImage!.extent)
        let processedImage = UIImage(CGImage: cgimg)
        
        imageView.image = processedImage
    }
    
    func applyDystopiaFilter() {
        let beginImage = CIImage(image: currentImage)
        
        currentFilter = CIFilter(name: "CIPhotoEffectInstant")
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        let cgimg = context.createCGImage(currentFilter.outputImage!, fromRect: currentFilter.outputImage!.extent)
        let processedImage = UIImage(CGImage: cgimg)
        
        imageView.image = processedImage
    }
    
    
    //MARK - Set Filter---------------------
    
    func setFilter(action: UIAlertAction!) {
        
        //1969
        if action.title == "1969" && counter1969 == 0 {
            question1969()
        } else if action.title == "1969" && counter1969 != 0 {
            apply1969Filter()
            newInfo.finalFilter = "1969"
        //Zen
        
        } else if action.title == "Zen" && counterZen == 0 {
            questionZen()
        } else if action.title == "Zen" && counterZen != 0 {
            applyZenFilter()
            newInfo.finalFilter = "Zen"
        
        //Diva
        } else if action.title == "Diva" && counterDiva == 0 {
        questionDiva()
            
        } else if action.title == "Diva"  && counterDiva != 0 {
           applyDivaFilter()
            newInfo.finalFilter = "Diva"
            
        //Vintage
        } else if action.title == "Vintage" && counterVintage == 0 {
            questionVintage()
        } else if action.title == "Vintage" && counterVintage != 0 {
            applyVintageFilter()
            newInfo.finalFilter = "Vintage"
            
        //Camelot
        } else if action.title == "Camelot" && counterCamelot == 0 {
            questionCamelot()

        } else if action.title == "Camelot" && counterCamelot != 0 {
            applyCamelotFilter()
            newInfo.finalFilter = "Camelot"
            
        //Dystopia
        } else if action.title == "Dystopia" && counterDystopia == 0 {
            questionDystopia()

        } else if action.title == "Dystopia" && counterDystopia != 0 {
            applyDystopiaFilter()
            newInfo.finalFilter = "Dystopia"
        }
    }
    
    

    
    //NATURAL FILTERS MENU
    @IBAction func naturalFiltersPressed(sender: UIBarButtonItem) {
   
        if imageView.image != UIImage(named: "stealfiecircle.png") && counterNatural == 0  {
            questionNatural()
        } else if imageView.image != UIImage(named: "stealfiecircle.png") && counterNatural != 0 {
            
        let ac = UIAlertController(title: "Natural", message: nil, preferredStyle: .ActionSheet)
        ac.popoverPresentationController?.barButtonItem = naturalButton
        
        ac.addAction(UIAlertAction(title: "1969", style: .Default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Zen", style: .Default, handler: setFilter))
            
            presentViewController(ac, animated: true, completion: nil)

            } else if imageView.image == UIImage(named: "stealfiecircle.png") {
                return
            }
    }
    
    
    //ARTISTIC FILTERS MENU
    @IBAction func artisticFiltersPressed(sender: UIBarButtonItem) {
        
        if imageView.image != UIImage(named: "stealfiecircle.png") && counterArtistic == 0 {
            questionArtistic()
        } else if imageView.image != UIImage(named: "stealfiecircle.png") && counterArtistic != 0 {
        
        let ac = UIAlertController(title: "Artistic", message: nil, preferredStyle: .ActionSheet)
        ac.popoverPresentationController?.barButtonItem = artisticButton
        
        ac.addAction(UIAlertAction(title: "Diva", style: .Default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Vintage", style: .Default, handler: setFilter))
        
        presentViewController(ac, animated: true, completion: nil)
        
        } else if imageView.image == UIImage(named: "stealfiecircle.png"){
            return
        }
    }
    
    //FANTASY FILTERS MENU
    @IBAction func fantasyFiltersPressed(sender: UIBarButtonItem) {
        
        if imageView.image != UIImage(named: "stealfiecircle.png") && counterFantasy == 0 {
            questionFantasy()
        } else if imageView.image != UIImage(named: "stealfiecircle.png") && counterFantasy != 0 {
        
        let ac = UIAlertController(title: "Fantasy", message: nil, preferredStyle: .ActionSheet)
        ac.popoverPresentationController?.barButtonItem = fantasyButton
        
        ac.addAction(UIAlertAction(title: "Camelot", style: .Default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Dystopia", style: .Default, handler: setFilter))
        
        presentViewController(ac, animated: true, completion: nil)
        
        } else if imageView.image == UIImage(named: "stealfiecircle.png") {
            return
        }
    }
    
    
    //MARK QUESTIONS-----------
    
    
//FIRST QUESTION - INITIAL
    func questionInitial() {
        let ac = UIAlertController(title: "Hi, welcome to Stealfie! ", message: "We’ll be asking you a couple of questions as you use the app to help optimize your experience!", preferredStyle: .Alert)
          ac.addAction(UIAlertAction(title: "Okay", style: .Cancel, handler: nil))
        ac.popoverPresentationController?.sourceRect = view.bounds
        ac.popoverPresentationController?.sourceView = view
        presentViewController(ac, animated: true, completion: nil)
        
    }

//SECOND QUESTION - ON CAMERA PRESS
    
    func questionCamera() {
        let ac = UIAlertController(title: "Great, lets take a selfie!", message: "First, \(newInfo.name!) tell us, what gender do you identify as?", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title:"Male", style: .Default) { action in
            self.newInfo.male = true
            self.counterCamera = self.counterCamera+1
            print("Gender/Male Info now is \(self.newInfo.male)")
            print("Camera counter is now \(self.counterCamera)")
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            
            picker.cameraCaptureMode = .Photo
            picker.cameraDevice = .Front
            picker.allowsEditing = true
            self.presentViewController(picker, animated: true, completion: nil)
            })
        
        ac.addAction(UIAlertAction(title:"Female", style: .Default) { action in
            self.newInfo.male = false
            self.counterCamera = self.counterCamera+1
            print("Gender/Male Info now is \(self.newInfo.male)")
            print("Camera counter is now \(self.counterCamera)")
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            
            picker.cameraCaptureMode = .Photo
            picker.cameraDevice = .Front
            picker.allowsEditing = true
            self.presentViewController(picker, animated: true, completion: nil)
            })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        ac.popoverPresentationController?.sourceRect = view.bounds
        ac.popoverPresentationController?.sourceView = view
        presentViewController(ac, animated: true, completion: nil)
    }
    
    
    //THIRD QUESTION - ON NATURAL FILTER PRESS
    
    func questionNatural() {
        let ac = UIAlertController(title: "Nice, keep it natural! ", message: "Speaking of, do you typically buy organic food/products?", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title:"Yes", style: .Default) { action in
            
            let ac = UIAlertController(title: "Natural", message: nil, preferredStyle: .ActionSheet)
            ac.popoverPresentationController?.barButtonItem = self.naturalButton
            
            ac.addAction(UIAlertAction(title: "1969", style: .Default, handler: self.setFilter))
            ac.addAction(UIAlertAction(title: "Zen", style: .Default, handler: self.setFilter))
            
            self.presentViewController(ac, animated: true, completion: nil)
            self.newInfo.organic = true
            self.counterNatural = self.counterNatural+1
            print("Organic Info now is \(self.newInfo.organic)")
            print("Natural counter is now \(self.counterNatural)")

            })
        
        ac.addAction(UIAlertAction(title:"No", style: .Default) { action in
            self.newInfo.organic = false
            self.counterNatural = self.counterNatural+1
            print("Organic Info now is \(self.newInfo.organic)")
            print("Natural counter is now \(self.counterNatural)")
            
            let ac = UIAlertController(title: "Natural", message: nil, preferredStyle: .ActionSheet)
            ac.popoverPresentationController?.barButtonItem = self.naturalButton
            
            ac.addAction(UIAlertAction(title: "1969", style: .Default, handler: self.setFilter))
            ac.addAction(UIAlertAction(title: "Zen", style: .Default, handler: self.setFilter))
            
            self.presentViewController(ac, animated: true, completion: nil)
            
            })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        ac.popoverPresentationController?.sourceRect = view.bounds
        ac.popoverPresentationController?.sourceView = view
        presentViewController(ac, animated: true, completion: nil)
        
    }
    
    //FOURTH QUESTION - ON ZEN PRESS
    
    func questionZen() {
        let ac = UIAlertController(title: "Ohhmmmmmmm… Very zen. Nice.", message: "But \(newInfo.name!)... how zen are you? Do you consider yourself a techie, or do you prefer it all-natural?", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title:"Techie", style: .Default) { action in
            self.newInfo.techie = true
            self.counterZen = self.counterZen+1
            self.applyZenFilter()
            self.newInfo.finalFilter = "Zen"
            print("Old Info now is \(self.newInfo.techie)")
            print("Zen counter is now \(self.counterZen)")
            })
        
        ac.addAction(UIAlertAction(title:"All-Natural", style: .Default) { action in
            self.newInfo.techie = false
            self.counterZen = self.counterZen+1
            self.applyZenFilter()
            self.newInfo.finalFilter = "Zen"
            print("Old Info now is \(self.newInfo.techie)")
            print("Zen counter is now \(self.counterZen)")
            })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        ac.popoverPresentationController?.sourceRect = view.bounds
        ac.popoverPresentationController?.sourceView = view
        presentViewController(ac, animated: true, completion: nil)
    }
    
    //FIFTH QUESTION - ON 1969 Press
    
    func question1969() {
        let ac = UIAlertController(title: "Groovy man, 1969, the summer of love!", message: "Were you alive to see it?", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title:"Yes", style: .Default) { action in
            self.newInfo.old = true
            self.counter1969 = self.counter1969+1
            self.apply1969Filter()
            self.newInfo.finalFilter = "1969"
            print("Old Info now is \(self.newInfo.old)")
            print("Natural counter is now \(self.counter1969)")
            })
        
        ac.addAction(UIAlertAction(title:"No", style: .Default) { action in
            self.newInfo.old = false
            self.counter1969 = self.counter1969+1
            self.apply1969Filter()
            self.newInfo.finalFilter = "1969"
            print("Old Info now is \(self.newInfo.old)")
            print("Natural counter is now \(self.counter1969)")
            
            })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        ac.popoverPresentationController?.sourceRect = view.bounds
        ac.popoverPresentationController?.sourceView = view
        presentViewController(ac, animated: true, completion: nil)
    }

    
    //SIXTH QUESTION - ON ARTISTIC PRESS
    
    func questionArtistic() {
        let ac = UIAlertController(title: "So your an artiste, hey? ", message: "Ever travelled abroad to see all of that great art around the world", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title:"Yes", style: .Default) { action in
            
            let ac = UIAlertController(title: "Artistic", message: nil, preferredStyle: .ActionSheet)
            ac.popoverPresentationController?.barButtonItem = self.artisticButton
            
            ac.addAction(UIAlertAction(title: "Diva", style: .Default, handler: self.setFilter))
            ac.addAction(UIAlertAction(title: "Vintage", style: .Default, handler: self.setFilter))
            
            self.presentViewController(ac, animated: true, completion: nil)


            self.newInfo.travelAbroad = true
            self.counterArtistic = self.counterArtistic+1
            print("Travel Abroad Info now is \(self.newInfo.travelAbroad)")
            print("Artistic counter is now \(self.counterArtistic)")
            })
        
        ac.addAction(UIAlertAction(title:"No", style: .Default) { action in
            
            let ac = UIAlertController(title: "Artistic", message: nil, preferredStyle: .ActionSheet)
            ac.popoverPresentationController?.barButtonItem = self.artisticButton
            
            ac.addAction(UIAlertAction(title: "Diva", style: .Default, handler: self.setFilter))
            ac.addAction(UIAlertAction(title: "Vintage", style: .Default, handler: self.setFilter))
            
            self.presentViewController(ac, animated: true, completion: nil)
            
            self.newInfo.travelAbroad = false
            self.counterArtistic = self.counterArtistic+1
            print("Travel Abroad Info now is \(self.newInfo.travelAbroad)")
            print("Artistic counter is now \(self.counterArtistic)")
            })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        ac.popoverPresentationController?.sourceRect = view.bounds
        ac.popoverPresentationController?.sourceView = view
        presentViewController(ac, animated: true, completion: nil)
    }
    
    //SEVENTH QUESTION - ON DIVA PRESS
    
    func questionDiva() {
        let ac = UIAlertController(title: "Imma a diva, imma a diva… \(newInfo.name!)'s a diva...", message: "So you like the spotlight, cool. But do you more identify with Beyonce or Britney Spears? ", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title:"Beyonce", style: .Default) { action in
            
            self.applyDivaFilter()
            print("Beyonce Info now is \(self.newInfo.beyonce)")
            print("Diva counter is now \(self.counterDiva)")
            self.newInfo.beyonce = true
            self.counterDiva = self.counterDiva+1
            self.newInfo.finalFilter = "Diva"
            })
        
        ac.addAction(UIAlertAction(title:"Britney", style: .Default) { action in
            self.applyDivaFilter()
            print("Beyonce Info now is \(self.newInfo.beyonce)")
            print("Diva counter is now \(self.counterDiva)")
            self.newInfo.beyonce = false
            self.counterDiva = self.counterDiva+1
            self.newInfo.finalFilter = "Diva"
            })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        ac.popoverPresentationController?.sourceRect = view.bounds
        ac.popoverPresentationController?.sourceView = view
        presentViewController(ac, animated: true, completion: nil)
    }

    //EIGHTH QUESTION - ON VINTAGE PRESS
    
    func questionVintage() {
        let ac = UIAlertController(title: "Great, you like it traditional. Us too.", message: "Speaking of, \(newInfo.name!), where'd you Xmas shop this year? In stores, or online?", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title:"In Stores", style: .Default) { action in
            self.newInfo.oldSchool = true
            self.counterVintage = self.counterVintage+1
            self.applyVintageFilter()
            self.newInfo.finalFilter = "Vintage"
            print("Old School Info now is \(self.newInfo.oldSchool)")
            print("Vintage counter is now \(self.counterVintage)")
            })
        
        ac.addAction(UIAlertAction(title:"Online", style: .Default) { action in
            self.newInfo.oldSchool = false
            self.counterVintage = self.counterVintage+1
            self.applyVintageFilter()
            self.newInfo.finalFilter = "Vintage"
            print("Old School Info now is \(self.newInfo.oldSchool)")
            print("Vintage counter is now \(self.counterVintage)")
            })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        ac.popoverPresentationController?.sourceRect = view.bounds
        ac.popoverPresentationController?.sourceView = view
        presentViewController(ac, animated: true, completion: nil)
    }
    
    //NINTH QUESTION - ON FANTASY FILTERS PRESS
    
    func questionFantasy() {
        let ac = UIAlertController(title: "Fantastic(al) \(newInfo.name!)! ", message: "Speaking of fantasies, what is your thoughts on God? Fantasy, or fact?", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title:"Fantasy", style: .Default) { action in
            self.newInfo.religion = false
            self.counterFantasy = self.counterFantasy+1
            
        
            let ac = UIAlertController(title: "Fantasy", message: nil, preferredStyle: .ActionSheet)
            ac.popoverPresentationController?.barButtonItem = self.fantasyButton
            
            ac.addAction(UIAlertAction(title: "Camelot", style: .Default, handler: self.setFilter))
            ac.addAction(UIAlertAction(title: "Dystopia", style: .Default, handler: self.setFilter))
            
            self.presentViewController(ac, animated: true, completion: nil)
            })
        
        ac.addAction(UIAlertAction(title:"Fact", style: .Default) { action in
            self.newInfo.religion = true
            self.counterFantasy = self.counterFantasy+1
            
            let ac = UIAlertController(title: "Fantasy", message: nil, preferredStyle: .ActionSheet)
            ac.popoverPresentationController?.barButtonItem = self.fantasyButton
            
            ac.addAction(UIAlertAction(title: "Camelot", style: .Default, handler: self.setFilter))
            ac.addAction(UIAlertAction(title: "Dystopia", style: .Default, handler: self.setFilter))
            
            self.presentViewController(ac, animated: true, completion: nil)
            })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        ac.popoverPresentationController?.sourceRect = view.bounds
        ac.popoverPresentationController?.sourceView = view
        presentViewController(ac, animated: true, completion: nil)
    }
    
    
    //TENTH QUESTION - ON Camelot Press
    
    func questionCamelot() {
        let ac = UIAlertController(title: "Huzzah! Knights and wizards are your thing, love it.", message: "Say \(newInfo.name!), do you consider yourself a big geek by any chance?", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title:"Yes", style: .Default) { action in
            self.newInfo.geek = true
            self.counterCamelot = self.counterCamelot+1
            self.applyCamelotFilter()
            self.newInfo.finalFilter = "Camelot"
            print("Geek Info now is \(self.newInfo.geek)")
            print("Camelot counter is now \(self.counterCamelot)")
            })
        
        ac.addAction(UIAlertAction(title:"No", style: .Default) { action in
            self.newInfo.geek = false
            self.counterCamelot = self.counterCamelot+1
            self.applyCamelotFilter()
            self.newInfo.finalFilter = "Camelot"
            print("Geek Info now is \(self.newInfo.geek)")
            print("Camelot counter is now \(self.counterCamelot)")
            })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        ac.popoverPresentationController?.sourceRect = view.bounds
        ac.popoverPresentationController?.sourceView = view
        presentViewController(ac, animated: true, completion: nil)
    }
    
    //ELEVENTH QUESTION - On Dystopia Press
    
    func questionDystopia() {
        let ac = UIAlertController(title: "Hmmmm… a pessimist.", message: "Okay, \(newInfo.name!), so how do you quell the fear of the impending apocalypse? Do you drink/use drugs? Or no?", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title:"Yes", style: .Default) { action in
            self.applyDystopiaFilter()
            print("Drink Info now is \(self.newInfo.drink)")
            print("Dystopia counter is now \(self.counterDystopia)")
            self.newInfo.drink = true
            self.counterDystopia = self.counterDystopia+1
            self.newInfo.finalFilter = "Dystopia"
            })
        
        ac.addAction(UIAlertAction(title:"No", style: .Default) { action in
            self.newInfo.drink = false
            self.counterDystopia = self.counterDystopia+1
            self.applyDystopiaFilter()
            print("Drink Info now is \(self.newInfo.drink)")
            print("Dystopia counter is now \(self.counterDystopia)")
            self.newInfo.finalFilter = "Dystopia"
            })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        ac.popoverPresentationController?.sourceRect = view.bounds
        ac.popoverPresentationController?.sourceView = view
        presentViewController(ac, animated: true, completion: nil)
    }
    
    //MARK - WEb Pop Up for Twitter
   
    func webPopUp() {
        let ac = UIAlertController(title: "You've Been Stealfied!", message: "Check out your post on Twitter!", preferredStyle: .Alert)
        
        ac.addAction(UIAlertAction(title: "Whatever, Go Back", style: .Cancel, handler: nil))
        ac.addAction(UIAlertAction(title: "Go to Twitter", style: .Default) { action in
            self.performSegueWithIdentifier("toWeb", sender: self)
            
            })
       
        ac.popoverPresentationController?.sourceRect = view.bounds
        ac.popoverPresentationController?.sourceView = view
        presentViewController(ac, animated: true, completion: nil)
        
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        toolBar.hidden = true
//       shareImage = imageView.image
//        var data: NSData
//        
       
        //MARK-Nav Bar Settings------------------------------
      
        //COLOR
        UINavigationBar.appearance().barTintColor = UIColor.blackColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UINavigationBar.appearance().opaque = true
        
       UIToolbar.appearance().barTintColor = UIColor.blackColor()
        UIToolbar.appearance().opaque = true
        
        
        
        self.title = "Stealfie"
        
        
        
        //CORE IMAGE SETTINGS -------

        context = CIContext(options: nil)
//        currentFilter = CIFilter(name: "CISepiaTone")
        
        
        //MARK - SET INITIAL INFORMATION VARIABLES
        
//        
//        var newInfo = Information(gender: nil, organic: nil, techie: nil, old: nil, travelAbroad: nil, beyonceGaga: nil, oldSchool:nil, religion: nil, drink: nil, geek: nil)
//        information.append(newInfo)
//            
        
        //MARK - FIRST POPUP
        func questionInitial() {
            let ac = UIAlertController(title: "Hi, welcome to Stealfie! ", message: "We’ll be asking you a couple of questions as you use the app to help optimize your experience! Tell us your name so we can get started!", preferredStyle: .Alert)
            ac.addTextFieldWithConfigurationHandler(nil) // adds text field to alert
            ac.addAction(UIAlertAction(title: "Okay", style: .Cancel) { [unowned self, ac] _ in
                let newName = ac.textFields![0]
                //creates new object from text field
                self.newInfo.name = newName.text!//adds it to the persons name.text label
                })
            ac.popoverPresentationController?.sourceRect = view.bounds
            ac.popoverPresentationController?.sourceView = view
            presentViewController(ac, animated: true, completion: nil)
        }
        questionInitial()
        
        //MARK COUNTERS
        counterCamera = 0
        counterNatural = 0
        counterArtistic = 0
        counterFantasy = 0
        counterZen = 0
        counter1969 = 0
        counterDiva = 0
        counterVintage = 0
        counterCamelot = 0
        counterDystopia = 0

        stealfieImage = UIImage(contentsOfFile: "steaflie.png")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    

}

