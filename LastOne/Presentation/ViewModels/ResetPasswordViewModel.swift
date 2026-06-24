//
//  ResetPasswordViewModel.swift
//  LastOne
//
//  Created by Naila Amirova on 24.06.26.
//

import Foundation
import Combine

@MainActor
final class ResetPasswordViewModel: ObservableObject {

    @Published var password = ""
    @Published var confirmPassword = ""

    @Published var isLoading = false
    @Published var errorMessage: String?

    @Published var didResetPassword = false

    let token: String

    private let resetPasswordUseCase: ResetPasswordUseCase

    init(
        token: String,
        resetPasswordUseCase: ResetPasswordUseCase
    ) {
        self.token = token
        self.resetPasswordUseCase = resetPasswordUseCase
    }

    func resetPassword() {
        
        guard !password.isEmpty else {
            errorMessage = "Password is required"
            return
        }

        guard password.count >= 8 else {
            errorMessage = "Password must be at least 8 characters"
            return
        }

        guard password == confirmPassword else {
            errorMessage = "Passwords do not match"
            return
        }

        guard password == confirmPassword else {
            errorMessage = "Passwords do not match"
            return
        }

        Task {

            isLoading = true
            errorMessage = nil

            defer {
                isLoading = false
            }

            do {

                try await resetPasswordUseCase.execute(
                    token: token,
                    password: password
                )

                didResetPassword = true

            } catch {

                errorMessage = error.localizedDescription
            }
        }
    }
}
