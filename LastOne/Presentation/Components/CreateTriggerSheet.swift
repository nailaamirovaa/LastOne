//
//  CreateTriggerSheet.swift
//  LastOne
//
//  Created by Naila Amirova on 23.06.26.
//


import SwiftUI

struct CreateTriggerSheet: View {

    @Binding var triggerName: String
    let onCreate: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {

            VStack(alignment: .leading, spacing: 8) {

                Text("Create Trigger")
                    .font(.heading3)
                    .foregroundStyle(.primaryText)

                Text("Add a custom trigger that matches your habits.")
                    .font(.footnote)
                    .foregroundStyle(.secondaryText)
            }

            TextField(
                "e.g. Driving",
                text: $triggerName
            )
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(.hairline)
            .cornerRadius(AppRadius.md)

            Button {
                onCreate()
            } label: {
                Text("Create")
                    .font(.headline)
                    .foregroundStyle(.surface)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.primaryAccent)
                    .cornerRadius(AppRadius.pill)
            }
            .disabled(
                triggerName.trimmingCharacters(
                    in: .whitespacesAndNewlines
                ).isEmpty
            )

            Spacer()
        }
        .padding(24)
        .background(Color.appBackground)
    }
}
