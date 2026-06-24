//
//  ProgressRingView.swift
//  LastOne
//
//  Created by Naila Amirova on 10.06.26.
//


//
//  ProgressRingView.swift
//  LastOne
//

import SwiftUI

struct ProgressRingView: View {

    let current: Int
    let target: Int

    private var progress: Double {
        guard target > 0 else { return 0 }
        return min(Double(current) / Double(target), 1.0)
    }

    var body: some View {

        ZStack {

            Circle()
                .stroke(
                    .secondarySurface,
                    lineWidth: 24
                )

            Circle()
                .trim(
                    from: 0,
                    to: progress
                )
                .stroke(
                    .primaryAccent,
                    style: StrokeStyle(
                        lineWidth: 24,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(
                    .easeInOut(duration: 0.4),
                    value: progress
                )

            VStack(spacing: 4) {

                Text("\(current)")
                    .font(.display)
                    .foregroundStyle(.primaryText)

                Text("of \(target) today")
                    .font(.bodyText)
                    .foregroundStyle(.secondaryText)
            }
            .frame(width: 170)
        }
        .frame(width: 240, height: 240)
    }
}


