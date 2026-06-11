//
//  GetWeeklyStatsUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol GetWeeklyStatsUseCase {
    func execute(week: String) async throws -> WeeklyStats
}

final class GetWeeklyStatsUseCaseImpl: GetWeeklyStatsUseCase {

    private let repository: StatsRepository

    init(repository: StatsRepository) {
        self.repository = repository
    }

    func execute(week: String) async throws -> WeeklyStats {
        try await repository.getWeeklyStats(week: week)
    }
}
