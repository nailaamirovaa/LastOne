//
//  TriggersService.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

public final class TriggersService {
    
    private let networkManager =
        NetworkManager.shared
    
    // MARK: - List Triggers
    
    func listTriggers()
    async throws -> ListTriggersResponseDTO {

        try await networkManager.request(

            TriggersEndpoint.listTriggers,

            responseType:
                ListTriggersResponseDTO.self
        )
    }
    
    // MARK: - Create Custom Trigger
    
    func createCustomTrigger(
        request: CreateCustomTriggerRequestDTO
    )async throws -> CreateCustomTriggerResponseDTO {

        try await networkManager.request(

            TriggersEndpoint.createCustomTrigger(request),

            responseType:
                CreateCustomTriggerResponseDTO.self
        )
    }
    
    // MARK: - Delete Custom Trigger
    
    func deleteCustomTrigger(
        id: String
    )async throws -> DeleteCustomTriggerResponseDTO {

        try await networkManager.request(

            TriggersEndpoint.deleteCustomTrigger(id: id),

            responseType:
                DeleteCustomTriggerResponseDTO.self
        )
    }
}
