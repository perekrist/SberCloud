//
//  SberCloudApp.swift
//  SberCloud
//
//  Created by Кристина Перегудова on 26.02.2021.
//

import SwiftUI

@main
struct SberCloudApp: App {
  @State private var token = UserDefaults.standard.value(forKey: "token") as? String ?? ""
    var body: some Scene {
        WindowGroup {
          if token.isEmpty {
            AutorizationView {
              token = UserDefaults.standard.value(forKey: "token") as? String ?? ""
            }
          } else {
            MainView()
          }
        }
    }
}
