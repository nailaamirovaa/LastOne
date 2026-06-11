//
//  StatsRepository.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//

import Foundation

protocol StatsRepository {

    func getDailyStats(date: String) async throws -> DailyStats

    func getWeeklyStats(week: String) async throws -> WeeklyStats

    func getMonthlyStats(month: String) async throws -> MonthlyStats

    func getOverview() async throws -> OverviewStats

    func getTriggerAnalysis() async throws -> TriggerAnalysis

    func exportCSV() async throws -> Data
}
