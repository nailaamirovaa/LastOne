//
//  DailyStatsResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation



// MARK: - Data
struct DailyStatsDataDTO: Decodable {
    let date: String?
    let count, dailyGoal: Int?
    let logs: [LogDTO]?
}
