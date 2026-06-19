//
//  StatsService.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//


import Foundation

public final class StatsService {
    
    private let networkManager = NetworkManager.shared
    
    // MARK: - Daily Stats
    func getDailyStats(date: String?) async throws -> DailyStatsDataDTO {
        try await networkManager.requestWrapped(
            StatsRequest.dailyStats(date: date),
            responseType:DailyStatsDataDTO.self
        )
    }
    
    // MARK: - Weekly Stats
    func getWeeklyStats(week: String?) async throws -> WeeklyStatsDataDTO {
        try await networkManager.requestWrapped(
            StatsRequest.weeklyStats(week: week),
            responseType:WeeklyStatsDataDTO.self
        )
    }
    
    // MARK: - Monthly Stats
    func getMonthlyStats(month: String?) async throws -> MonthlyStatsDataDTO {
        try await networkManager.requestWrapped(
            StatsRequest.monthlyStats(month: month),
            responseType:MonthlyStatsDataDTO.self
        )
    }
    
    // MARK: - Overview
    func getOverview() async throws -> OverviewDataDTO {
        try await networkManager.requestWrapped(
            StatsRequest.overview,
            responseType:OverviewDataDTO.self
        )
    }
    
    // MARK: - Daily Stats
    func getTriggerAnalysisStats() async throws -> TriggerAnalysisDataDTO {

        try await networkManager.requestWrapped(
            StatsRequest.triggerAnalysis,
            responseType:TriggerAnalysisDataDTO.self
        )
    }
    
    // MARK: - Export CSV
    func exportCSV() async throws -> Data {
        try await networkManager.requestData(
            StatsRequest.exportCSV
        )
    }
}
