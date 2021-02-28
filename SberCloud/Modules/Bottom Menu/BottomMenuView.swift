//
//  BottomMenuView.swift
//  SberCloud
//

import SwiftUI
import SwiftUIX

struct BottomSheet: View {
  var edges = UIApplication.shared.windows.first?.safeAreaInsets
  @State var showSheet: Bool
  @State var projects: [Project]
  
  @State var offset: CGFloat = 0
  
  var body: some View {
    VStack {
      Spacer()
      VStack(spacing: 12) {
        Capsule()
          .fill(Color.gray.dark.opacity(0.2))
          .frame(width: 60, height: 5)
          .padding(.bottom)
        VStack(alignment: .leading, spacing: 33) {
          ForEach(projects, id: \.self) { project in
            HStack {
              Text(project.name ?? "").font(Font.bold16)
                .foregroundColor(projects.first?.id == project.id ? Color.green.logo : Color.gray.dark)
              Spacer()
            }.padding(.horizontal, 20)
          }
        }
        Spacer()
      }
      .padding(.top)
      .background(BlurView().clipShape(Rounded(size: 30, corners: [.topLeft, .topRight])))
      .offset(y: offset)
      .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnded(value:)))
      .offset(y: showSheet ? 0 : UIScreen.main.bounds.height)
      .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
    }
    .ignoresSafeArea()
    .background(
      Color.black.opacity(showSheet ? 0.3 : 0).ignoresSafeArea()
        .onTapGesture(perform: {
          withAnimation{ showSheet.toggle() }
        })
    )
  }
  
  func onChanged(value: DragGesture.Value) {
    if value.translation.height > 0 {
      offset = value.translation.height
    }
  }
  
  func onEnded(value: DragGesture.Value) {
    if value.translation.height > 0 {
      withAnimation(Animation.easeIn(duration: 0.2)) {
        let height = UIScreen.main.bounds.height / 3
        if value.translation.height > height / 1.5 {
          showSheet.toggle()
        }
        offset = 0
      }
    }
  }
}

struct BlurView: UIViewRepresentable {
  func makeUIView(context: Context) -> UIVisualEffectView {
    let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterialLight))
    return view
  }
  func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
  }
}
