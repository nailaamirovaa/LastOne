//
//  PlanCard.swift
//  LastOne
//
//  Created by Naila Amirova on 22.06.26.
//

import SwiftUI

struct PlanCard: View {

    let isSelected: Bool
    let title: String
    let subtitle: String
    let badge: String?
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack {

                Circle()
                    .stroke(
                        isSelected
                        ? Color.primaryAccent
                        : Color.hairline,
                        lineWidth: 2
                    )
                    .frame(width: 30, height: 30)
                    .overlay {

                        if isSelected {

                            Circle()
                                .fill(Color.primaryAccent)
                                .frame(width: 14, height: 14)
                        }
                    }

                VStack(alignment: .leading) {

                    Text(title)
                        .font(.title3.bold())
                        .foregroundStyle(.primaryText)

                    Text(subtitle)
                        .foregroundStyle(.secondaryText)
                }

                Spacer()

                if let badge {

                    Text(badge)
                        .font(.subhead.bold())
                        .foregroundStyle(.black)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.primaryAccent)
                        .clipShape(Capsule())
                }
            }
            .padding(20)
            .background(Color.surface)
            .overlay {
                RoundedRectangle(cornerRadius: 24)
                    .stroke(
                        isSelected
                        ? Color.primaryAccent
                        : Color.hairline,
                        lineWidth: isSelected ? 2 : 1
                    )
            }
            .clipShape(
                RoundedRectangle(cornerRadius: 24)
            )
        }
    }
}
