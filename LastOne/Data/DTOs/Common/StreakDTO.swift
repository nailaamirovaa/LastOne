//
//  StreakDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


// MARK: - Streak
struct StreakDTO: Decodable {
    let currentStreak, longestStreak: Int?
    let lastUpdatedDate: String?
}
