//
//  ParallaxProvider.swift
//  
//
//  Created by Michael Verges on 10/25/21.
//

import SwiftUI

public protocol ParallaxProvider: View {
  init(copying: Self, onChanged: @escaping (CGSize) -> ())
  var onChanged: ((CGSize) -> ())? { get set }
}


public extension ParallaxProvider {
  func parallaxProviding(
    onChanged: @escaping (CGSize) -> ()
  ) -> some View {
    return Self(copying: self, onChanged: onChanged)
  }
}
