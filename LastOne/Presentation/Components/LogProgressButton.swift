//
//  LogProgressButton.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


import SwiftUI

struct LogProgressButton: View {

    let action: () -> Void

    var body: some View {

        Button(action: action) {

            ZStack {

                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color.primaryAccent.opacity(0.18),
                                Color.primaryAccent.opacity(0.06)
                            ],
                            center: .center,
                            startRadius: 40,
                            endRadius: 160
                        )
                    )
                    .frame(width: 250, height: 250)

                Circle()
                    .stroke(
                        Color.primaryAccent.opacity(0.35),
                        lineWidth: 2
                    )
                    .frame(width: 250, height: 250)

                Circle()
                    .fill(Color.secondaryAccent)
                    .frame(width: 180, height: 180)

                VStack(spacing: 6) {

                    Image(systemName: "flame.fill")
                        .font(.system(size: 36))
                        .foregroundStyle(.black)

                    Text("I smoked one")
                        .font(.heading3)
                        .foregroundStyle(.black)

                    Text("TAP TO LOG")
                        .font(.subhead)
                        .tracking(3)
                        .foregroundStyle(.black.opacity(0.7))
                }
            }
        }
        .buttonStyle(.plain)
    }
}
