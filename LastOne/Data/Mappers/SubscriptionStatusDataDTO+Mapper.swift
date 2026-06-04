//
//  SubscriptionStatusDataDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension SubscriptionStatusDataDTO {

    func toEntity() -> Subscription {

        Subscription(
            isPremium: plan != "FREE",
            expiresAt: expiresAt,
            plan: plan,
            revenueCatUserID: revenueCatUserID
        )
    }
}
