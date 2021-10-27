//
//  PanelButtonStyle.swift
//  
//
//  Created by Michael Verges on 10/26/21.
//

import SwiftUI

public struct PanelButtonStyle: ButtonStyle {
  
  public init(_ accentColor: Color) {
    self.accentColor = accentColor
  }
  
  public var accentColor: Color

  public func makeBody(configuration: Self.Configuration) -> some View {
    return RoundedRectangle(cornerRadius: 20)
      .foregroundColor(
        configuration.isPressed
          ? accentColor.opacity(0.9) 
          : accentColor)
      .frame(height: 60)
      .overlay(
        configuration.label
          .font(.headline)
          .foregroundColor(.white))
  }
}
