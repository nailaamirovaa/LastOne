//
//  LogRepository.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol LogRepository {

    func logCigarette(smokedAt: String, note: String, triggerID: String) async throws -> CigaretteLog

    func getTodaysLogs() async throws -> TodayLogs

    func getWeekLogs() async throws -> WeekLogs

    func deleteLog(id: String) async throws
}
