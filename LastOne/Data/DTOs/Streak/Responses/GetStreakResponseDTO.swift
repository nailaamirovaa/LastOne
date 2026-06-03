//
//  GetStreakResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Response
struct GetStreakResponseDTO: Decodable {
    let success: Bool
    let data: GetStreakDataDTO
}

// MARK: - Data
struct GetStreakDataDTO: Decodable {
    let currentStreak, longestStreak: Int
    let lastUpdatedDate: String
}
