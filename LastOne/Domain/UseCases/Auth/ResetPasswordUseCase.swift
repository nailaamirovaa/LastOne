//
//  ResetPasswordUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 24.06.26.
//


protocol ResetPasswordUseCase {
    func execute(token: String,password: String) async throws
}

final class ResetPasswordUseCaseImpl:ResetPasswordUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func execute(token: String, password: String) async throws {
        try await repository.resetPassword(token: token,password: password)
    }
}
