//
//  SubscriptionRepositoryImpl.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


final class SubscriptionRepositoryImpl: SubscriptionRepository {

    private let service: SubscriptionService

    init(service: SubscriptionService) {
        self.service = service
    }

    // MARK: - Verify Subscription
    func verifySubscription(
        revenueCatUserId: String
    ) async throws -> Subscription {

        let dto = try await service.verifySubscription(
            request: VerifySubscriptionRequestDTO(
                revenueCatUserId: revenueCatUserId
            )
        )
        
        return dto.toEntity()
    }

    // MARK: - Get Subscription Status
    func getSubscriptionStatus() async throws -> Subscription {

        let dto = try await service.getSubscriptionStatus()

        return dto.toEntity()
    }
}
