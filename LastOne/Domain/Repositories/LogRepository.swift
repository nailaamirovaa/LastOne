//
//  LogRepository.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//

import Foundation


protocol LogRepository {

    func logCigarette(smokedAt: Date, note: String, triggerID: String?) async throws -> CigaretteLog

    func getTodaysLogs() async throws -> TodayLogs

    func getWeekLogs() async throws -> WeekLogs

    func deleteLog(id: String) async throws
}
