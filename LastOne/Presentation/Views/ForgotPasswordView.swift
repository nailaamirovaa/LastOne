//
//  ForgotPasswordView.swift
//  LastOne
//
//  Created by Naila Amirova on 23.06.26.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: ForgotPasswordViewModel
    @EnvironmentObject private var coordinator: AppCoordinator
    
    init(forgotPasswordUseCase: ForgotPasswordUseCase) {
        _viewModel = StateObject( wrappedValue: ForgotPasswordViewModel(
                forgotPasswordUseCase: forgotPasswordUseCase
            )
        )
    }

    var body: some View {

        ZStack {
            Color.surface.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 24) {
                
                Button {
                    dismiss()
                    coordinator.route = .login
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .font(.subhead)
                    .foregroundStyle(.primaryAccent)
                }
                .padding(.bottom, AppSpacing.xl)

                Text("Reset Password")
                    .tint(.tertiaryText)
                    .font(.heading2)
                    .foregroundStyle(.primaryText)

                Text("Enter your email and we'll send you a password reset link.")
                    .tint(.tertiaryText)
                    .font(.subhead)
                    .foregroundStyle(.secondaryText)
                
                VStack(alignment: .leading, spacing: 8){
                    
                    AuthFieldLabel("email")
                    
                    TextField( "you@example․com",text: $viewModel.email)
                        .foregroundStyle(.primaryText)
                        .tint(.tertiaryText)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .authInputStyle()
                }
                
                Button {
                    viewModel.sendResetEmail()
                    print(viewModel.errorMessage ?? "nil")
                } label: {

                    if viewModel.isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    } else {
                        Text("Send Reset Link")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.vertical, 14)
                .foregroundStyle(.surface)
                .background(Color.primaryAccent)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: AppRadius.pill
                    )
                )
                .disabled(viewModel.isLoading)

                Spacer()
            }
            .padding(.horizontal, AppSpacing.lg)
            .padding(.top, AppSpacing.xxl)
        }
        .alert(
            "Email Sent",
            isPresented: $viewModel.emailSent
        ) {
            Button("OK") {
                coordinator.route = .login
            }
        } message: {
            Text(
                "If an account exists with this email, a reset link has been sent."
            )
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
            Text(viewModel.localizedErrorMessage)

        }
    }
}
