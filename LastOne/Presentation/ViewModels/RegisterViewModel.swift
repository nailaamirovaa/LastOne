//
//  RegisterViewModel.swift
//  LastOne
//
//  Created by Naila Amirova on 12.06.26.
//

import Foundation
import Combine

@MainActor
final class RegisterViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    @Published var user: User?
    @Published var email = ""
    @Published var password = ""

    @Published var isLoading = false
    @Published var errorMessage: String?

    @Published var isRegistered = false
    
    // MARK: - Dependencies

    private let registerUseCase: RegisterUseCase

    // MARK: - Init

    init(registerUseCase: RegisterUseCase) {
        self.registerUseCase = registerUseCase
    }

    // MARK: - Actions

    func register() {

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
                let user = try await registerUseCase.execute(
                    email: email,
                    password: password
                )

                self.user = user

                isRegistered = true
                
                UserDefaults.standard.set(Date(), forKey: "joinDate")
                
                UserDefaults().set(user.subscriptionStatus, forKey: "subscription")

            } catch let error as NetworkError {

                switch error {

                case .apiError(_, let code):

                    switch code {

                    case "EMAIL_EXISTS":
                        errorMessage = "This email is already registered."

                    default:
                        errorMessage = error.localizedDescription
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
