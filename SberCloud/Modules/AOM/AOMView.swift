//
//  AOMView.swift
//  SberCloud
//

import SwiftUI
import SwiftUICharts

struct AOMView: View {
  @State var clusters: [Cluster] = []
  @State var points: [Point] = []
  @State var projectID = ""
  @State var showDetails = false
  
  
  @State var sberStyle = ChartStyle(backgroundColor: .white, accentColor: Color.green.logo, gradientColor: GradientColors.green, textColor: Color.green.logo, legendTextColor: Color.gray.ultraDark, dropShadowColor: Color.green.logo)
  
  var body: some View {
    VStack {
      VStack(alignment: .leading, spacing: 8) {
        ForEach(clusters, id: \.self) { cluster in
          HStack {
            Text("Cluster \"\(cluster.name ?? "")\"").font(Font.Sans18.bold).foregroundColor(Color.green.logo)
              .padding(.vertical, 30)
              .padding(.leading, 16)
            Spacer()
          }.background(Color.white)
          .clipShape(Rounded(size: 20, corners: .allCorners))
          .padding(.horizontal, 20)
          .onTapGesture {
            NetworkService.shared.getQuery(projectID: projectID, namespace: "PAAS.CONTAINER", metricName: "status", clusterName: "utyrtrdf") { response in
              self.points = response.points
              self.showDetails.toggle()
            }
          }
        }
        if showDetails {
          LineView(data: points.map{ $0.average }, title: "Cluster \"utyrtrdf\"", legend: "PAAS.CONTAINER: status", style: sberStyle)
            .padding(.horizontal)
          
          Button {
//            NetworkService.shared.saveTemplate(projectID: projectID, namespace: "PAAS.CONTAINER") { _ in
//
//            }
          } label: {
            Text("Save to snapshot")
              .foregroundColor(Color.gray.ultraDark)
              .font(Font.light18)
              .padding(.vertical, 16)
              .padding(.horizontal, 32)
          }.background(Color.white)
          .cornerRadius(32)
          .padding(.bottom, 80)
          .padding(.leading, 90)
          .shadow(radius: 5)
        }

      }
    }.onAppear {
      NetworkService.shared.getProjects { response in
        projectID = response.response.first?.id ?? ""
        NetworkService.shared.getClustrers(projectID: projectID) { clusters in
          self.clusters = clusters.clusters
        }
      }
    }
  }
}
