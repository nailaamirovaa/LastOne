//
//  LogCigaretteUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//

import Foundation


protocol LogCigaretteUseCase {

    func execute(smokedAt: Date, note: String ,triggerID: String?) async throws -> CigaretteLog
}

final class LogCigaretteUseCaseImpl: LogCigaretteUseCase {

    private let repository: LogRepository

    init(repository: LogRepository) {
        self.repository = repository
    }

    func execute(smokedAt: Date, note: String, triggerID: String?) async throws -> CigaretteLog {

        try await repository.logCigarette(
            smokedAt: smokedAt,
            note: note,
            triggerID: triggerID 
        )
    }
}
