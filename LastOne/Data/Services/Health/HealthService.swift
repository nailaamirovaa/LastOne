//
//  HealthService.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

public final class HealthService {
    
    private let networkManager = NetworkManager.shared
    
    // MARK: - Health Check
    func revenueCatWebhook() async throws -> HealthCheckDataDTO {

        try await networkManager.requestWrapped(
            HealthRequest.healthCheck,
            responseType: HealthCheckDataDTO.self
        )
    }
}
