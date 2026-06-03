//
//  ManualRecalculateStreakResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Response
struct ManualRecalculateStreakResponseDTO: Decodable {
    let success: Bool
    let data: ManualRecalculateStreakDataDTO
}

// MARK: - DataClass
struct ManualRecalculateStreakDataDTO: Decodable {
    let streak: Streak
    let message: String
}

// MARK: - Streak
struct Streak: Decodable {
    let currentStreak, longestStreak: Int
    let lastUpdatedDate: String
}
