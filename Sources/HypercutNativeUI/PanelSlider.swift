//
//  PanelSlider.swift
//  HypercutNativeUI
//
//  Created by Michael Verges on 10/23/21.
//

import SwiftUI
import ParallaxUI

public struct PanelSlider<Content>: ParallaxProvider where Content: View {
  
  @Environment(\.isEnabled) var isEnabled
  
  public init(copying: PanelSlider, onChanged: @escaping (CGSize) -> ()) {
    self.onChanged = onChanged
    self.indicator = copying.indicator
    self._value = copying._value
  }
  
  public var onChanged: ((CGSize) -> ())?
  var indicator: ((CGFloat) -> Content)
  
  @Binding var value: CGFloat
  
  public init(
    value: Binding<CGFloat>,
    indicator: @escaping ((CGFloat) -> Content)
  ) {
    self._value = value
    self.indicator = indicator
  }
  
  public var body: some View {
    sliderView
      .frame(height: isEnabled ? 40 : 10)
      .shadow(
        color: isEnabled ? .accentColor.opacity(0.8 * value) : .clear,
        radius: 10, 
        x: 0, y: 0)
      .shadow(
        color: .black.opacity(0.2),
        radius: 10, 
        x: 0, y: 0)
      .cornerRadius(isEnabled ? 10 : 2)
      .animation(.spring(), value: value)
  }
  
  var sliderView: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        
        Rectangle()
          .foregroundColor(.white.opacity(0.6))
        
        Rectangle()
          .foregroundColor(isEnabled ? .accentColor : .gray)
          .frame(width: geometry.size.width * value)
        if isEnabled {
          HStack {
            Spacer()
            HStack(spacing: 0) {
              indicator(value)
              Spacer()
                .frame(maxWidth: geometry.size.width * (1 - value))
            }
            .frame(alignment: .trailing)
          }
        }
      }
      .drag(onChanged: { value in
        self.value = min(max(0, value.location.x / geometry.size.width), 1)
        @NaturalResistance var diff = value.translation
        onChanged?(diff)
      }, onEnded: { value in
        onChanged?(.zero)
      })
    }
  }
}
