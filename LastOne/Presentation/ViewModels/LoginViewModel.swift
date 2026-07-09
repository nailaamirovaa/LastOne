//
//  LoginViewModel.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//

import Foundation
import Combine

@MainActor
final class LoginViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var user: User?
    @Published var email = ""
    @Published var password = ""

    @Published var isLoading = false
    @Published var errorMessage: String?

    @Published var isLoggedIn = false

    // MARK: - Dependencies

    private let loginUseCase: LoginUseCase

    // MARK: - Init

    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }

    // MARK: - Actions

    func login() {

        guard !email.isEmpty else {
            errorMessage = "Email cannot be empty."
            return
        }

        guard !password.isEmpty else {
            errorMessage = "Password cannot be empty."
            return
        }
        
        Task {
            
            isLoading = true
            errorMessage = nil
            
            defer {
                isLoading = false
            }
            do {
                let user = try await loginUseCase.execute(
                    email: email,
                    password: password
                )
                
                self.user = user
                
                isLoggedIn = true
                
                UserDefaults().set(user.subscriptionStatus, forKey: "subscription")
                
            } catch let error as NetworkError {
                
                switch error {
                    
                case .apiError(_, let code):
                    if let authError = AuthError(rawValue: code ?? "") {
                        errorMessage = String(localized: "\(authError.localizedKey)")
                    } else {
                        errorMessage = NSLocalizedString("general_error", comment: "")
                    }
                    
                default:
                    errorMessage = error.localizedDescription
                }
                
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
