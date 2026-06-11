//
//  RecalculateStreakUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol RecalculateStreakUseCase {

    func execute() async throws -> Streak
}

final class RecalculateStreakUseCaseImpl: RecalculateStreakUseCase {

    private let repository: StreakRepository

    init(repository: StreakRepository) {
        self.repository = repository
    }

    func execute() async throws -> Streak {

        try await repository.recalculateStreak()
    }
}
