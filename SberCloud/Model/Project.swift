//
//  Project.swift
//  SberCloud
//

import Foundation

struct Project: Codable {
  private enum CodingKeys: String, CodingKey {
    case id, description, name
  }
  
  let id: String?
  let description: String?
  let name: String?
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = (try? container.decodeIfPresent(String.self, forKey: .id)) ?? ""
    name = (try? container.decodeIfPresent(String.self, forKey: .name)) ?? ""
    description = (try? container.decodeIfPresent(String.self, forKey: .description)) ?? ""
  }
}
