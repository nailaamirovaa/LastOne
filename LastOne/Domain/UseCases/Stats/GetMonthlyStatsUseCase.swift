//
//  GetMonthlyStatsUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//



protocol GetMonthlyStatsUseCase {
    func execute(month: String) async throws -> MonthlyStats
}

final class GetMonthlyStatsUseCaseImpl: GetMonthlyStatsUseCase {

    private let repository: StatsRepository

    init(repository: StatsRepository) {
        self.repository = repository
    }

    func execute(month: String) async throws -> MonthlyStats {
        try await repository.getMonthlyStats(month: month)
    }
}
