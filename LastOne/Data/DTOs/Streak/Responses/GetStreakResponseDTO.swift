//
//  GetStreakResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Data
struct GetStreakDataDTO: Decodable {
    let currentStreak, longestStreak: Int?
    let lastUpdatedDate: String?
}
