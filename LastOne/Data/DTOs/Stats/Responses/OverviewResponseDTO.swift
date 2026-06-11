//
//  OverviewResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

// MARK: - Data
struct OverviewDataDTO: Decodable  {
    let totalCigarettesSmoked, daysActive, averagePerDay, reductionPercent: Int?
    let currentStreak, longestStreak, dailyGoalStart, dailyGoalCurrent: Int?
    let dailyGoalFinal: Int?
}
