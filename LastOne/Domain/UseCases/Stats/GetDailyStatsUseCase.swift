//
//  GetDailyStatsUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol GetDailyStatsUseCase {
    func execute(date: String) async throws -> DailyStats
}

final class GetDailyStatsUseCaseImpl: GetDailyStatsUseCase {

    private let repository: StatsRepository

    init(repository: StatsRepository) {
        self.repository = repository
    }

    func execute(date: String) async throws -> DailyStats {
        try await repository.getDailyStats(date: date)
    }
}
