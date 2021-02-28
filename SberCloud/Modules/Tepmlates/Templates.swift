//
//  Templates.swift
//  SberCloud
//

import SwiftUI
import SwiftUICharts

struct Templates: View {
  @State var points: [Point] = []
  @State var projectID = "0b965564158026892f0ac00e10148781"
  @State var sberStyle = ChartStyle(backgroundColor: .white, accentColor: Color.green.logo, gradientColor: GradientColors.green, textColor: Color.green.logo, legendTextColor: Color.gray.ultraDark, dropShadowColor: Color.green.logo)
  
    var body: some View {
      VStack {
        LineView(data: points.map{ $0.average }, title: "Cluster \"utyrtrdf\"", legend: "PAAS.CONTAINER: status", style: sberStyle)
          .padding(.horizontal)
      }.onAppear {
        NetworkService.shared.getQuery(projectID: projectID, namespace: "PAAS.CONTAINER", metricName: "status", clusterName: "utyrtrdf") { response in
          self.points = response.points
        }
      }
    }
}
