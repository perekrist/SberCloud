//
//  NetworkServiceProtocols.swift
//  SberCloud
//

import Foundation

// MARK: - Authorization

protocol AuthorizationNetworkProtocol {
  func login(withNickname name: String, password: String, completion: @escaping (TokenResponse) -> Void)
}

// MARK: - Charts

protocol ChartsNetworkProtocol {
  func getProjects(completion: @escaping (ProjectsResponse) -> Void)
  func getMetricList(projectID: String, completion: @escaping (MetricsResponse) -> Void)
  func getEyeQyery(projectID: String, namespace: String, metricName: String, completion: @escaping (EyeQueryResponse) -> Void)
}


