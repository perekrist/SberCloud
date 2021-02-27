//
//  NetworkService+Protocols.swift
//  SberCloud
//

import Foundation
import Alamofire

extension NetworkService: AuthorizationNetworkProtocol {
  func login(withNickname name: String, password: String, completion: @escaping (TokenResponse) -> Void) {
    let parametrs: Parameters = ["login" : name,
                                 "password" : password]
    baseRequest(url: "/login", method: .post, params: parametrs) { response in
      completion(response)
    }
  }
}
