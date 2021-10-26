//
//  Drag.swift
//  
//
//  Created by Michael Verges on 10/25/21.
//

import SwiftUI

public extension View {
  func drag(
    onChanged: @escaping (DragGesture.Value) -> (),
    onEnded: @escaping (DragGesture.Value) -> ()
  ) -> some View {
    self.gesture(
      DragGesture(minimumDistance: 0)
        .onChanged(onChanged)
        .onEnded(onEnded))
  }
}
