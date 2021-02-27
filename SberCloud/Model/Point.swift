//
//  Point.swift
//  SberCloud
//

import Foundation

struct Point: Codable {
  let min: Double
  let timestamp: Int?
  let unit: String?
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    min = (try? container.decodeIfPresent(Double.self, forKey: .min)) ?? 0
    timestamp = (try? container.decodeIfPresent(Int.self, forKey: .timestamp)) ?? 0
    unit = (try? container.decodeIfPresent(String.self, forKey: .unit)) ?? ""
  }
}
