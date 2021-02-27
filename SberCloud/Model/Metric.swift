//
//  Metric.swift
//  SberCloud
//

import Foundation

struct Metric: Codable {
  private enum CodingKeys: String, CodingKey {
    case id, metricName = "metric_name", name
  }
  
  let id: String?
  let metricName: String?
  let name: String?
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = (try? container.decodeIfPresent(String.self, forKey: .id)) ?? ""
    name = (try? container.decodeIfPresent(String.self, forKey: .name)) ?? ""
    metricName = (try? container.decodeIfPresent(String.self, forKey: .metricName)) ?? ""
  }
}
