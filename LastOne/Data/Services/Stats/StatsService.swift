//
//  StatsService.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//


import Foundation

public final class StatsService {
    
    private let networkManager =
        NetworkManager.shared
    
    // MARK: - Daily Stats
    
    func getDailyStats(
        date: String?
    ) async throws -> DailyStatsResponseDTO {

        try await networkManager.request(

            StatsEndpoint.dailyStats(
                date: date
            ),

            responseType:
                DailyStatsResponseDTO.self
        )
    }
    
    // MARK: - Weekly Stats
    
    func getWeeklyStats(
        week: String?
    ) async throws -> WeeklyStatsResponseDTO {

        try await networkManager.request(

            StatsEndpoint.weeklyStats(
                week: week),

            responseType:
                WeeklyStatsResponseDTO.self
        )
    }
    
    // MARK: - Monthly Stats
    
    func getMonthlyStats(
        month: String?
    ) async throws -> MonthlyStatsResponseDTO {

        try await networkManager.request(

            StatsEndpoint.montlhyStats(
                month: month
            ),

            responseType:
                MonthlyStatsResponseDTO.self
        )
    }
    
    // MARK: - Overview
    
    func getOverview()
    async throws -> OverviewResponseDTO {

        try await networkManager.request(

            StatsEndpoint.overview,

            responseType:
                OverviewResponseDTO.self
        )
    }
    
    // MARK: - Daily Stats
    
    func gettriggerAnalysisStats()
    async throws -> TriggerAnalysisResponseDTO {

        try await networkManager.request(

            StatsEndpoint.triggerAnalysis,

            responseType:
                TriggerAnalysisResponseDTO.self
        )
    }
    
    // MARK: - Export CSV
    
    func exportCSV() async throws -> Data {

        try await networkManager.requestData(
            StatsEndpoint.exportCSV
        )
    }
}
