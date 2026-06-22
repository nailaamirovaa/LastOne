//
//  TodaysLogsView.swift
//  LastOne
//
//  Created by Naila Amirova on 19.06.26.
//

import Foundation
import SwiftUI

struct TodaysLogsView: View {

    let logs: [CigaretteLog]

    @Environment(\.dismiss) private var dismiss

    var body: some View {

        NavigationStack {
            
            VStack(spacing: 12) {
                
                Text("All Logs")
                    .font(.heading1)
                    .foregroundStyle(.primaryText)
                
                ScrollView {

                    LazyVStack(spacing: 12) {

                        ForEach(logs) { log in

                            LogRowView(
                                time: logTime(from: log.smokedAt),
                                trigger: log.trigger?.name
                            )
                        }
                    }
                    .padding()
                }
                .background(Color.appBackground)
            }
            .padding(.top, 12)
            .background(Color.appBackground)

            
        }
        .tint(.primaryAccent)
    }
    
    func logTime(from createdAt: String) -> String {

        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [
            .withInternetDateTime,
            .withFractionalSeconds
        ]

        guard let date = isoFormatter.date(from: createdAt) else {
            return "--:--"
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"

        return formatter.string(from: date)
    }
}
