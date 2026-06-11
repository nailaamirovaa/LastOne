//
//  GetTodaysLogsUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol GetTodaysLogsUseCase {

    func execute() async throws -> TodayLogs
}

final class GetTodaysLogsUseCaseImpl: GetTodaysLogsUseCase {

    private let repository: LogRepository

    init(repository: LogRepository) {
        self.repository = repository
    }

    func execute() async throws -> TodayLogs {

        try await repository.getTodaysLogs()
    }
}
