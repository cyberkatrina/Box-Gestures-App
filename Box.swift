//
//  Box.swift
//  Box-Gestures-App
//
//  Created by Katrina Aliashkevich on 11/15/22.
//

import UIKit

// create a Box class that inherits from the UIView class (Box is subclass of UIView)
class Box: UIView {
    public var row: Int
    public var col: Int
    public var rowCount: Int
    public var colCount: Int
    public var height: CGFloat
    public var width: CGFloat
    public var color: UIColor
    public var mainColor: UIColor
    public var borderColor: UIColor
    public var direction: UISwipeGestureRecognizer.Direction
    
    // initializer for the box class with the parameters: frame, rowCount, colCount, mainColor, borderColor
    init(frame: CGRect, rowCount: Int, colCount: Int, mainColor: UIColor, borderColor: UIColor) {
        self.rowCount = rowCount
        self.colCount = colCount
        // height of box is screen height divided by number of rows
        self.height = frame.height / CGFloat(rowCount)
        // width of box is screen width divided by number of columns
        self.width = frame.width / CGFloat(colCount)
        self.mainColor = mainColor
        self.borderColor = borderColor
        // the row starts out in the middle of the screen
        self.row = (rowCount / 2)
        // the column starts out in the middle of the screen
        self.col = (colCount / 2)
        // initialize the box color to be it's main color at first
        self.color = mainColor
        // initialize the box direction to be down at first
        self.direction = UISwipeGestureRecognizer.Direction.down
        // get the frame definition from the super class
        super.init(frame: frame)
        // set the background color of the screen to white
        backgroundColor = UIColor.white
    }
    
    // function runs when the draw function is called (overrides it)
    public override func draw(_ rect: CGRect) {
        // create a CGRect called drect at the proper column and row with the proper width and height
        let drect = CGRect(x: CGFloat(col) * width, y: CGFloat(row) * height, width: CGFloat(width), height: CGFloat(height))
        // create a UIBezierPath called bpath that takes the drect as the parameter
        let bpath: UIBezierPath = UIBezierPath(rect: drect)
        // set the current color
        color.set()
        // fill the bpath with that color
        bpath.fill()
    }
    
    // function moves the box
    public func move() {
        // if the color of the box is the border color
        if (color == borderColor) {
            // movement stops, player no longer able to move box
            return
        }
        // if the direction of the box is down
        if (direction == UISwipeGestureRecognizer.Direction.down) {
            // if box is above the bottom row
            if (row < rowCount - 1) {
                // move it 1 row lower
                row += 1
            }
            // as soon as the box reaches the bottom row
            if (row == rowCount - 1) {
                // change the color of the box to be the border color
                color = borderColor
            }
        }
        // if the direction of the box is up
        else if (direction == UISwipeGestureRecognizer.Direction.up) {
            // if the box is below the top row
            if (row > 0) {
                // move it 1 row higher
                row -= 1
            }
            // as soon as the box reaches the top row
            if (row == 0) {
                // change the color of the box to be the border color
                color = borderColor
            }
        }
        // if the direction of the box is right
        else if (direction == UISwipeGestureRecognizer.Direction.right) {
            // if the box is left of the rightmost column
            if (col < colCount - 1) {
                // move it 1 column right
                col += 1
            }
            // as soon as the box reaches the rightmost column
            if (col == colCount - 1){
                // change the color of the box to be the border color
                color = borderColor
            }
        }
        // if the direction of the box is left
        else if (direction == UISwipeGestureRecognizer.Direction.left) {
            // if the box is right of the leftmost column
            if (col > 0) {
                // move it 1 column left
                col -= 1
            }
            // as soon as the box reaches the leftmost column
            if (col == 0){
                // change the color of the box to be the border color
                color = borderColor
            }
        }
        // update the view display UI in the main queue as the priority
        DispatchQueue.main.async {
            self.setNeedsDisplay()
        }
    }
    
    // function resets the box when user taps on the screen
    public func tap() {
        // row of the box resets to middle of screen
        self.row = (rowCount / 2)
        // column of the box resets to middle of screen
        self.col = (colCount / 2)
        // color resets to the main color (green)
        self.color = mainColor
        // direction resets to be down
        self.direction = UISwipeGestureRecognizer.Direction.down
        // update the view display UI in the main queue as the priority
        DispatchQueue.main.async {
            self.setNeedsDisplay()
        }
    }
    // function cathces error
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
