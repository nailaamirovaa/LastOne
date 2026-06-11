//
//  SubscriptionService.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

public final class SubscriptionService {
    
    private let networkManager = NetworkManager.shared
    
    // MARK: - Subscription Status
    func getSubscriptionStatus() async throws -> SubscriptionStatusDataDTO {

        try await networkManager.requestWrapped(
            SubscriptionRequest.subscriptionStatus,
            responseType: SubscriptionStatusDataDTO.self
        )
    }
    
    // MARK: - Verify Subscription
    func verifySubscription(request: VerifySubscriptionRequestDTO) async throws -> SubscriptionDataDTO {
        try await networkManager.requestWrapped(
            SubscriptionRequest.verifySubscription(request),
            responseType: SubscriptionDataDTO.self
        )
    }
}
