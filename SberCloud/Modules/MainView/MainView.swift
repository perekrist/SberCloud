//
//  MainView.swift
//  SberCloud
//

import SwiftUI

struct MainView: View {
  var onDidRequestToLogOut: (() -> Void)?
  let buttons = [ MenuButton(image: "eye", text: "Cloud Eye", action: {print("1")}),
                  MenuButton(image: "trace", text: "Cloud Trace Service", action: {print("2")}),
                  MenuButton(image: "aom", text: "Application Operations Management ", action: {print("3")}),
                  MenuButton(image: "apm", text: "Application Performance Management", action: {print("4")}) ]
  @State var menuShown = false
  
  var body: some View {
    ZStack {
      SlidingMenuView(onDidRequestToLogOut: onDidRequestToLogOut, buttons: buttons)
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
    }.onAppear {
      NetworkService.shared.getProjects { response in
        
      }
    }
  }
}
