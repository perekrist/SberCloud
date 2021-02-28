//
//  EyeQueryResponse.swift
//  SberCloud
//

import Foundation

struct EyeQueryResponse: Codable {
  let datapoints: [Point]
}

struct QueryResponse: Codable {
  let points: [Point]
}
