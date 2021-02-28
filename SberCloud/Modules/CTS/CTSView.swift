//
//  CTSView.swift
//  SberCloud
//

import SwiftUI

struct CTSView: View {
  @State var traces: [Trace] = []
  @State var projectID = ""
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading, spacing: 8) {
        ForEach(traces, id: \.self) { trace in
          HStack {
            Image(systemName: "checkmark")
              .padding(.leading, 20)
              .padding(.vertical, 30)
              .foregroundColor(Color.green.light)
            Text(trace.name ?? "").font(Font.Sans18.bold)
              .padding(.vertical, 30)
              .padding(.leading, 16)
            Spacer()
            Image(systemName: "chevron.down")
              .padding(.trailing, 20)
              .padding(.vertical, 30)
          }.background(Color.white)
          .clipShape(Rounded(size: 20, corners: .allCorners))
          .padding(.horizontal, 20)
          .onTapGesture {
            NetworkService.shared.getTraceDetails(projectID: projectID, traceID: trace.id ?? "", duration: 300000) { details in
              // Details
            }
          }
        }
      }.padding(.bottom, 8)
    }.onAppear {
      NetworkService.shared.getProjects { response in
        projectID = response.response.first?.id ?? ""
        NetworkService.shared.getTraces(projectID: projectID, duration: 300000) { traces in
          self.traces = traces
        }
      }
    }
  }
}
