//
//  SingleRotationGesture.swift
//  RotationGestureRecognizer-experiment
//
//  Created by Sean Alling on 14/7/16.
//  Copyright © 2016 akz360. All rights reserved.
//

import Foundation
import UIKit.UIGestureRecognizerSubclass


//
//  Rotation Direction
//
enum RotationDirection: String {
  case CounterClockwise = "counter-clockwise"
  case Clockwise = "clockwise"
}


//
//  GestureRecognizer — Single Touch
//
class SingleTouchRotationGestureRecognizer: UIGestureRecognizer {
  
  private var touchPoints = [CGPoint]()
  private var gestureAngle: CGFloat = 0.0
  
  var rotationDirection: RotationDirection?
  var currentAngle: CGFloat?
  var averagePoint: CGPoint?
  var distanceFromAverage: CGFloat?
  
  //
  //  Constructor Method
  //
  override init(target: Any?, action: Selector?) {
    super.init(target: target, action: action)
  }
  
  //
  //  Number of Touches
  //
  override var numberOfTouches: Int {
    return 1
  }
  
  
  //
  //  Touch Handling Methods
  //
  
  //  Touches Began
  //
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
    super.touchesBegan(touches, with: event)
    
    let touch = touches.first
    let currentPoint = touch?.location(in: self.view)
    
    averagePoint = currentPoint!
    touchPoints = [currentPoint!]
    
    self.state = .began
  }
  
  //  Touches Moved
  //
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
    super.touchesMoved(touches, with: event)
    
    let touch = touches.first
    let currentPoint = touch?.location(in: self.view)
    let previousPoint = touchPoints.last ?? CGPoint.zero
    
    let distance = CGVector(start: currentPoint!, end: previousPoint).length
    
    if distance > 2.0 {
      averagePoint = CGPoint(x: 0.0, y: 0.0)
      
      let lastGestureAngle = gestureAngle
      
      touchPoints.append(currentPoint!)
      
      for point in touchPoints {
        averagePoint!.x += point.x
        averagePoint!.y += point.y
      }
      
      let touchPointsCount = CGFloat(touchPoints.count)
      averagePoint!.x = averagePoint!.x / touchPointsCount
      averagePoint!.y = averagePoint!.y / touchPointsCount
      
      let dx = CGFloat(averagePoint!.x - (currentPoint?.x)!)
      let dy = CGFloat(averagePoint!.y - (currentPoint?.y)!)
      gestureAngle = atan2(dy, dx).toDegrees()
      
      if (abs(gestureAngle - lastGestureAngle) < 45) {
        rotationDirection = gestureAngle < lastGestureAngle ? RotationDirection.CounterClockwise : RotationDirection.Clockwise
        currentAngle = gestureAngle
        distanceFromAverage = CGVector(start: currentPoint!, end: averagePoint!).length
        self.state = .changed
      }
    }
  }
  
  //  Touches Ended
  //
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
    super.touchesEnded(touches, with: event)
    
    rotationDirection = nil
    currentAngle = nil
    distanceFromAverage = nil
    touchPoints.removeAll(keepingCapacity: false)
    
    self.state = .ended
  }
}

