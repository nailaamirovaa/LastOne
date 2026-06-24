//
//  ForgotPasswordUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 23.06.26.
//


protocol ForgotPasswordUseCase {
    func execute(email: String) async throws
}

final class ForgotPasswordUseCaseImpl:
ForgotPasswordUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func execute(email: String) async throws {

        try await repository.forgotPassword(email: email)
    }
}
