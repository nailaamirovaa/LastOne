//
//  UpdateProfileUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol UpdateProfileUseCase {

    func execute(dailyGoalFinal: Int, reductionPaceWeeks: Int, timezone: String) async throws -> Profile
}

final class UpdateProfileUseCaseImpl: UpdateProfileUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute(dailyGoalFinal: Int, reductionPaceWeeks: Int, timezone: String) async throws -> Profile {

        try await repository.updateProfile(
            dailyGoalFinal: dailyGoalFinal,
            reductionPaceWeeks: reductionPaceWeeks,
            timezone: timezone
        )
    }
}
