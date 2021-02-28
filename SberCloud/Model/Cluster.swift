//
//  Cluster.swift
//  SberCloud
//

import Foundation

struct Cluster: Codable, Hashable {
  let uid: String?
  let name: String?
  let status: String?
  let flavor: String?
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    uid = (try? container.decodeIfPresent(String.self, forKey: .uid)) ?? ""
    name = (try? container.decodeIfPresent(String.self, forKey: .name)) ?? ""
    status = (try? container.decodeIfPresent(String.self, forKey: .status)) ?? ""
    flavor = (try? container.decodeIfPresent(String.self, forKey: .flavor)) ?? ""
  }
}
