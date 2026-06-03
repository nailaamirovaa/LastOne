//
//  SetupProfileResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - SetupProfileResponseDTO
struct SetupProfileResponseDTO: Decodable {
    let success: Bool
    let data: SetupProfileDataDTO
}

// MARK: - Data
struct SetupProfileDataDTO: Decodable {
    let profile: SetupProfileProfileDTO
}

// MARK: - Profile
struct SetupProfileProfileDTO: Decodable {
    let id, userID: String
    let dailyGoalStart, dailyGoalCurrent, dailyGoalFinal, reductionPaceWeeks: Int
    let timezone, onboardingDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case dailyGoalStart, dailyGoalCurrent, dailyGoalFinal, reductionPaceWeeks, timezone, onboardingDate
    }
}
