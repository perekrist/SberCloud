//
//  MainView.swift
//  SberCloud
//

import SwiftUI
import SwiftUICharts

struct MainView: View {
  @State var points: [Point] = []
  @State var points2: [Point] = []
  @State var points3: [Point] = []
  @State var points4: [Point] = []
  @State var points5: [Point] = []
  @State var points6: [Point] = []
  @State var points7: [Point] = []
  @State var points8: [Point] = []
  
  @State var sberStyle = ChartStyle(backgroundColor: .white, accentColor: Color.green.logo, gradientColor: GradientColors.green, textColor: Color.green.logo, legendTextColor: Color.gray.ultraDark, dropShadowColor: Color.green.logo)
  
  @State var projects: [Project] = []
  
  @State var showSheet = false
  var onDidRequestToLogOut: (() -> Void)?
  let buttons = [ MenuButton(image: "eye", text: "Cloud Eye", isEnable: true, number: 0),
                  MenuButton(image: "trace", text: "Cloud Trace Service", isEnable: true, number: 1),
                  MenuButton(image: "aom", text: "Application Operations Management ", isEnable: true, number: 2),
                  MenuButton(image: "apm", text: "Application Performance Management", isEnable: false, number: 3),
                  MenuButton(image: "", text: "Сhart snapshot", isEnable: true, number: 4)]
  @State var menuShown = false
  
  @State var selectedPage: Int = 0 {
    didSet {
      menuShown.toggle()
    }
  }
  
  var body: some View {
    ZStack {
      SlidingMenuView(onDidRequestToLogOut: onDidRequestToLogOut, onDidRequestHideMenu: {
        self.menuShown.toggle()
      }, onDidButtonTapped: { num in
        selectedPage = num
      }, buttons: buttons)
      //Foreground View
      ZStack {
        Color.gray.ultraLight.edgesIgnoringSafeArea(.all)
        VStack {
          Spacer().frame(height:UIApplication.shared.windows.first?.safeAreaInsets.top)
          HStack {
            Button(action: {
              self.menuShown.toggle()
            }) {
              Image(systemName: "equal")
                .padding()
                .foregroundColor(Color.gray.ultraDark)
            }
            Spacer()
            Button(action: {
              withAnimation {
                
              }
            }) {
              HStack {
                Image(systemName: "slider.horizontal.3")
              }.foregroundColor(Color.gray.ultraDark)
              .padding()
            }
            
            
            Button(action: {
              withAnimation {
                self.showSheet.toggle()
              }
            }) {
              HStack {
                Text(projects.first?.name ?? "-").font(Font.bold16)
                Image(systemName: "chevron.down")
              }.foregroundColor(Color.gray.ultraDark)
              .padding()
            }
            
          }
          Text(buttons[selectedPage].text).font(Font.Sans18.bold).foregroundColor(Color.gray.dark)
          if selectedPage == 0 {
            VStack(spacing: 8) {
              LineView(data: points.map{ $0.average }, title: "Elastic IP and bandwidth", legend: "upstream_bandwidth_usage", style: sberStyle)
                .padding(.horizontal)
//              LineView(data: points2.map{ $0.average }, title: "Elastic IP and bandwidth", legend: "upstream_bandwidth", style: sberStyle)
//                .padding()
//              LineView(data: points3.map{ $0.average }, title: "Elastic IP and bandwidth", legend: "up_stream", style: sberStyle)
//                .padding()
//              LineView(data: points4.map{ $0.average }, title: "Elastic IP and bandwidth", legend: "downstream_bandwidth", style: sberStyle)
//                .padding()
//              LineView(data: points5.map{ $0.average }, title: "Elastic IP and bandwidth", legend: "down_stream", style: sberStyle)
//                .padding()
              LineView(data: points6.map{ $0.average }, title: "Relational Database Service", legend: "rds050_disk_write_throughput", style: sberStyle)
                .padding(.horizontal)
            }
          } else if selectedPage == 1 {
            CTSView()
          } else if selectedPage == 2 {
            AOMView()
          } else if selectedPage == 4 {
            Templates()
          }
          Spacer()
        }
      }
      .cornerRadius(menuShown ? 20 : 0)
      .edgesIgnoringSafeArea(.all)
      .scaleEffect(menuShown ? 0.9 : 1)
      .offset(x: menuShown ? 300 : 0)
      .animation(.easeInOut(duration: 0.3))
      if showSheet {
        BottomSheet(showSheet: showSheet, projects: projects)
      }
    }.onAppear {
      NetworkService.shared.getProjects { projectsResponse in
        projects = projectsResponse.response
        NetworkService.shared.getEyeMetricList(projectID: projectsResponse.response[0].id ?? "") { metricsResponse in
          NetworkService.shared.getEyeQyery(projectID: projectsResponse.response[0].id ?? "",
                                            namespace: metricsResponse.metrics[1].id ?? "",
                                            metricName: metricsResponse.metrics[1].metricName ?? "") { eyeQueryResponse in
            points = eyeQueryResponse.datapoints
          }
          NetworkService.shared.getEyeQyery(projectID: projectsResponse.response[0].id ?? "",
                                            namespace: metricsResponse.metrics[2].id ?? "",
                                            metricName: metricsResponse.metrics[2].metricName ?? "") { eyeQueryResponse in
            points2 = eyeQueryResponse.datapoints
          }
          NetworkService.shared.getEyeQyery(projectID: projectsResponse.response[0].id ?? "",
                                            namespace: metricsResponse.metrics[3].id ?? "",
                                            metricName: metricsResponse.metrics[3].metricName ?? "") { eyeQueryResponse in
            points3 = eyeQueryResponse.datapoints
          }
          NetworkService.shared.getEyeQyery(projectID: projectsResponse.response[0].id ?? "",
                                            namespace: metricsResponse.metrics[4].id ?? "",
                                            metricName: metricsResponse.metrics[4].metricName ?? "") { eyeQueryResponse in
            points4 = eyeQueryResponse.datapoints
          }
          NetworkService.shared.getEyeQyery(projectID: projectsResponse.response[0].id ?? "",
                                            namespace: metricsResponse.metrics[5].id ?? "",
                                            metricName: metricsResponse.metrics[5].metricName ?? "") { eyeQueryResponse in
            points5 = eyeQueryResponse.datapoints
          }
          NetworkService.shared.getEyeQyery(projectID: projectsResponse.response[0].id ?? "",
                                            namespace: metricsResponse.metrics[6].id ?? "",
                                            metricName: metricsResponse.metrics[6].metricName ?? "") { eyeQueryResponse in
            points6 = eyeQueryResponse.datapoints
          }
          NetworkService.shared.getEyeQyery(projectID: projectsResponse.response[0].id ?? "",
                                            namespace: metricsResponse.metrics[7].id ?? "",
                                            metricName: metricsResponse.metrics[7].metricName ?? "") { eyeQueryResponse in
            points7 = eyeQueryResponse.datapoints
          }
          NetworkService.shared.getEyeQyery(projectID: projectsResponse.response[0].id ?? "",
                                            namespace: metricsResponse.metrics[8].id ?? "",
                                            metricName: metricsResponse.metrics[8].metricName ?? "") { eyeQueryResponse in
            points7 = eyeQueryResponse.datapoints
          }
        }
      }
      
    }
  }
}
