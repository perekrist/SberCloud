//
//  NetworkServiceProtocols.swift
//  SberCloud
//

import Foundation

// MARK: - Authorization

protocol AuthorizationNetworkProtocol {
  func login(withNickname name: String, password: String, completion: @escaping (TokenResponse) -> Void)
}


