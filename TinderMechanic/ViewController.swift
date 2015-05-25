//
//  ViewController.swift
//  TinderMechanic
//
//  Created by Daniel Kwiatkowski on 2015-05-25.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var xFromCenter:CGFloat = 0 //declaring and intializing of type cgfloat of cg variable 0
    var label:UILabel!
    var imageView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        label = UILabel(frame: CGRectMake(self.view.bounds.width / 2 - 100, self.view.bounds.height/2 - 50, 200, 100))
//        label.text = "Drag Me"
//        label.backgroundColor = UIColor.redColor()
//        
//        label.textAlignment = NSTextAlignment.Center
//        self.view.addSubview(label)
//        //gesture recognizer
//        var gesture = UIPanGestureRecognizer(target: self, action: Selector("wasDragged:"))
//        label.addGestureRecognizer(gesture)
//        label.userInteractionEnabled = true
        
        imageView = UIImageView(frame: CGRectMake(self.view.bounds.width/2 - 100, self.view.bounds.height / 2 - 100, 200, 200))
        imageView.image = UIImage(named:"Mario.jpg")
        var gesture = UIPanGestureRecognizer(target: self, action: Selector("wasDragged:"))
        imageView.addGestureRecognizer(gesture)
        imageView.userInteractionEnabled = true
        imageView.backgroundColor = UIColor.redColor()
        self.view.addSubview(imageView)
        
    }
    
    func wasDragged(gesture:UIPanGestureRecognizer){
        let translation = gesture.translationInView(self.view)
        //get what has been dragged
        var profile = gesture.view!
        xFromCenter += translation.x
        var scale = min(100 / abs(xFromCenter), 1)
        profile.center = CGPoint(x: profile.center.x + translation.x, y: profile.center.y + translation.y)
        //reset translation
        gesture.setTranslation(CGPointZero, inView: self.view)
        //rotate the label/image
        var rotation:CGAffineTransform = CGAffineTransformMakeRotation(translation.x/200)
        //stretch the view
        var stretch:CGAffineTransform = CGAffineTransformScale(rotation, scale, scale)
        //stretch the image / label
//        label.transform = stretch
        //whether someone is chosen
        if profile.center.x < 100 {
            println("not chosen")
            // do nothing
        } else{
            println("chosen")
            // we could add chosen user to parse
        }
        // when the gesture state has ended
        
        if gesture.state == UIGestureRecognizerState.Ended {
            // set he label/image back
            profile.center = CGPointMake(view.bounds.width/2, view.bounds.height/2)
            // undo scale
            scale = max(abs(xFromCenter)/100, 1)
            //undo any rotations
            rotation = CGAffineTransformMakeRotation(0)
            //stretch the current view
//            stretch = CGAffineTransformScale(rotation, scale, scale)
            // set the image or label to original size
//            label.frame = CGRectMake(self.view.bounds.width / 2 - 100, self.view.bounds.height / 2 - 50 , 200, 100)
            imageView.frame = CGRectMake(self.view.bounds.width/2 - 100, self.view.bounds.height / 2 - 100, 200, 200)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

