//
//  Trace.swift
//  SberCloud
//

import Foundation

struct Trace: Codable, Hashable {
  private enum CodingKeys: String, CodingKey {
    case id = "Id", name = "Trace Name", type = "Resource Type", operatr = "Operator"
  }
  let id: String?
  let name: String?
  let type: String?
  let operatr: String?
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = (try? container.decodeIfPresent(String.self, forKey: .id)) ?? ""
    name = (try? container.decodeIfPresent(String.self, forKey: .name)) ?? ""
    type = (try? container.decodeIfPresent(String.self, forKey: .type)) ?? ""
    operatr = (try? container.decodeIfPresent(String.self, forKey: .operatr)) ?? ""
  }
}

struct TraceDetails: Codable {
  private enum CodingKeys: String, CodingKey {
    case id = "trace_id", name = "trace_name", type = "resource_type", time
  }
  let id: String?
  let name: String?
  let type: String?
  let time: Int?
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = (try? container.decodeIfPresent(String.self, forKey: .id)) ?? ""
    name = (try? container.decodeIfPresent(String.self, forKey: .name)) ?? ""
    type = (try? container.decodeIfPresent(String.self, forKey: .type)) ?? ""
    time = (try? container.decodeIfPresent(Int.self, forKey: .time)) ?? 0
  }
}
