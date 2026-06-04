//
//  WebhooksService.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

public final class WebhooksService {
    
    private let networkManager =
        NetworkManager.shared
    
    // MARK: - RevenueCat Webhook
    
    func revenueCatWebhook(
        request: RevenueCatWebhookRequestDTO
    )async throws -> RevenueCatWebhookResponseDTO {

        try await networkManager.request(

            WebhooksEndpoint.revenueCatWebhook(request),

            responseType:
                RevenueCatWebhookResponseDTO.self
        )
    }
}
