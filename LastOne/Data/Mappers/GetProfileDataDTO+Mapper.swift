//
//  GetProfileDataDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension GetProfileDataDTO {

    func toEntity() -> UserProfile {

        UserProfile(
            id: id,
            email: email,
            subscriptionStatus: subscriptionStatus,
            isOnboardingComplete: isOnboardingComplete,
            profile: profile.toEntity()
        )
    }
}
