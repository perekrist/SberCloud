//
//  MainView.swift
//  SberCloud
//

import SwiftUI

struct MainView: View {
  
  let buttons = [  MenuButton(text: "Elastic Cloud Server", action: {print("potato")}),
                   MenuButton(text: "Relational Database Servece", action: {print("you pressed the save button")}),
                   MenuButton(text: "Bare Metal Server", action: {print("you pressed the save button")}),
                   MenuButton(text: "Virtual Private Cloud", action: {print("you pressed the save button")}),
                   MenuButton(text: "Elastic Load Balance", action: {print("you pressed the save button")}),
                   MenuButton(text: "Elastic IP", action: {print("you pressed the save button")})
  ]
  @State var menuShown = false
  
  var body: some View {
    ZStack {
      SlidingMenuView(buttons: buttons)
      //Foreground View
      ZStack {
        Color.white.edgesIgnoringSafeArea(.all)
        VStack {
          Spacer().frame(height:UIApplication.shared.windows.first?.safeAreaInsets.top)
          HStack {
            Button(action: {
                    self.menuShown.toggle()
            }) {
              Image(systemName: "ellipsis")
                .padding()
            }
            Spacer()
          }
          Spacer()
        }
      }
      .cornerRadius(menuShown ? 20 : 0)
      .edgesIgnoringSafeArea(.all)
      .scaleEffect(menuShown ? 0.9 : 1)
      .offset(x: menuShown ? 300 : 0)
      .animation(.easeInOut(duration: 0.3))
    }
  }
}
