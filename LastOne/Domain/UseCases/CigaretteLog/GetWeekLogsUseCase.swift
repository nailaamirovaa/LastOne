//
//  GetWeekLogsUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol GetWeekLogsUseCase {

    func execute() async throws -> WeekLogs
}

final class GetWeekLogsUseCaseImpl: GetWeekLogsUseCase {

    private let repository: LogRepository

    init(repository: LogRepository) {
        self.repository = repository
    }

    func execute() async throws -> WeekLogs {

        try await repository.getWeekLogs()
    }
}
