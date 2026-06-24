//
//  LogStatCard.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


import SwiftUI

struct LogStatCard: View {

    let title: LocalizedStringKey
    let value: LocalizedStringKey
    var valueColor: Color = .primaryText

    var body: some View {

        VStack(spacing: 8) {

            Text(title)
                .font(.headline)
                .foregroundStyle(.secondaryText)

            Text(value)
                .font(.heading2)
                .foregroundStyle(valueColor)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(Color.surface)
        .clipShape(
            RoundedRectangle(
                cornerRadius: AppRadius.xl
            )
        )
        .overlay {

            RoundedRectangle(
                cornerRadius: AppRadius.xl
            )
            .stroke(
                Color.hairline,
                lineWidth: 1
            )
        }
    }
}
