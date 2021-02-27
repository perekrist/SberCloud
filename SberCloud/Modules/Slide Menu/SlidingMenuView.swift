//
//  SlidingMenuView.swift
//  SberCloud
//
//

import SwiftUI

struct MenuButton: Identifiable {
  var id = UUID()
  var text: String
  var action: () -> Void
}

struct SlidingMenuView: View {
  
  var buttons: [MenuButton]
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.green.light,
                                                 Color.green.dark]),
                     startPoint: .bottomLeading,
                     endPoint: .topTrailing).edgesIgnoringSafeArea(.all)
      HStack {
        VStack(alignment: .leading, spacing: 30) {
          Spacer().frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
          Button(action: {
            // Profile
          }) {
            HStack {
              Text("Kristina\nPeregudova").bold()
            }.padding(.leading, 50).foregroundColor(.white).font(Font.Sans18.bold)
          }
          Divider().background(Color.white).frame(width: 235, height: 2).padding(.leading, 20)
          ForEach(buttons, id: \.id) { thisButton in
            Button(action: {
              thisButton.action()
            }) {
              HStack {
                Text(thisButton.text)
              }.padding(.leading, 50).foregroundColor(.white).font(Font.Sans18.light)
            }
          }
          Divider().background(Color.white).frame(width: 235, height: 2).padding(.leading, 20)
          Button(action: {
            // Log out
          }) {
            HStack {
              Text("Log Out")
            }.padding(.leading, 50).foregroundColor(.white).font(Font.Sans18.light)
          }
          Spacer()
        }.edgesIgnoringSafeArea(.all)
        Spacer()
      }
    }
  }
}
