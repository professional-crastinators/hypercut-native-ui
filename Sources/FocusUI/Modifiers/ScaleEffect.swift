//
//  ScaleEffect.swift
//  
//
//  Created by Michael Verges on 10/26/21.
//

import SwiftUI

public struct ScaleEffect: ViewModifier {
  
  @Environment(\.isEnabled) var isEnabled
  
  var isHovered: Bool
  var scale: CGFloat
  
  public init(_ isHovered: Bool, scale: CGFloat = 1.05) {
    self.scale = scale
    self.isHovered = isHovered
  }
  
  public func body(content: Content) -> some View {
    return content
      .scaleEffect(isHovered && isEnabled ? scale : 1)
  }
}
