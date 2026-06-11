//
//  GetProfileUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol GetProfileUseCase {

    func execute() async throws -> UserProfile
}

final class GetProfileUseCaseImpl: GetProfileUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute() async throws -> UserProfile {

        try await repository.getProfile()
    }
}
