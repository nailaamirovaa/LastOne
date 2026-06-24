import SwiftUI

// MARK: - Input field modifier
struct AuthInputModifier: ViewModifier {
    var hasError: Bool = false

    func body(content: Content) -> some View {
        content
            .font(.bodyText)
            .padding(.horizontal, AppSpacing.md)
            .padding(.vertical, 13)
            .background(Color.secondarySurface)
            .overlay(
                RoundedRectangle(cornerRadius: AppRadius.sm)
                    .stroke(
                        hasError ? Color.error : Color.hairline,
                        lineWidth: 1
                    )
            )
            .cornerRadius(AppRadius.sm)
    }
}

extension View {
    func authInputStyle(hasError: Bool = false) -> some View {
        modifier(AuthInputModifier(hasError: hasError))
    }
}

// MARK: - Field label
struct AuthFieldLabel: View {
    let text: LocalizedStringKey
    init(_ text: String) { self.text = LocalizedStringKey(text) }

    var body: some View {
        Text(text)
            .font(.label)
            .foregroundColor(.secondaryText)
            .kerning(1.2)
            .padding(.bottom, AppSpacing.xs)
    }
}

// MARK: - Inline error text
struct AuthErrorText: View {
    let text: String
    init(_ text: String) { self.text = text }

    var body: some View {
        Text(text)
            .font(.caption)
            .foregroundColor(.error)
    }
}
