//
//  UpdateProfileResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Response
struct UpdateProfileResponseDTO: Decodable {
    let success: Bool
    let data: UpdateProfileDataDTO
}

// MARK: - Data
struct UpdateProfileDataDTO: Decodable {
    let profile: UpdateProfileProfileDTO
}

// MARK: - Profile
struct UpdateProfileProfileDTO: Decodable {
    let dailyGoalFinal, reductionPaceWeeks: Int
    let timezone: String
}
