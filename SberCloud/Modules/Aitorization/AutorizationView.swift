//
//  AutorizationView.swift
//  SberCloud
//

import SwiftUI
import SwiftUIX

struct AutorizationView: View {
  @State private var nickname = "hackathon104"
  @State private var password = "Qui1n87Tea5m3"
  
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.green.light,
                                                 Color.green.dark]),
                     startPoint: .bottomLeading,
                     endPoint: .topTrailing).edgesIgnoringSafeArea(.all)
      Image("bg").resizable().edgesIgnoringSafeArea(.all)
      VStack {
        Spacer(minLength: 240)
        ZStack {
          Color.white.opacity(0.24).blur(radius: 32)
          VStack {
            Text("Sign-up").font(Font.bold27).foregroundColor(Color.gray.dark)
              .padding(.vertical, 33)
            TextField("Nickname", text: $nickname)
              .padding()
              .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.white))
              .padding([.horizontal, .bottom], 24)
              .font(Font.light16)
              .cornerRadius(8)
            
            
            TextField("Password", text: $password)
              .padding()
              .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.white))
              .padding(.horizontal, 24)
              .padding(.bottom, 51)
              .font(Font.light16)
          }
        }.border(Color.green.dark, width: 1)
        .cornerRadius(8)
        .padding(.horizontal, 16)
        .frame(height: 279)
        
        Button(action: {
          // Log in
        }) {
          Text("Discover the platform")
            .foregroundColor(Color.gray.ultraDark)
            .font(Font.light18)
            .padding(.vertical, 16)
            .padding(.horizontal, 32)
        }.background(Color.white)
        .cornerRadius(32)
        .padding(.horizontal, 56)
        .padding(.top, 94)
        .shadow(radius: 5)
        
        Spacer()
      }
    }
  }
}
