//
//  GetProfileResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

// MARK: - GetProfileResponseDTO
struct GetProfileResponseDTO: Decodable {
    let success: Bool
    let data: GetProfileDataDTO
}

// MARK: - Data
struct GetProfileDataDTO: Decodable {
    let id, email, subscriptionStatus: String
    let isOnboardingComplete: Bool
    let profile: GetProfileProfileDTO
}

// MARK: - Profile
struct GetProfileProfileDTO: Decodable {
    let dailyGoalStart, dailyGoalCurrent, dailyGoalFinal, reductionPaceWeeks: Int
    let timezone: String
}
