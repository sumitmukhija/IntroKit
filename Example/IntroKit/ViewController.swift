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
    }

    @IBAction func startIntroTapped(sender: AnyObject) {
        let viewController = IntroKit.fireup(["Get Awesome iOS applications","Built keeping UI/UX in mind","Applications that will make you fall in love","at mobly.in"]) { (result) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let endViewController = storyboard.instantiateViewControllerWithIdentifier("EndViewController") as! EndViewController
            self.navigationController?.viewControllers = [endViewController];
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

