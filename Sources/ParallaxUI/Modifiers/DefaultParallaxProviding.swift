//
//  DefaultParallaxProviding.swift
//  
//
//  Created by Michael Verges on 10/26/21.
//

import SwiftUI

public struct DefaultParallaxProviding: ViewModifier {
  
  var onProvide: (CGSize) -> ()
  
  public init(_ onProvide: @escaping (CGSize) -> ()) {
    self.onProvide = onProvide
  }
  
  public func body(content: Content) -> some View {
    return content
      .drag(onChanged: { value in
        @NaturalResistance var diff = value.translation
        onProvide(diff)
      }, onEnded: { value in
        onProvide(.zero)
      })
  }
}
