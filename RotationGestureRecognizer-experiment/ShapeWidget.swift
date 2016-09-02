//
//  ShapeWidget.swift
//  RotationalGestureRecognizer
//
//  Created by Sean Alling on 10/7/16.
//  Copyright © 2016 akz360. All rights reserved.
//


import UIKit
import SpriteKit


class Square: CAShapeLayer {
  
  func drawSquare(size: Int) {
    
    self.fillColor = UIColor.lightGray.cgColor
    
    masksToBounds = false
    
    let squareRect = CGRect(x: 0 - size / 2, y: 0 - size / 2, width: size, height: size)
    let squarePath = UIBezierPath(roundedRect: squareRect, cornerRadius: 10)
    
    path = squarePath.cgPath
  }
}


class TouchOverlay: CAShapeLayer {
  
  func drawTouchOverlay(length: Int) {
    
    lineWidth = 1
    masksToBounds = false
    drawsAsynchronously = false
    
    let touchOverlayPath = UIBezierPath()
    
    let originRect = CGRect(x: -5, y: -5, width: 10, height: 10)
    let originCircle = UIBezierPath(ovalIn: originRect)
    touchOverlayPath.append(originCircle)
    
    let connectingLineRect = CGRect(x: 0, y: 0, width: length, height: 1)
    let connectingLine = UIBezierPath(rect: connectingLineRect)
    touchOverlayPath.append(connectingLine)
    
    let currentPointRect = CGRect(x: length, y: -10, width: 20, height: 20)
    let currentPointCircle = UIBezierPath(ovalIn: currentPointRect)
    touchOverlayPath.append(currentPointCircle)
    
    path = touchOverlayPath.cgPath
  }
}


class TouchCircle: SKShapeNode {
  
  init(location: CGPoint) {
    super.init()
    
    // generate random point
    //
    self.position = location
    
    // worker circle
    //
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: 0,y: 0), radius: CGFloat(6.5), startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2), clockwise: true)
    self.path = circlePath.cgPath
    self.fillColor = UIColor.clear
    self.strokeColor = UIColor.darkGray
    self.lineWidth = 1.0
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
