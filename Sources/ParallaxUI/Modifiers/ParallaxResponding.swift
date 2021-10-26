//
//  ParallaxResponding.swift
//  
//
//  Created by Michael Verges on 10/25/21.
//

import SwiftUI

public extension View {
  func parallaxResponding(_ parallax: CGSize) -> some View {
    self
      .offset(x: parallax.width, y: parallax.height)
      .animation(.spring(), value: parallax)
  }
}

public extension View {
  func parallaxProviding(
    onChanged: @escaping (CGSize) -> ()
  ) -> some View {
    return self.modifier(DefaultParallaxProviding(onChanged))
  }
}
