//
//  GameViewController.swift
//  RotationGestureRecognizer-experiment
//
//  Created by Sean Alling on 14/7/16.
//  Copyright © 2016 akz360. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

//
//  GameViewController

class GameViewController: UIViewController {
  
  let touchOverlay = TouchOverlay()
  let rotatingSquare = Square()
  let clockwiseAntiClockwiseLabel = UILabel(frame: CGRect.zero)

  //
  //  View Did Load
  //
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.layer.addSublayer(rotatingSquare)
    
    clockwiseAntiClockwiseLabel.textAlignment = .center
    self.view.addSubview(clockwiseAntiClockwiseLabel)
    
    let gestureRecognizer = SingleTouchRotationGestureRecognizer(target: self, action: #selector(GameViewController.rotateHandler(gestureRecognizer:)))
    self.view.addGestureRecognizer(gestureRecognizer)
  }
  
  //
  //  Rotate Handler — Gesture Recognizer Handler
  //
  func rotateHandler(gestureRecognizer: SingleTouchRotationGestureRecognizer) {
    
    switch gestureRecognizer.state {
    case .began:
      self.view.layer.addSublayer(touchOverlay)
      
      if let center = gestureRecognizer.averagePoint {
        touchOverlay.frame = CGRect(origin: center, size: CGSize.zero)
        touchOverlay.drawTouchOverlay(length: 0)
      }
      
    case .changed:
      
      if let angle = gestureRecognizer.currentAngle?.toRadians() {
        
        if let center = gestureRecognizer.averagePoint {
          touchOverlay.frame = CGRect(origin: center, size: CGSize.zero)
        }
        
        let rotateTransform = CATransform3DMakeRotation(CGFloat(angle), 0, 0, 1)
        touchOverlay.transform = rotateTransform
        rotatingSquare.transform = rotateTransform
        
        let distance = Int(gestureRecognizer.distanceFromAverage ?? 0)
        touchOverlay.drawTouchOverlay(length: distance)
        rotatingSquare.drawSquare(size: distance)
        
        clockwiseAntiClockwiseLabel.text = gestureRecognizer.rotationDirection?.rawValue
        
        print("angle = \(angle.toDegrees().description)")
      }
      
    default:
      touchOverlay.removeFromSuperlayer()
      clockwiseAntiClockwiseLabel.text = ""
    }
  }
  
  //
  //  View Did Layout Subviews
  //
  override func viewDidLayoutSubviews() {
    let squareRectX = self.view.frame.width / 2
    let squareRectY = self.view.frame.height / 2
    rotatingSquare.frame = CGRect(x: squareRectX, y: squareRectY, width: 0, height: 0)
    clockwiseAntiClockwiseLabel.frame = CGRect(x: 0, y: topLayoutGuide.length, width: self.view.frame.width, height: 40)
  }
  
  //
  //  Should AutoRotate
  //
  override var shouldAutorotate: Bool {
    return true
  }

  //
  //  Supported Interface Orientations
  //
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if UIDevice.current.userInterfaceIdiom == .phone {
      return .allButUpsideDown
    } else {
      return .all
    }
  }
  

  //
  //  Did Receive Memory Warning
  //
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }

  //
  //  Prefers Status Bar Hidden
  //
  override var prefersStatusBarHidden: Bool {
    return true
  }
}
