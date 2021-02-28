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
  var isEnable: Bool
  var number: Int
}

struct SlidingMenuView: View {
  var onDidRequestToLogOut: (() -> Void)?
  var onDidRequestHideMenu: (() -> Void)?
  var onDidButtonTapped: ((Int) -> Void)?
  var buttons: [MenuButton]
  
  var isAdmin = UserDefaults.standard.value(forKey: "admin") as? Bool ?? false
  
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.green.dark2,
                                                 Color.green.light2,
                                                 Color.green.light2,
                                                 Color.green.light2]),
                     startPoint: .topLeading,
                     endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
      HStack {
        VStack(alignment: .leading, spacing: 30) {
          Spacer().frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
          VStack(alignment: .leading) {
            Button(action: {
              onDidRequestHideMenu?()
            }) {
              Image(systemName: "xmark")
                .foregroundColor(.white)
                .padding([.horizontal, .bottom])
            }
            HStack {
            ZStack {
              Circle()
                .frame(width: 50, height: 50)
              Text((UserDefaults.standard.string(forKey: "name") ?? "-").prefix(1))
                .font(Font.bold16)
                .foregroundColor(Color.green.logo)
            }
            VStack(alignment: .leading) {
              Text(UserDefaults.standard.string(forKey: "name") ?? "-").font(Font.Sans18.bold)
              if isAdmin {
                Text("Admin").font(Font.light13)
              }
            }
          }.padding(.leading, 20).foregroundColor(.white).font(Font.Sans18.bold)
          }
          Divider().background(Color.white).frame(width: 235, height: 2).padding(.leading, 20)
          ForEach(buttons, id: \.id) { thisButton in
            if thisButton.isEnable {
              Button(action: {
                onDidButtonTapped?(thisButton.number)
              }) {
                HStack {
                  Image(thisButton.image)
                  Text(thisButton.text)
                    .multilineTextAlignment(.leading)
                }.padding(.leading, 20).foregroundColor(.white).font(Font.Sans18.bold)
              }
            } else {
              HStack {
                Image(thisButton.image)
                Text(thisButton.text)
                  .multilineTextAlignment(.leading)
              }.padding(.leading, 20).foregroundColor(Color.white.opacity(0.5)).font(Font.Sans18.light)
            }
          }
          Divider().background(Color.white).frame(width: 235, height: 2).padding(.leading, 20)
          Button(action: {
            UserDefaults.standard.set("", forKey: "token")
            onDidRequestToLogOut?()
          }) {
            HStack {
              Text("Log Out")
            }.padding(.leading, 50).foregroundColor(.white).font(Font.Sans18.bold)
          }
          Spacer()
        }.frame(width: 300)
        .edgesIgnoringSafeArea(.all)
        Spacer()
      }
    }
  }
}
