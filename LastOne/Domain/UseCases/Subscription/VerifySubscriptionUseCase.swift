//
//  VerifySubscriptionUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol VerifySubscriptionUseCase {

    func execute(revenueCatUserId: String) async throws -> Subscription
}

final class VerifySubscriptionUseCaseImpl: VerifySubscriptionUseCase {

    private let repository: SubscriptionRepository

    init(repository: SubscriptionRepository) {
        self.repository = repository
    }

    func execute(revenueCatUserId: String) async throws -> Subscription {

        try await repository.verifySubscription(revenueCatUserId: revenueCatUserId)
    }
}
