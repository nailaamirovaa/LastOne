//
//  RegisterUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol RegisterUseCase {
    func execute(email: String, password: String) async throws -> RegisterResponse
}

final class RegisterUseCaseImpl: RegisterUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func execute(email: String, password: String) async throws -> RegisterResponse {
        try await repository.register(
            email: email,
            password: password
        )
    }
}
