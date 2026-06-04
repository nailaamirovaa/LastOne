//
//  WeeklyStatsResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Response
struct WeeklyStatsResponseDTO: Decodable {
    let success: Bool
    let data: WeeklyStatsDataDTO
}

// MARK: - Data
struct WeeklyStatsDataDTO: Decodable {
    let week: String
    let total: Int
    let dailyAverage: Double
    let days: [DayDTO]
}

