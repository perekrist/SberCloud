//
//  UIColor+Hex.swift
//  SberCloud
//

import UIKit
import SwiftUI

extension UIColor {
  convenience init(hexString: String) {
    let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int = UInt64()
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (255, 0, 0, 0)
    }
    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
  }
}

extension UIColor {
  var uiColor: Color { Color(self) }
}

extension Color {
  struct green {
    static let light = UIColor(hexString: "00956F").uiColor
    static let dark = UIColor(hexString: "07E897").uiColor
    static let light2 = UIColor(hexString: "00956F").uiColor
    static let dark2 = UIColor(hexString: "07E897").uiColor.opacity(0.6)
    static let logo = UIColor(hexString: "00CC99").uiColor
  }
  struct gray {
    static let dark = UIColor(hexString: "120E21").uiColor
    static let ultraDark = UIColor(hexString: "343F48").uiColor
    static let ultraLight = UIColor(hexString: "F6F6F6").uiColor
  }
}
