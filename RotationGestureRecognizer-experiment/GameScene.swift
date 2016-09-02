//
//  GameScene.swift
//  RotationGestureRecognizer-experiment
//
//  Created by Sean Alling on 14/7/16.
//  Copyright © 2016 akz360. All rights reserved.
//

import SpriteKit
import GameplayKit

//
//  Game Scene
//
//
class GameScene: SKScene {
  
  let touchOverlay = TouchOverlay()
  let rotatingSquare = Square()
  let clockwiseAntiClockwiseLabel = UILabel(frame: CGRect.zero)
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
  
  //
  //  Did Move To SKView
  //
    override func didMove(to view: SKView) {
        
      let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameScene.tap(gestureRecognizer:)))
      tap.numberOfTapsRequired = 2
      
      view.addGestureRecognizer(tap)
      
//      view.layer.addSublayer(rotatingSquare)
//      
//      clockwiseAntiClockwiseLabel.textAlignment = .center
//      view.addSubview(clockwiseAntiClockwiseLabel)
//      
//      let gestureRecognizer = SingleTouchRotationGestureRecognizer(target: self, action: #selector(GameScene.rotateHandler(gestureRecognizer:)))
//      view.addGestureRecognizer(gestureRecognizer)
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
  
  //
  //  Rotate Handler — Gesture Recognizer Handler
  //
//  func rotateHandler(gestureRecognizer: SingleTouchRotationGestureRecognizer) {
//    
//    switch gestureRecognizer.state {
//    case .began:
//      self.view!.layer.addSublayer(touchOverlay)
//      
//      if let center = gestureRecognizer.averagePoint {
//        touchOverlay.frame = CGRect(origin: center, size: CGSize.zero)
//        touchOverlay.drawTouchOverlay(length: 0)
//      }
//      
//    case .changed:
//      
//      if let angle = gestureRecognizer.currentAngle?.toRadians() {
//        
//        if let center = gestureRecognizer.averagePoint {
//          touchOverlay.frame = CGRect(origin: center, size: CGSize.zero)
//        }
//        
//        let rotateTransform = CATransform3DMakeRotation(CGFloat(angle), 0, 0, 1)
//        touchOverlay.transform = rotateTransform
//        rotatingSquare.transform = rotateTransform
//        
//        let distance = Int(gestureRecognizer.distanceFromAverage ?? 0)
//        touchOverlay.drawTouchOverlay(length: distance)
//        rotatingSquare.drawSquare(size: distance)
//        
//        clockwiseAntiClockwiseLabel.text = gestureRecognizer.rotationDirection?.rawValue
//        
//        print("angle = \(angle.toDegrees().description)")
//      }
//      
//    default:
//      touchOverlay.removeFromSuperlayer()
//      clockwiseAntiClockwiseLabel.text = ""
//    }
//  }
  
  //
  //  Tap Handler
  //
  func tap(gestureRecognizer: UITapGestureRecognizer) {
    
    if gestureRecognizer.state == UIGestureRecognizerState.recognized {
      
      let newCircleTouch = TouchCircle(location: gestureRecognizer.location(in: self.view!))
      self.addChild(newCircleTouch)
    }
  }
}
