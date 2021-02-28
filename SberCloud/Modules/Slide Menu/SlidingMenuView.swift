//
//  SlidingMenuView.swift
//  SberCloud
//
//

import SwiftUI

struct MenuButton: Identifiable {
  var id = UUID()
  var image: String
  var text: String
  var action: () -> Void
}

struct SlidingMenuView: View {
  var onDidRequestToLogOut: (() -> Void)?
  var buttons: [MenuButton]
  
  var isAdmin = UserDefaults.standard.value(forKey: "admin") as? Bool ?? false
  
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.green.light,
                                                 Color.green.dark]),
                     startPoint: .bottomLeading,
                     endPoint: .topTrailing).edgesIgnoringSafeArea(.all)
      HStack {
        VStack(alignment: .leading, spacing: 30) {
          Spacer().frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
          HStack {
            ZStack {
              Circle()
                .frame(width: 50, height: 50)
              Text((UserDefaults.standard.string(forKey: "name") ?? "-").prefix(1))
                .font(Font.bold16)
                .foregroundColor(Color.green.logo)
            }
            HStack {
              Text(UserDefaults.standard.string(forKey: "name") ?? "-").bold()
              if isAdmin {
                Text("Admin").font(Font.light13)
              }
            }
          }.padding(.leading, 20).foregroundColor(.white).font(Font.Sans18.bold)
          Divider().background(Color.white).frame(width: 235, height: 2).padding(.leading, 20)
          ForEach(buttons, id: \.id) { thisButton in
            Button(action: {
              thisButton.action()
            }) {
              HStack {
                Image(thisButton.image)
                Text(thisButton.text)
                  .multilineTextAlignment(.leading)
              }.padding(.leading, 20).foregroundColor(.white).font(Font.Sans18.light)
            }
          }
          Divider().background(Color.white).frame(width: 235, height: 2).padding(.leading, 20)
          Button(action: {
            // Сhart snapshot
          }) {
            HStack {
              Text("Сhart snapshot")
            }.padding(.leading, 20).foregroundColor(.white).font(Font.Sans18.light)
          }
          Button(action: {
            UserDefaults.standard.set("", forKey: "token")
            onDidRequestToLogOut?()
          }) {
            HStack {
              Text("Log Out")
            }.padding(.leading, 50).foregroundColor(.white).font(Font.Sans18.light)
          }
          Spacer()
        }.frame(width: 300)
        .edgesIgnoringSafeArea(.all)
        Spacer()
      }
    }
  }
}
