//
//  ProgressPanelButtonStyle.swift
//  
//
//  Created by Michael Verges on 10/26/21.
//

import SwiftUI

public struct ProgressPanelButtonStyle: ButtonStyle {
  
  public init(_ accentColor: Color, progress: CGFloat?) {
    self.accentColor = accentColor
    self.progress = progress
  }
  
  public var progress: CGFloat?
  
  public var accentColor: Color

  public func makeBody(configuration: Self.Configuration) -> some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        Rectangle()
          .foregroundColor(
            configuration.isPressed
              ? accentColor.opacity(0.9) 
              : accentColor)
        if let progress = progress {
          Rectangle()
            .foregroundColor(.black.opacity(0.2))
            .frame(width: geometry.size.width * progress)
        }
      }
      .animation(.easeInOut, value: progress)
    }
    .cornerRadius(20)
    .overlay(
      configuration.label
        .font(.headline)
        .foregroundColor(.white))
    .frame(height: 60)
  }
}
