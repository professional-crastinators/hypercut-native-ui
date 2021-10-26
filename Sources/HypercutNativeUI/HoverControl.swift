//
//  HoverControl.swift
//  
//
//  Created by Michael Verges on 10/26/21.
//

import SwiftUI
import ParallaxUI
import FocusUI

public struct HoverControl<Label, Control>: View where Label: View, Control: ParallaxProvider {
  
  var label: Label
  var control: Control
  
  @State var parallax: CGSize = .zero
  @State var isHovered = false
  
  var isFocused: Bool {
    parallax != .zero || isHovered
  }
  
  public init(
    label: () -> (Label),
    control: () -> (Control)
  ) {
    self.label = label()
    self.control = control()
  }
  
  public var body: some View {
    content
      .onHover { isHovered in
        self.isHovered = isHovered
      }
      .animation(.spring(), value: isFocused)
  }
  
  public var content: some View {
    VStack(alignment: .leading) {
      label
      control
      .parallaxProviding { parallax in
        self.parallax = parallax
      }
    }
    .parallaxResponding(parallax)
    .padding(10)
    .background(
      RoundedRectangle(cornerRadius: 20)
        .foregroundColor(.white)
        .parallaxResponding(parallax.scaled(by: 0.5))
        .modifier(ShadowEffect(isFocused))
    )
    .modifier(ScaleEffect(isFocused))
  }
}

//struct HoverControl_Previews: PreviewProvider {
//  static var previews: some View {
//    HoverControl { 
//      <#code#>
//    } control: { 
//      <#code#>
//    }
//
//  }
//}
