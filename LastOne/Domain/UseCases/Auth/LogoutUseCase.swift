//
//  LogoutUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol LogoutUseCase {

    func execute(request: TokenRequestDTO) async throws
}

final class LogoutUseCaseImpl: LogoutUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func execute(request: TokenRequestDTO) async throws {

        try await repository.logout(request: request)
    }
}
