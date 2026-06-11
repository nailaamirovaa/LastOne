//
//  GetStreakUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol GetStreakUseCase {

    func execute() async throws -> Streak
}

final class GetStreakUseCaseImpl: GetStreakUseCase {

    private let repository: StreakRepository

    init(repository: StreakRepository) {
        self.repository = repository
    }

    func execute() async throws -> Streak {

        try await repository.getStreak()
    }
}
