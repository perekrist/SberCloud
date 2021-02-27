//
//  NetworkService.swift
//  SberCloud
//

import Foundation
import Alamofire

class NetworkService {
  static var shared: NetworkService = {
    let instance = NetworkService()
    return instance
  }()
  
  private let baseURL = "http://37.230.195.51:8080/v1"
  
  func baseRequest<T: Decodable>(url: String,
                                 method: HTTPMethod,
                                 params: Parameters? = nil,
                                 headers: HTTPHeaders? = nil,
                                 completion: @escaping (T) -> Void) {
    print(baseURL + url)
    AF.request(baseURL + url,
               method: method,
               parameters: params,
               encoding: JSONEncoding.default,
               headers: headers).responseData { response in
                switch response.result {
                case .success(let data):
                  print(try? JSONSerialization.jsonObject(with: data, options: []))
                  print("------------------------------------------")
                  let decoder = JSONDecoder()
                  do {
                    let decodedData = try decoder.decode(T.self, from: data)
                    print(decodedData)
                    print("------------------------------------------")
                    completion(decodedData)
                  } catch {
                    print(error)
                    print("------------------------------------------")
                    return
                  }
                case .failure(let error):
                  print(error.localizedDescription)
                  print("------------------------------------------")
                  return
                }
               }
  }
}
