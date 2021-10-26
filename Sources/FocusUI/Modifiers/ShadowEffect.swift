//
//  PanelFocusEffect.swift
//  
//
//  Created by Michael Verges on 10/25/21.
//

import SwiftUI

public struct ShadowEffect: ViewModifier {
  
  var isHovered: Bool
  
  public init(_ isHovered: Bool) {
    self.isHovered = isHovered
  }
  
  public func body(content: Content) -> some View {
    return content
      .shadow(
        color: isHovered ? .black.opacity(0.2) : .white,
        radius: isHovered ? 20 : 0, 
        x: 0, y: 0)
  }
}
