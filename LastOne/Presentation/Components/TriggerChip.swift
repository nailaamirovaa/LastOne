


import SwiftUI

struct TriggerChip: View {

    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            Text(title)
                .font(.bodyText)
                .foregroundStyle(
                    isSelected
                    ? .black
                    : .secondaryText
                )
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(
                    isSelected
                    ? Color.primaryAccent
                    : Color.secondarySurface
                )
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}
