//
//  ProfileDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


// MARK: - Profile
struct ProfileDTO: Decodable {
    let id, email, userId, subscriptionStatus: String?
    let isOnboardingComplete: Bool?
    let dailyGoalStart, dailyGoalCurrent, dailyGoalFinal, reductionPaceWeeks: Int?
    let timezone: String?
}
