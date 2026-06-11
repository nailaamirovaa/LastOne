//
//  MonthlyStatsResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Data
struct MonthlyStatsDataDTO: Decodable {
    let month: String?
    let total: Int?
    let days: [DayDTO]?
}

