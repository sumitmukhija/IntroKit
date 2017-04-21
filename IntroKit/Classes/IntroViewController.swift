//
//  IntroViewController.swift
//  IntroKit
//
//  Created by Sumit on 4/14/17.
//  Copyright © 2017 Sumit Mukhija. All rights reserved.
//

import UIKit
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid")
        assert(green >= 0 && green <= 255, "Invalid")
        assert(blue >= 0 && blue <= 255, "Invalid")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
public class IntroViewController: UIViewController {
    
    //Stored and computed
    var leftSwipeGesture: UISwipeGestureRecognizer!
    var rightSwipeGesture: UISwipeGestureRecognizer!
    
    /*The text to be displayed*/
    var textStrings:[String]? = ["Payment integration added in invoice section","Free up space on your phone", "Make the battery last longer."]
    /*has a maximum of 10 colors. If no color array is defined explicitly, the program can handle 10 cases*/
    var arrayOfColors:[UIColor]? = [UIColor(rgb: 0x2196F3),UIColor(rgb: 0x3F51B5),UIColor(rgb: 0xFF5252),UIColor(rgb: 0x00BCD4),UIColor(rgb: 0x3F51B5),UIColor(rgb: 0x1DE9B6),UIColor(rgb: 0x69F0AE),UIColor(rgb: 0xFF5722),UIColor(rgb: 0x607D8B),UIColor(rgb: 0xFFC107)]
    
    var shouldShowButtons: Bool!
    var shouldShowSkipLabel:Bool!
    var callBack: ((result: Bool) -> Void)!
    
    /*pointer to the color and text index*/
    var index:Int = 0{
        didSet(newValue)
        {
            if (!((newValue < 0) && (newValue > (textStrings?.count)! - 1))){
                self.resetHiddenButtons()
            }
        }
    }
        
    @IBOutlet weak var rightBtnOutlet: UIButton!
    @IBOutlet weak var leftBtnOutlet: UIButton!
    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var expandingView: UIView!
    @IBOutlet weak var foregroundView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        assert(textStrings?.count > 0, "Cannot proceed without text array")
        leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(IntroViewController.swipeDetected(_:)))
        leftSwipeGesture.direction = .Left
        rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(IntroViewController.swipeDetected(_:)))
        rightSwipeGesture.direction = .Right
        foregroundView.addGestureRecognizer(leftSwipeGesture)
        foregroundView.addGestureRecognizer(rightSwipeGesture)
        rightBtnOutlet.tag = 1
        leftBtnOutlet.tag = 0
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        introLabel.text = textStrings![index]
        backgroundView.backgroundColor = arrayOfColors![index]
        expandingView.backgroundColor = arrayOfColors![index]
        expandingView.layer.cornerRadius = expandingView.frame.size.width/2.0
        leftBtnOutlet.hidden = true
        if shouldShowButtons == false{
            self.leftBtnOutlet.hidden = true
            self.rightBtnOutlet.hidden = true
        }
        if shouldShowSkipLabel == false{
            self.swipeLabel.hidden = true
        }
        blinkSwipeLabel()
        
    }
    
    func swipeDetected(sender: UISwipeGestureRecognizer){
        self.expandingView.alpha = 1.0
        if self.index == 0
        {
            swipeLabel.hidden = true
        }
        if sender.direction == .Left{
            self.index = self.index + 1
            if(self.index == (self.textStrings?.count)! - 1)
            {
                rightBtnOutlet.hidden = true
            }
            if(self.index > (self.textStrings?.count)! - 1)
            {
                self.index = self.index - 1
                rightBtnOutlet.hidden = true
                self.dismissViewControllerAnimated(true, completion: {
                  self.callBack(result: true);
                })
                return
            }
        }
        else if sender.direction == .Right{
            self.index = self.index - 1
            if self.index == 0
            {
                leftBtnOutlet.hidden = true
            }
            if(self.index < 0)
            {
                self.index = self.index + 1
                leftBtnOutlet.hidden = true
                return
            }
        }
        
        UIView.animateWithDuration(0.8, animations: {
            self.introLabel.alpha = 0.0
            self.expandingView.backgroundColor = self.arrayOfColors![self.index]
            self.expandingView.transform = CGAffineTransformMakeScale(200, 200)
        }) { (success) in
            self.backgroundView.backgroundColor = self.arrayOfColors![self.index]
            self.expandingView.transform = CGAffineTransformIdentity
            self.expandingView.alpha = 0.0
            self.introLabel.alpha = 1.0
            self.introLabel.text = self.textStrings![self.index]
        }
    }
    
    @IBAction func leftBtnAction(sender: AnyObject) {
        self.swipeDetected(rightSwipeGesture)
    }
    
    @IBAction func rightBtnAction(sender: AnyObject) {
        self.swipeDetected(leftSwipeGesture)
    }
    
    //Swipe label to be shown only on the first screen. will blink and will go once the first screen is swiped
    func blinkSwipeLabel(){
        UIView.animateWithDuration(1.0, animations: {
            self.swipeLabel.alpha = 0.0
        }) { (success) in
            self.swipeLabel.alpha = 1.0
            self.blinkSwipeLabel()
        }
    }
    
    func resetHiddenButtons(){
        leftBtnOutlet.hidden = false
        rightBtnOutlet.hidden = false
    }

}