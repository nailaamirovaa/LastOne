//
//  SubscriptionDataDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension SubscriptionDataDTO {

    func toEntity() -> Subscription {

        Subscription(
            isPremium: isPremium,
            expiresAt: expiresAt,
            plan: nil,
            revenueCatUserID: nil
        )
    }
}
