




import SwiftUI

struct RegisterView: View {
   
    @EnvironmentObject private var coordinator: AppCoordinator
    @StateObject private var viewModel: RegisterViewModel

    @State private var confirmPassword = ""
    @State private var agreed = false
    @State private var showPassword = false
    @State private var errors: [String: String] = [:]
    
    init(registerUseCase: RegisterUseCase) {

        _viewModel = StateObject(wrappedValue: RegisterViewModel(registerUseCase: registerUseCase))
    }

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
                    Text("Let's get started.")
                        .font(.heading2)
                        .foregroundColor(.primaryText)
                        .padding(.bottom, AppSpacing.xs)

                    Text("Create an account to begin your journey.")
                        .font(.subhead)
                        .foregroundColor(.secondaryText)
                        .padding(.bottom, AppSpacing.xl)

                    // Email
                    AuthFieldLabel("EMAIL")
                    TextField("you@example.com", text: $viewModel.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .authInputStyle(hasError: errors["email"] != nil)
                        .padding(.bottom, errors["email"] != nil ? AppSpacing.xs : AppSpacing.md)
                    if let emailErr = errors["email"] {
                        AuthErrorText(emailErr).padding(.bottom, AppSpacing.sm)
                    }

                    // Password
                    AuthFieldLabel("PASSWORD")
                    HStack {
                        Group {
                            if showPassword {
                                TextField("At least 8 characters", text: $viewModel.password)
                            } else {
                                SecureField("At least 8 characters", text: $viewModel.password)
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
                    .authInputStyle(hasError: errors["password"] != nil)
                    .padding(.bottom, errors["password"] != nil ? AppSpacing.xs : AppSpacing.md)
                    if let passErr = errors["password"] {
                        AuthErrorText(passErr).padding(.bottom, AppSpacing.sm)
                    }

                    // Confirm password
                    AuthFieldLabel("CONFIRM PASSWORD")
                    SecureField("Re-enter your password", text: $confirmPassword)
                        .autocapitalization(.none)
                        .authInputStyle(hasError: errors["confirm"] != nil)
                        .padding(.bottom, errors["confirm"] != nil ? AppSpacing.xs : AppSpacing.md)
                    if let confirmErr = errors["confirm"] {
                        AuthErrorText(confirmErr).padding(.bottom, AppSpacing.sm)
                    }
                    
                    // Terms checkbox
                    HStack(alignment: .top, spacing: AppSpacing.sm) {
                        Button(action: { agreed.toggle() }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(agreed ? Color.primaryAccent : Color.hairline, lineWidth: 1)
                                    .frame(width: 18, height: 18)
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(agreed ? Color.primaryAccent.opacity(0.12) : Color.secondarySurface)
                                    )
                                if agreed {
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 10, weight: .bold))
                                        .foregroundColor(.primaryAccent)
                                }
                            }
                        }
                        .padding(.top, 2)
                        
                        HStack(alignment: .top, spacing: 0) {
                            
                            Text("I agree to the ")
                                .foregroundStyle(.secondaryText)

                            Text("Terms of Service")
                                .foregroundStyle(.primaryAccent)

                            Text(" and ")
                                .foregroundStyle(.secondaryText)

                            Text("Privacy Policy")
                                .foregroundStyle(.primaryAccent)

                            Text(".")
                                .foregroundStyle(.secondaryText)
                        }
                        .font(.callout)
                    }
                    .padding(.bottom, errors["terms"] != nil ? AppSpacing.xs : 0)
                    if let termsErr = errors["terms"] {
                        AuthErrorText(termsErr).padding(.bottom, AppSpacing.sm)
                    }

                    // Create account button
                    Button(action: handleRegister) {
                        Text("Create account")
                            .font(.headline)
                            .foregroundColor(.surface)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, AppSpacing.md)
                            .background(Color.primaryAccent)
                            .cornerRadius(AppRadius.pill)
                    }
                    .padding(.top, AppSpacing.lg)
                    .padding(.bottom, AppSpacing.xl)

                    // Switch to login
                    HStack(spacing: 4) {
                        Spacer()
                        Text("Already have an account?")
                            .font(.subhead)
                            .foregroundColor(.tertiaryText)
                        Button("Sign in") {
                            coordinator.route = .login
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
            .alert(
                "Error",
                isPresented: Binding(
                    get: {
                        viewModel.errorMessage != nil
                    },
                    set: { _ in
                        viewModel.errorMessage = nil
                    }
                )
            ) {
                
                Button("OK") { }
                
            } message: {
                
                Text(viewModel.errorMessage ?? "")
            }
        }
        .preferredColorScheme(.dark)
    }

    private func handleRegister() {
        var newErrors: [String: String] = [:]
        
        if !viewModel.email.contains("@"){
            newErrors["email"] = "Enter a valid email."
        }
        if viewModel.password.count < 8{
            newErrors["password"] = "At least 8 characters."
        }
        if viewModel.password != confirmPassword{
            newErrors["confirm"]  = "Passwords don't match."
        }
        if !agreed{
            newErrors["terms"] = "You must agree to continue."
        }
        errors = newErrors
        guard errors.isEmpty else { return }
        
        viewModel.register()
        coordinator.route = .login
    }
}

