//
//  ForgotPasswordViewModel.swift
//  LastOne
//
//  Created by Naila Amirova on 23.06.26.
//

import Foundation
import Combine

import Foundation

@MainActor
final class ForgotPasswordViewModel: ObservableObject {

    // MARK: - Published

    @Published var email = ""

    @Published var isLoading = false
    @Published var errorMessage: String?
    
    var localizedErrorMessage: String {

        switch errorMessage {
            
        case "Please enter your email":
                return String(localized: "email_required")

        case "Invalid credentials":
            return String(localized: "invalid_credentials")

        case "Email already in use":
            return String(localized: "email_exists")

        case "Invalid token":
            return String(localized: "invalid_token")

        case "Token expired":
            return String(localized: "token_expired")

        default:
            return String(localized: "unknown_error")
        }
    }

    @Published var emailSent = false

    // MARK: - Dependencies

    private let forgotPasswordUseCase: ForgotPasswordUseCase

    // MARK: - Init

    init(
        forgotPasswordUseCase: ForgotPasswordUseCase
    ) {
        self.forgotPasswordUseCase = forgotPasswordUseCase
    }

    // MARK: - Actions

    func sendResetEmail() {

        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please enter your email"
            return
        }

        Task {
            
            isLoading = true
            errorMessage = nil
            
            defer {
                isLoading = false
            }
            
            do {
                
                try await forgotPasswordUseCase.execute(
                    email: email
                )
                
                emailSent = true
                
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}

