//
//  SubscriptionRepository.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol SubscriptionRepository {

    func verifySubscription(revenueCatUserId: String) async throws -> Subscription

    func getSubscriptionStatus() async throws -> Subscription
}
