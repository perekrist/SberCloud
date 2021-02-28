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
  func getProjects(completion: @escaping (ProjectsResponse) -> Void) {
    let headers: HTTPHeaders = [HTTPHeader.authorization(UserDefaults.standard.value(forKey: "token") as? String ?? "")]
    baseRequest(url: "/projects", method: .post, headers: headers) { response in
      completion(response)
    }
  }
}

extension NetworkService: CloudEyeNetworkProtocol {
  func getEyeMetricList(projectID: String, completion: @escaping (MetricsResponse) -> Void) {
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
}

extension NetworkService: CloudTraceServiceNetworkProtocol {
  func getTraces(projectID: String, duration: Int, completion: @escaping ([Trace]) -> Void) {
    let headers: HTTPHeaders = [HTTPHeader.authorization(UserDefaults.standard.value(forKey: "token") as? String ?? "")]
    let parametrs: Parameters = ["project_id" : projectID,
                                 "duration_sec": duration]
    baseRequest(url: "/cts/overview", method: .post, params: parametrs, headers: headers) { response in
      completion(response)
    }
  }
  
  func getTraceDetails(projectID: String, traceID: String, duration: Int, completion: @escaping (TraceDetails) -> Void) {
    let headers: HTTPHeaders = [HTTPHeader.authorization(UserDefaults.standard.value(forKey: "token") as? String ?? "")]
    let parametrs: Parameters = ["project_id" : projectID,
                                 "duration_sec": duration,
                                 "trace_id": traceID]
    baseRequest(url: "/cts/detail", method: .post, params: parametrs, headers: headers) { response in
      completion(response)
    }
    
  }
}

extension NetworkService: ApplicationOperationsManagementNetworkProtocol {
  func saveTemplate(projectID: String, namespace: String, completion: @escaping (EmptyResponse) -> Void) {
    let headers: HTTPHeaders = [HTTPHeader.authorization(UserDefaults.standard.value(forKey: "token") as? String ?? "")]
    let parametrs: Parameters = ["project_id" : projectID,
                                 "namespace": namespace,
                                 "raw_data": ""]
    baseRequest(url: "/templates", method: .post, params: parametrs, headers: headers) { response in
      completion(response)
    }
  }
  
  func getMetricList(projectID: String, clusterName: String, completion: @escaping (MetricsResponse) -> Void) {
    let headers: HTTPHeaders = [HTTPHeader.authorization(UserDefaults.standard.value(forKey: "token") as? String ?? "")]
    let parametrs: Parameters = ["project_id" : projectID,
                                 "cluster_name": clusterName]
    baseRequest(url: "/aom/metric_list", method: .post, params: parametrs, headers: headers) { response in
      completion(response)
    }
  }
  
  func getQuery(projectID: String, namespace: String, metricName: String, clusterName: String, completion: @escaping (QueryResponse) -> Void) {
    let headers: HTTPHeaders = [HTTPHeader.authorization(UserDefaults.standard.value(forKey: "token") as? String ?? "")]
    let parametrs: Parameters = ["project_id" : projectID,
                                 "namespace": namespace,
                                 "metric_name": metricName,
                                 "cluster_name": clusterName]
    baseRequest(url: "/aom/query", method: .post, params: parametrs, headers: headers) { response in
      completion(response)
    }
  }
  
  func getClustrers(projectID: String, completion: @escaping (ClustersResponse) -> Void) {
    let headers: HTTPHeaders = [HTTPHeader.authorization(UserDefaults.standard.value(forKey: "token") as? String ?? "")]
    let parametrs: Parameters = ["project_id" : projectID]
    
    baseRequest(url: "/cce/clusters/overview", method: .post, params: parametrs, headers: headers) { response in
      completion(response)
    }
  }
}
