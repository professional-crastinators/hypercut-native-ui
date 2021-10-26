//
//  NaturalResistance.swift
//  
//
//  Created by Michael Verges on 10/25/21.
//

import CoreGraphics

@propertyWrapper
public struct NaturalResistance {
  
  public init(wrappedValue value: CGSize) {
    self.value = value
  }
  
  public var wrappedValue: CGSize {
    get { resist(value) }
    set { value = newValue }
  }
  
  private var value: CGSize
  
  private func resist(_ size: CGSize) -> CGSize {
    var diff = CGSize.zero
    if size.width < 0 {
      diff.width = -sqrt(-size.width) / 2
    } else {
      diff.width = sqrt(size.width) / 2
    }
    
    if size.height < 0 {
      diff.height = -sqrt(-size.height) / 2
    } else {
      diff.height = sqrt(size.height) / 2
    }
    
    return diff
  }
}
