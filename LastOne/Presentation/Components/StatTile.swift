//
//  StatTile.swift
//  LastOne
//
//  Created by Naila Amirova on 10.06.26.
//


import SwiftUI

struct StatTile: View {

    let title: LocalizedStringKey
    let value: String
    let valueColor: Color

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text(title)
                .font(.footnote)
                .foregroundStyle(.secondaryText)

            Text(value)
                .font(.heading3)
                .foregroundStyle(valueColor)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color.surface)
        .cornerRadius(AppRadius.lg)
    }
}
