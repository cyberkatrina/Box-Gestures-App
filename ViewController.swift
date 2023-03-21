//
//  ViewController.swift
//  Box-Gestures-App
//
//  Created by Katrina Aliashkevich on 11/14/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    // initiate the variable thread of the type Thread
    var thread: Thread?
    // create variable box of the Box class
    var box: Box!
    
    // function runs every time the view is visible
    override func viewDidAppear(_ animated: Bool) {
        // if the box is already initialized
        if box != nil {
            return
        }
        // make frame the same safe area layout as the view
        let frame = self.view.safeAreaLayoutGuide.layoutFrame
        // make the box object with the fram, 19 rows, 9 columns, green main color, and red border color
        box = Box(frame: frame, rowCount: 19, colCount: 9, mainColor: UIColor.green, borderColor: UIColor.red)
        // add the box object as a subview to the main view
        view.addSubview(box)
        // call the multithreading function with the box object as the parameter
        initThread(box: box)
        // assign the tap gesture recognizer with it's Tapfunction as selector
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(recognizeTapGesture(recognizer: )))
        // add the tap gesture recognizer to the box subview
        self.box.addGestureRecognizer(tapRecognizer)
        
        // assign the swipe gesture recognizer with it's Swipefunction as selector
        var swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(recognizeSwipeGesture(recognizer: )))
        // make the direction of the swipe recognizer go right
        swipeRecognizer.direction = UISwipeGestureRecognizer.Direction.right
        // add the right swipe gesture recognizer to the box subview
        self.box.addGestureRecognizer(swipeRecognizer)
        // assign a new swipe gesture recognizer with it's Swipefunction as selector
        swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(recognizeSwipeGesture(recognizer: )))
        // make the direction of the swipe recognizer go left
        swipeRecognizer.direction = UISwipeGestureRecognizer.Direction.left
        // add the left swipe gesture recognizer to the box subview
        self.box.addGestureRecognizer(swipeRecognizer)
        // assign a new swipe gesture recognizer with it's Swipefunction as selector
        swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(recognizeSwipeGesture(recognizer: )))
        // make the direction of the swipe recognizer go up
        swipeRecognizer.direction = UISwipeGestureRecognizer.Direction.up
        // add the up swipe gesture recognizer to the box subview
        self.box.addGestureRecognizer(swipeRecognizer)
        // assign a new swipe gesture recognizer with it's Swipefunction as selector
        swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(recognizeSwipeGesture(recognizer: )))
        // make the direction of the swipe recognizer go down
        swipeRecognizer.direction = UISwipeGestureRecognizer.Direction.down
        // add the down swipe gesture recognizer to the box subview
        self.box.addGestureRecognizer(swipeRecognizer)
    }
    
    // the multi-threading function that takes an activeTimer as a parameter
    func initThread(box: Box) {
        // if the thread already exists, don't create a new thread and just exit
        if thread != nil {
            return
        }
        // assign the thread variable to the inline Thread class
        thread = Thread {
            // infinite while loop
            while true {
                // pause for 0.3 second
                usleep(300000)
                // run the move function on the box object
                box.move()
            }
        }
        // create a new thread
        thread!.start()
    }
    
    // function to recognize when the user taps on the screen
    @IBAction func recognizeTapGesture(recognizer:UITapGestureRecognizer) {
        // run the tap function on the box object
        box.tap()
    }
    
    // function to recognize when the user swipes on the screen
    @IBAction func recognizeSwipeGesture(recognizer:UISwipeGestureRecognizer) {
        // make the direction parameter of the box object the same direction as the recognizer in the function call
        box.direction = recognizer.direction
        }
    }
