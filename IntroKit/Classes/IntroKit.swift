//
//  IntroKit.swift
//  IntroKit
//
//  Created by Sumit on 4/14/17.
//  Copyright © 2017 Sumit Mukhija. All rights reserved.
//

import Foundation

public class IntroKit
{
    public class func fireup(textArray:[String],arrayOfColors:[UIColor]? = nil, shouldShowButtons: Bool? = true, shouldShowSkipLabel: Bool? = true, dataDictionary: Dictionary<String,AnyObject>? = nil) ->
        IntroViewController{
        let storyboard = UIStoryboard(name: "Introboard", bundle: NSBundle(forClass: IntroViewController.self))
        let viewController = storyboard.instantiateViewControllerWithIdentifier("IntroViewController") as! IntroViewController
        viewController.shouldShowButtons = shouldShowButtons
        viewController.shouldShowSkipLabel = shouldShowSkipLabel
        if let _ = arrayOfColors{
            assert(arrayOfColors?.count == textArray.count, "Number of colors and text array count doesn't match. Try sending nil for the array of colors")
            viewController.arrayOfColors = arrayOfColors
        }
        
        viewController.textStrings = textArray
        return viewController
    }
}