//
//  NetworkService+Protocols.swift
//  SberCloud
//

import Foundation
import Alamofire

extension NetworkService: AuthorizationNetworkProtocol {
  func login(withNickname name: String, password: String, domainName: String, completion: @escaping (TokenResponse) -> Void) {
    let parametrs: Parameters = ["login" : name,
                                 "password" : password,
                                 "domain_name": domainName]
    baseRequest(url: "/login", method: .post, params: parametrs) { response in
      completion(response)
    }
  }
}

extension NetworkService: ChartsNetworkProtocol {
  func getMetricList(projectID: String, completion: @escaping (MetricsResponse) -> Void) {
    let headers: HTTPHeaders = [HTTPHeader.authorization(UserDefaults.standard.value(forKey: "token") as? String ?? "")]
    let parametrs: Parameters = ["project_id" : projectID]
    baseRequest(url: "/eye/metric_list", method: .post, params: parametrs, headers: headers) { response in
      completion(response)
    }
  }
  
  func getEyeQyery(projectID: String, namespace: String, metricName: String, completion: @escaping (EyeQueryResponse) -> Void) {
    let headers: HTTPHeaders = [HTTPHeader.authorization(UserDefaults.standard.value(forKey: "token") as? String ?? "")]
    let parametrs: Parameters = ["project_id" : projectID,
                                 "namespace": namespace,
                                 "metric_name": metricName]
    baseRequest(url: "/eye/query", method: .post, params: parametrs, headers: headers) { response in
      completion(response)
    }
  }
  
  func getProjects(completion: @escaping (ProjectsResponse) -> Void) {
    let headers: HTTPHeaders = [HTTPHeader.authorization(UserDefaults.standard.value(forKey: "token") as? String ?? "")]
    baseRequest(url: "/projects", method: .post, headers: headers) { response in
      completion(response)
    }
  }
}
