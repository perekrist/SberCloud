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

extension NetworkService: ChartsNetworkProtocol {
  func getProjects(completion: @escaping (TokenResponse) -> Void) {
    let headers: HTTPHeaders = [HTTPHeader.authorization(UserDefaults.standard.value(forKey: "token") as? String ?? "")]
    baseRequest(url: "/projects", method: .post, headers: headers) { response in
      completion(response)
    }
  }
}
