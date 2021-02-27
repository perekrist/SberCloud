//
//  SberCloudApp.swift
//  SberCloud
//

import SwiftUI

@main
struct SberCloudApp: App {
  @State private var token = UserDefaults.standard.value(forKey: "token") as? String ?? ""
  var body: some Scene {
    WindowGroup {
      if token.isEmpty {
        AutorizationView {
          withAnimation {
            token = UserDefaults.standard.value(forKey: "token") as? String ?? ""
          }
        }
      } else {
        MainView() {
          withAnimation {
            token = UserDefaults.standard.value(forKey: "token") as? String ?? ""
          }
        }
      }
    }
  }
}
