//
//  TokenResponse.swift
//  SberCloud
//


import Foundation

struct TokenResponse: Codable {
  enum CodingKeys: String, CodingKey {
    case token = "srv_token"
  }
  
  let token: String
}
