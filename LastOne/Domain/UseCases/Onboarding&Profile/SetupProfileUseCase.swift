//
//  SetupProfileUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol SetupProfileUseCase {

    func execute(dailyGoalStart: Int, dailyGoalFinal: Int, reductionPaceWeeks: Int, timezone: String) async throws -> Profile
}

final class SetupProfileUseCaseImpl: SetupProfileUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute(dailyGoalStart: Int, dailyGoalFinal: Int, reductionPaceWeeks: Int, timezone: String) async throws -> Profile {

        try await repository.setupProfile(
            dailyGoalStart: dailyGoalStart,
            dailyGoalFinal: dailyGoalFinal,
            reductionPaceWeeks: reductionPaceWeeks,
            timezone: timezone
        )
    }
}
