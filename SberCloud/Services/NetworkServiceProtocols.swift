//
//  NetworkServiceProtocols.swift
//  SberCloud
//

import Foundation

// MARK: - Authorization

protocol AuthorizationNetworkProtocol {
  func login(withNickname name: String, password: String, domainName: String, completion: @escaping (TokenResponse) -> Void)
}

// MARK: - Charts

protocol ChartsNetworkProtocol {
  func getProjects(completion: @escaping (ProjectsResponse) -> Void)
}

// MARK: - Cloud Eye

protocol CloudEyeNetworkProtocol {
  func getEyeMetricList(projectID: String, completion: @escaping (MetricsResponse) -> Void)
  func getEyeQyery(projectID: String, namespace: String, metricName: String, completion: @escaping (EyeQueryResponse) -> Void)
}

// MARK: - Cloud Trace Service

protocol CloudTraceServiceNetworkProtocol {
  func getTraces(projectID: String, duration: Int, completion: @escaping ([Trace]) -> Void)
  func getTraceDetails(projectID: String, traceID: String, duration: Int, completion: @escaping (TraceDetails) -> Void)
}

// MARK: - Application Operations Management

protocol ApplicationOperationsManagementNetworkProtocol {
  
}

// MARK: - Application Performance Management

protocol ApplicationPerformanceManagementNetworkProtocol {
  
}

// MARK: - Сhart Snapshot

protocol СhartSnapshotNetworkProtocol {
  
}
