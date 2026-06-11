//
//  LogCigaretteUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol LogCigaretteUseCase {

    func execute(smokedAt: String, note: String ,triggerID: String) async throws -> CigaretteLog
}

final class LogCigaretteUseCaseImpl: LogCigaretteUseCase {

    private let repository: LogRepository

    init(repository: LogRepository) {
        self.repository = repository
    }

    func execute(smokedAt: String, note: String, triggerID: String) async throws -> CigaretteLog {

        try await repository.logCigarette(
            smokedAt: smokedAt,
            note: note,
            triggerID: triggerID
        )
    }
}
