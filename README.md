# IntroKit

[![CI Status](http://img.shields.io/travis/sumitmukhija/IntroKit.svg?style=flat)](https://travis-ci.org/sumitmukhija/IntroKit)
[![Version](https://img.shields.io/cocoapods/v/IntroKit.svg?style=flat)](http://cocoapods.org/pods/IntroKit)
[![License](https://img.shields.io/cocoapods/l/IntroKit.svg?style=flat)](http://cocoapods.org/pods/IntroKit)
[![Platform](https://img.shields.io/cocoapods/p/IntroKit.svg?style=flat)](http://cocoapods.org/pods/IntroKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
1. iOS 8+

## Installation

IntroKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "IntroKit"
```

## Documentation
To initialize the minimal intro view controller

````
        let introViewController = IntroKit.fireup(["Get Awesome iOS applications","Built keeping UI/UX in mind","Applications that will make you fall in love","at pseudocode.in"]) { (result) in
        	if(result == true)
        	{
        		//Anything you wish to do, post introduction
        	}
        	else{
        		//error handling
        	}
        }
        self.navigationController?.pushViewController(introViewController, animated: true) //you may push or present the intro view controller
````

Alternate verbose initialization

````
        let introViewController = IntroKit.fireup(["Stop","Wait","Go"], arrayOfColors: [UIColor.redColor(), UIColor.yellowColor(), UIColor.greenColor()], shouldShowButtons: false, shouldShowSkipLabel: true, completion: { (result) in
        	if(result == true)
        	{
        		//Anything you wish to do, post introduction
        	}
        	else{
        		//error handling
        	}
        })
        presentViewController(introViewController, animated: true, completion: nil)
````

## Attributes

 Intro texts to be shown <i>(mandatory)</i>

````
        textArray:[String]
````

UIColor array of background colors
````
        arrayOfColors: [UIColor]? 
````

Boolean that determines visibility of buttons on the left and right edge. The default value is true
````
        shouldShowButtons: Bool?   
````

Boolean that determines if the helper label on the first screen should be visible or not. Default is true
````
        shouldShowSkipLabel:Bool?
````
 Completion block to be called when all the intro cards are swiped. <i>(mandatory)</i>
````
        completion: (result: Bool) -> Void
````



## Author

Sumit Mukhija<br>
Mail:  sumitmukhija@hotmail.com <br>
Facebook: https://www.facebook.com/profile.php?id=1256981685<br>
Twitter: https://twitter.com/sumitmukhija<br>
Contact: +91-8109486933

## License

IntroKit is available under the MIT license. See the LICENSE file for more info.
