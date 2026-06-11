import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @Binding var isShowingRegister: Bool

    var body: some View {
        ZStack {
            Color.surface.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 0) {

                    // Logo
                    HStack(spacing: AppSpacing.sm) {
                        ZStack {
                            Circle()
                                .fill(Color.primaryAccent)
                                .frame(width: 32, height: 32)
                            Text("🔥").font(.system(size: 16))
                        }
                        Text("LASTONE")
                            .font(.label)
                            .foregroundColor(.primaryAccent)
                            .kerning(2)
                    }
                    .padding(.bottom, AppSpacing.xxl)

                    // Heading
                    Text("Welcome back.")
                        .font(.heading2)
                        .foregroundColor(.primaryText)
                        .padding(.bottom, AppSpacing.xs)

                    Text("Sign in to continue your progress.")
                        .font(.subhead)
                        .foregroundColor(.secondaryText)
                        .padding(.bottom, AppSpacing.xl)

                    // Email
                    AuthFieldLabel("EMAIL")
                    TextField("you@example.com", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .authInputStyle()
                        .padding(.bottom, AppSpacing.md)

                    // Password
                    AuthFieldLabel("PASSWORD")
                    HStack {
                        Group {
                            if showPassword {
                                TextField("••••••••", text: $password)
                            } else {
                                SecureField("••••••••", text: $password)
                            }
                        }
                        .autocapitalization(.none)
                        .disableAutocorrection(true)

                        Button(action: { showPassword.toggle() }) {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.tertiaryText)
                                .font(.system(size: 16))
                        }
                    }
                    .authInputStyle()
                    .padding(.bottom, AppSpacing.sm)

                    // Forgot password
                    HStack {
                        Spacer()
                        Button("Forgot password?") {}
                            .font(.footnote)
                            .foregroundColor(.primaryAccent)
                    }
                    .padding(.bottom, AppSpacing.xl)

                    // Sign in button
                    Button(action: handleSignIn) {
                        Text("Sign in")
                            .font(.headline)
                            .foregroundColor(.surface)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, AppSpacing.md)
                            .background(Color.primaryAccent)
                            .cornerRadius(AppRadius.pill)
                    }
                    .padding(.bottom, AppSpacing.xl)

                    // Switch to register
                    HStack(spacing: 4) {
                        Spacer()
                        Text("Don't have an account?")
                            .font(.subhead)
                            .foregroundColor(.tertiaryText)
                        Button("Sign up") {
                            isShowingRegister = true
                        }
                        .font(.subhead)
                        .foregroundColor(.primaryAccent)
                        Spacer()
                    }
                }
                .padding(.horizontal, AppSpacing.lg)
                .padding(.top, AppSpacing.xxl)
                .padding(.bottom, AppSpacing.xxl)
            }
        }
        .preferredColorScheme(.dark)
    }

    private func handleSignIn() {
        // TODO: connect your auth logic here
        print("Sign in: \(email)")
    }
}

