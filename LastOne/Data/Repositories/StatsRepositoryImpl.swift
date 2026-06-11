//
//  StatsRepositoryImpl.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//

import Foundation


final class StatsRepositoryImpl: StatsRepository {

    private let service: StatsService

    init(service: StatsService) {
        self.service = service
    }

    // MARK: - Daily Stats
    func getDailyStats(date: String) async throws -> DailyStats {

        let dto = try await service.getDailyStats(date: date)

        return dto.toEntity()
    }

    // MARK: - Weekly Stats
    func getWeeklyStats(week: String) async throws -> WeeklyStats {

        let dto = try await service.getWeeklyStats(week: week)

        return dto.toEntity()
    }

    // MARK: - Monthly Stats
    func getMonthlyStats(month: String) async throws -> MonthlyStats {

        let dto = try await service.getMonthlyStats(month: month)

        return dto.toEntity()
    }

    // MARK: - Overview Stats
    func getOverview() async throws -> OverviewStats {

        let dto = try await service.getOverview()

        return dto.toEntity()
    }

    // MARK: - Trigger Analysis Stats
    func getTriggerAnalysis() async throws -> TriggerAnalysis {

        let dto = try await service.getTriggerAnalysisStats()

        return dto.toEntity()
    }

    // MARK: - Export CSV
    func exportCSV() async throws -> Data {

        try await service.exportCSV()
    }
}
