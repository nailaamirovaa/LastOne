//
//  LoginUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol LoginUseCase {

    func execute(email: String, password: String ) async throws -> User
}

final class LoginUseCaseImpl: LoginUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func execute(email: String,password: String) async throws -> User {

        try await repository.login(email: email,password: password)
    }
}
