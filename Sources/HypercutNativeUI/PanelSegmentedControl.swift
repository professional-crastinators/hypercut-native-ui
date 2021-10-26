//
//  PanelSegmentedControl.swift
//  
//
//  Created by Michael Verges on 10/26/21.
//

import SwiftUI
import ParallaxUI

public struct PanelSegmentedControl: ParallaxProvider {
  
  public init(copying: PanelSegmentedControl, onChanged: @escaping (CGSize) -> ()) {
    self._selection = copying._selection
    self.content = copying.content
    self.onChanged = onChanged
  }
  
  public var onChanged: ((CGSize) -> ())?
  
  @Environment(\.isEnabled) var isEnabled
  
  @Binding var selection: Int
  let content: [AnyView]
  
  public init<Views>(selection: Binding<Int>, @ViewBuilder content: () -> TupleView<Views>) {
    self._selection = selection
    self.content = content().getViews
  }
  
  
  public var body: some View {
    HStack {
      ForEach(content.indices) { i in
        control(content[i], index: i)
      }
    }
  }
  
  private func control(_ label: AnyView, index: Int) -> some View {
    RoundedRectangle(cornerRadius: 10)
      .foregroundColor(
        selection == index && isEnabled
          ? Color.accentColor
          : Color.black.opacity(0.05))
      .frame(height: 40)
      .overlay(
        label.foregroundColor(
          selection == index && isEnabled
          ? .white
          : .gray)
      )
      .drag(onChanged: { value in
        self.selection = index
        @NaturalResistance var diff = value.translation
        onChanged?(diff)
      }, onEnded: { value in
        onChanged?(.zero)
      })
      .animation(.spring(), value: selection == index)
  }
}

extension TupleView {
  var getViews: [AnyView] {
    makeArray(from: value)
  }
  
  private struct GenericView {
    let body: Any
    
    var anyView: AnyView? {
      AnyView(_fromValue: body)
    }
  }
  
  private func makeArray<Tuple>(from tuple: Tuple) -> [AnyView] {
    func convert(child: Mirror.Child) -> AnyView? {
      withUnsafeBytes(of: child.value) { ptr -> AnyView? in
        let binded = ptr.bindMemory(to: GenericView.self)
        return binded.first?.anyView
      }
    }
    
    let tupleMirror = Mirror(reflecting: tuple)
    return tupleMirror.children.compactMap(convert)
  }
}

//struct PanelSegmentedControl_Previews: PreviewProvider {
//  static var previews: some View {
//    PanelSegmentedControl(selection: <#T##Binding<Int>#>) { 
//      <#code#>
//    }
//  }
//}
