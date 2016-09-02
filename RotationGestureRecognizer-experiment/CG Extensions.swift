//
//  CGVectorExtensions.swift
//  Blast
//
//  Created by Sean Alling on 28/6/16.
//  Copyright © 2016 akz360. All rights reserved.
//


import Foundation
import SpriteKit


//
//  CGFloat Positive / Negative Methods
//
extension CGFloat {
  
  public func isPositive() -> Bool? {
    guard self <= 0 else {
      return false
    }
    return true
  }
  
  public func isNegative() -> Bool? {
    guard self >= 0 else {
      return false
    }
    return true
  }
}

//
//   CGVector Negative Prefix
//
//
public prefix func - (vector: CGVector) -> CGVector {
  return CGVector(dx: -vector.dx, dy: -vector.dy)
}



//
//   CGPoint Negative Prefix
//
//
public prefix func - (point: CGPoint) -> CGPoint {
  return CGPoint(x: -point.x, y: -point.y)
}


//
//  CGVector Math
//
//
public func + (left: CGVector, right: CGVector) -> CGVector {
  return CGVector(dx: (left.dx + right.dx),
                  dy: (left.dy + left.dy))
}

public func - (left: CGVector, right: CGVector) -> CGVector {
  return CGVector(dx: (left.dx - right.dx),
                  dy: (left.dy - right.dy))
}

public func * (left: CGVector, scalar: CGFloat) -> CGVector {
  return CGVector(dx: (left.dx * scalar),
                  dy: (left.dy * scalar))
}

public func * (scalar: CGFloat, right: CGVector) -> CGVector {
  return CGVector(dx: (right.dx * scalar),
                  dy: (right.dy * scalar))
}

public func / (left: CGVector, scalar: CGFloat) -> CGVector {
  return CGVector(dx: (left.dx / scalar),
                  dy: (left.dy / scalar))
}



//
//   CGVector and CGPoint Math
//
//
public func +(lhs: CGPoint, rhs: CGVector) -> CGPoint {
  return CGPoint(x: (lhs.x + rhs.dx),
                 y: (lhs.y + rhs.dy))
}

public func -(left: CGPoint, right: CGVector) -> CGPoint {
  
  return CGPoint(x: (left.x - right.dx),
                 y: (left.y - right.dy))
}



//
//   CGVector Creation
//
//
public extension CGVector {
  
  public init(start: CGPoint, end: CGPoint) {
    self.dx = end.x - start.x
    self.dy = end.y - start.y
  }
}

public extension CGPoint {
  
  public func vectorFrom(_ origin: CGPoint) -> CGVector {
    return CGVector(start: origin, end: self)
  }
  
  public func vectorTo(_ end: CGPoint) -> CGVector {
    return CGVector(start: self, end: end)
  }
}



//
//    CGVector Useful Functions
//
//
public extension CGVector {
  
  public var magnitude: CGFloat {
    return sqrt((self.dx * self.dx) + (self.dy * self.dy))
  }
  
  public var length: CGFloat {
    return sqrt((self.dx * self.dx) + (self.dy * self.dy))
  }
  
  public var unitVector: CGVector {
    return (self / self.magnitude)
  }
}



//
//  CGFloat Angle Functions
//
//
extension CGFloat {
  
  func toRadians() -> CGFloat {
    return self / CGFloat(180.0 / M_PI)
  }
  
  func toDegrees() -> CGFloat {
    return self * CGFloat(180.0 / M_PI)
  }
}



//
//  Rotate Angle
//
//
