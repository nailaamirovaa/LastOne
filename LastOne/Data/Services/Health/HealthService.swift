//
//  HealthService.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

public final class HealthService {
    
    private let networkManager =
        NetworkManager.shared
    
    // MARK: - Health Check
    
    func revenueCatWebhook()
    async throws -> HealthCheckResponseDTO {

        try await networkManager.request(

            HealthEndpoint.healthCheck,

            responseType:
                HealthCheckResponseDTO.self
        )
    }
}
