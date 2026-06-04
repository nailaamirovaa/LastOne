//
//  SubscriptionService.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

public final class SubscriptionService {
    
    private let networkManager =
        NetworkManager.shared
    
    // MARK: - Subscription Status
    
    func getSubscriptionStatus()
    async throws -> SubscriptionStatusResponseDTO {

        try await networkManager.request(

            SubscriptionEndpoint.subscriptionStatus,

            responseType:
                SubscriptionStatusResponseDTO.self
        )
    }
    
    // MARK: - Verify Subscription
    
    func verifySubscription(
        request: VerifySubscriptionRequestDTO
    )async throws -> VerifySubscriptionResponseDTO {

        try await networkManager.request(

            SubscriptionEndpoint.verifySubscription(request),

            responseType:
                VerifySubscriptionResponseDTO.self
        )
    }
}
