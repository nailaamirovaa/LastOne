//
//  EditPlanSheet.swift
//  LastOne
//
//  Created by Naila Amirova on 21.06.26.
//


import SwiftUI

struct EditPlanSheet: View {

    @Environment(\.dismiss) private var dismiss

    @State private var startingGoal: Int
    @State private var endingGoal: Int
    @State private var reductionWeeks: Int

    let onSave: (Int, Int) -> Void

    init(
        startingGoal: Int,
        endingGoal: Int,
        reductionWeeks: Int,
        onSave: @escaping (Int, Int) -> Void
    ) {
        _startingGoal = State(initialValue: startingGoal)
        _endingGoal = State(initialValue: endingGoal)
        _reductionWeeks = State(initialValue: reductionWeeks)
        self.onSave = onSave
    }

    var body: some View {

        NavigationStack {

            VStack(spacing: 24) {
                
                Text("Edit Plan")
                    .foregroundStyle(.primaryText)
                    .font(.heading1)

                planRow(
                    title: "Starting Goal",
                    value: $startingGoal,
                    range: 1...100
                )

                planRow(
                    title: "Ending Goal",
                    value: $endingGoal,
                    range: 1...100
                )

                planRow(
                    title: "Reduction Weeks",
                    value: $reductionWeeks,
                    range: 1...50
                )

                Spacer()

                Button {

                    onSave(endingGoal, reductionWeeks)

                    dismiss()

                } label: {

                    Text("Save Changes")
                        .font(.headline)
                        .foregroundStyle(.primaryText)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.primaryAccent)
                        .clipShape(Capsule())
                }
            }
            .padding(24)
            .background(.appBackground)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func planRow(
        title: String,
        value: Binding<Int>,
        range: ClosedRange<Int>
    ) -> some View {

        VStack(alignment: .leading, spacing: 8) {

            Text(title)
                .font(.headline)
                .foregroundStyle(.primaryText)

            Stepper(
                "\(value.wrappedValue)",
                value: value,
                in: range
            )
            .foregroundStyle(.secondaryText)
        }
    }
}
