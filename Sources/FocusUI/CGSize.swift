//
//  CGSize.swift
//  
//
//  Created by Michael Verges on 10/25/21.
//

import CoreGraphics

public extension CGSize {
  func scaled(by scale: CGFloat) -> CGSize {
    return CGSize(width: self.width * scale, height: self.height * scale)
  }
}
