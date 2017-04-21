//
//  ViewController.swift
//  IntroKit
//
//  Created by sumitmukhija on 04/21/2017.
//  Copyright (c) 2017 sumitmukhija. All rights reserved.
//

import UIKit
import IntroKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let viewController = IntroKit.fireup(["Get Awesome application","Built keeping UI/UX in mind","Apps that you will love","at pseudocode.in"]) { (result) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let endViewController = storyboard.instantiateViewControllerWithIdentifier("EndViewController") as! EndViewController
            self.presentViewController(endViewController, animated: true, completion: nil)
        }
        presentViewController(viewController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

