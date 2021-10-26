//
//  SwiftUIView.swift
//  
//
//  Created by Michael Verges on 10/25/21.
//

import SwiftUI
import ParallaxUI
import FocusUI

struct SwiftUIView: View {
  
  @State var value: CGFloat = .zero
  @State var value2: CGFloat = .zero
  @State var selection: Int = 0
  
  var body: some View {
    VStack(alignment: .leading, spacing: 40) {
      Spacer()
      segmentControl
      speedSlider
      numberSlider
      Spacer()
    }
    .padding(50)
    .background(Color.white)
  }
  
  var segmentControl: some View {
    HoverControl { 
      VStack(alignment: .leading) {
        Text("These Hover Views")
          .font(.headline)
        Text("Are now more configurable")
          .font(.subheadline)
      }
    } control: {
      PanelSegmentedControl(selection: $selection) { 
        Text("Option")
        HStack {
          Text("Hi")
          Spacer()
        }
        .padding(.horizontal, 8)
      }
    }
  }
  
  var speedSlider: some View {
    HoverControl { 
      VStack(alignment: .leading) {
        Text("These Hover Views")
          .font(.headline)
        Text("Are now more configurable")
          .font(.subheadline)
      }
    } control: { 
      PanelSlider(value: $value) { value in
        SpeedIndicator(value: value)
      }
    }
  }
  
  var numberSlider: some View {
    HoverControl {
      Text("Use Custom Indicators")
        .font(.headline)
    } control: { 
      PanelSlider(value: $value2) { value in
        Text(String(format: "%.2f", value))
          .font(.headline)
          .padding(.horizontal, 8)
          .foregroundColor(value > 0.08 ? .white : .gray)
      }
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIView()
  }
}
