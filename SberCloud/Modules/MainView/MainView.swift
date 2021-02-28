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
  
  @State var projects: [Project] = []
  
  var style = ChartStyle(backgroundColor: .white, accentColor: Color.green.logo,
                         gradientColor: GradientColor(start: Color.green.light, end: Color.green.dark),
                         textColor: Color.gray.dark, legendTextColor: Color.gray.dark, dropShadowColor: Color.gray.dark)
  
  @State var showSheet = false
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
              Image(systemName: "equal")
                .padding()
                .foregroundColor(Color.gray.ultraDark)
            }
            Spacer()
            Button(action: {
              withAnimation {
                self.showSheet.toggle()
              }
            }) {
              HStack {
                Text("ru-moscow-1").font(Font.bold16)
                Image(systemName: "chevron.down")
              }.foregroundColor(Color.gray.ultraDark)
              .padding()
            }
            
          }
          HStack(spacing: 13) {
            LineChartView(data: points.map{ $0.min }, title: "upstream_bandwidth_usage", style: style, dropShadow: false)
            LineChartView(data: points2.map{ $0.min }, title: "upstream_bandwidth", dropShadow: false)
          }
          HStack(spacing: 13) {
            LineChartView(data: points3.map{ $0.min }, title: "up_stream", dropShadow: false)
            LineChartView(data: points4.map{ $0.min }, title: "downstream_bandwidth", dropShadow: false)
          }
          HStack(spacing: 13) {
            LineChartView(data: points5.map{ $0.min }, title: "down_stream", dropShadow: false)
            LineChartView(data: points6.map{ $0.min }, title: "rds050_disk_write_throughput", dropShadow: false)
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
        NetworkService.shared.getMetricList(projectID: projectsResponse.response[0].id ?? "") { metricsResponse in
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
        }
      }
    }
  }
}
