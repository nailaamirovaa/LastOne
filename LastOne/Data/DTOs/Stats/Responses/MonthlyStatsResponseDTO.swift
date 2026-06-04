//
//  MonthlyStatsResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Response
struct MonthlyStatsResponseDTO: Decodable {
    let success: Bool
    let data: MonthlyStatsDataDTO
}

// MARK: - Data
struct MonthlyStatsDataDTO: Decodable {
    let month: String
    let total: Int
    let days: [DayDTO]
}

