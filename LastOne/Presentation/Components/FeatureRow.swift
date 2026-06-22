//
//  FeatureRow.swift
//  LastOne
//
//  Created by Naila Amirova on 22.06.26.
//

import SwiftUI

struct FeatureRow: View {

    let title: String
    let subtitle: String

    var body: some View {

        HStack(alignment: .top, spacing: 16) {

            Image(systemName: "checkmark")
                .foregroundStyle(.primaryAccent)

            VStack(alignment: .leading, spacing: 4) {

                Text(title)
                    .font(.headline)
                    .foregroundStyle(.primaryText)

                Text(subtitle)
                    .foregroundStyle(.secondaryText)
            }

            Spacer()
        }
    }
}
