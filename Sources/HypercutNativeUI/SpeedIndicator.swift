//
//  SpeedIndicator.swift
//  
//
//  Created by Michael Verges on 10/25/21.
//

import SwiftUI

public struct SpeedIndicator: View {
  
  public init(value: CGFloat) {
    self.value = value
  }
  
  public var value: CGFloat
  
  let minTail: CGFloat = 4
  let maxTail: CGFloat = 50
  
  public var body: some View {
    Group {
      if value < 0.10 {
        slow
      } else if value < 0.30 {
        slow
      } else {
        fast
      }
    }
    .padding(.horizontal, 8)
    .foregroundColor(value > 0.08 ? .white : .gray)
    .transition(.opacity)
    .animation(.spring(), value: value)
  }
  
  var slow: some View {
    if #available(macOS 11.0, iOS 14.0, *) {
      return Image(systemName: "tortoise.fill")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 30)
    } else {
      return Image("tortoise.fill", bundle: .module)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 30)
    }
  }
  
  var fast: some View {
    HStack {
      if value > 0.5 {
        tail
      }
      if #available(macOS 11.0, iOS 14.0, *) {
        Image(systemName: "hare.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 30)
      } else {
        Image("tortoise.fill", bundle: .module)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 30)
      }
    }
  }
  
  var tail: some View {
    VStack(alignment: .trailing, spacing: 4) {
      RoundedRectangle(cornerRadius: 2)
        .frame(
          width: max(minTail, maxTail * (value - 0.5)), 
          height: 4)
      
      RoundedRectangle(cornerRadius: 2)
        .frame(
          width: max(minTail, maxTail * (value - 0.5)), 
          height: 4)
        .offset(x: -8, y: 0)
      
      RoundedRectangle(cornerRadius: 2)
        .frame(
          width: max(minTail, maxTail * (value - 0.5)), 
          height: 4)
    }
  }
  
}

struct SpeedIndicator_Previews: PreviewProvider {
  
  static var previews: some View {
    Group {
      SpeedIndicator(value: 0.0)
        .padding()
        .background(Color.white)
        .previewLayout(.sizeThatFits)
      Group {
        SpeedIndicator(value: 0.4)
        SpeedIndicator(value: 0.6)
        SpeedIndicator(value: 0.8)
        SpeedIndicator(value: 1.0)
      }
      .padding()
      .background(Color.accentColor)
      .previewLayout(.sizeThatFits)
    }
  }
}
