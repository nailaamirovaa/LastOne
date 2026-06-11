//
//  GetProfileDataDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension GetProfileDataDTO {

    func toEntity() -> UserProfile {

        UserProfile(
            user: user?.toEntity() ?? .init(id: "", email: "", isOnboardingComplete: false, subscriptionStatus: ""),
            profile: profile?.toEntity() ?? .init(dailyGoalStart: 0, dailyGoalCurrent: 0, dailyGoalFinal: 0, reductionPaceWeeks: 0, timezone: "")
        )
    }
}
