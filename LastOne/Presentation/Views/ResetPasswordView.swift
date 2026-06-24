//
//  ResetPasswordView.swift
//  LastOne
//
//  Created by Naila Amirova on 24.06.26.
//


import SwiftUI

struct ResetPasswordView: View {

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var coordinator: AppCoordinator

    @StateObject private var viewModel: ResetPasswordViewModel

    @State private var showPassword = false
    @State private var showConfirmPassword = false

    init(
        token: String,
        resetPasswordUseCase: ResetPasswordUseCase
    ) {
        _viewModel = StateObject(
            wrappedValue: ResetPasswordViewModel(
                token: token,
                resetPasswordUseCase: resetPasswordUseCase
            )
        )
    }

    var body: some View {

        ZStack {

            Color.surface
                .ignoresSafeArea()

            ScrollView {

                VStack(alignment: .leading, spacing: 0) {

                    Text("Create new password")
                        .font(.heading2)
                        .foregroundStyle(.primaryText)
                        .padding(.bottom, AppSpacing.xs)

                    Text("Choose a new password for your account.")
                        .font(.subhead)
                        .foregroundStyle(.secondaryText)
                        .padding(.bottom, AppSpacing.xl)

                    AuthFieldLabel("NEW PASSWORD")

                    HStack {

                        Group {
                            if showPassword {
                                TextField( "••••••••",text: $viewModel.password)
                                    .tint(.tertiaryText)
                                    .foregroundStyle(.primaryText)
                            } else {
                                SecureField("••••••••",text: $viewModel.password)
                                    .tint(.tertiaryText)
                                    .foregroundStyle(.primaryText)
                            }
                        }

                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(
                                systemName: showPassword
                                ? "eye.slash"
                                : "eye"
                            )
                            .foregroundStyle(.tertiaryText)
                        }
                    }
                    .authInputStyle()
                    .padding(.bottom, AppSpacing.md)

                    AuthFieldLabel("CONFIRM PASSWORD")

                    HStack {

                        Group {
                            if showConfirmPassword {
                                TextField("••••••••",text: $viewModel.confirmPassword)
                                    .tint(.tertiaryText)
                                    .foregroundStyle(.primaryText)
                            } else {
                                SecureField("••••••••",text: $viewModel.confirmPassword)
                                    .tint(.tertiaryText)
                                    .foregroundStyle(.primaryText)
                            }
                        }

                        Button {
                            showConfirmPassword.toggle()
                        } label: {
                            Image(
                                systemName: showConfirmPassword
                                ? "eye.slash"
                                : "eye"
                            )
                            .foregroundStyle(.tertiaryText)
                        }
                    }
                    .authInputStyle()
                    .padding(.bottom, AppSpacing.xl)

                    Button {

                        viewModel.resetPassword()
                        coordinator.route = .login

                    } label: {

                        if viewModel.isLoading {

                            ProgressView()
                                .frame(maxWidth: .infinity)

                        } else {

                            Text("Update Password")
                                .font(.headline)
                                .foregroundStyle(.surface)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.vertical, AppSpacing.md)
                    .background(Color.primaryAccent)
                    .cornerRadius(AppRadius.pill)

                    Spacer()
                }
                .padding(.horizontal, AppSpacing.lg)
                .padding(.top, AppSpacing.xxl)
                .padding(.bottom, AppSpacing.xxl)
            }
        }
        .onChange(of: viewModel.didResetPassword) { _, success in
            if success {
                coordinator.route = .login
            }
        }
        .alert(
            "Success",
            isPresented: $viewModel.didResetPassword
        ) {

            Button("OK") {
                dismiss()
            }

        } message: {

            Text("Your password has been updated.")
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
}
