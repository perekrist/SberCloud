//
//  RoundedShape.swift
//  SberCloud
//

import SwiftUI

struct Rounded: Shape {
  let size: CGFloat
  let corners: UIRectCorner
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: size, height: size))
    return Path(path.cgPath)
  }
}
