//
//  TriggersService.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

public final class TriggersService {
    
    private let networkManager = NetworkManager.shared
    
    // MARK: - List Triggers
    func listTriggers() async throws -> ListTriggersDataDTO {
        try await networkManager.requestWrapped(
            TriggersRequest.listTriggers,
            responseType: ListTriggersDataDTO.self
        )
    }
    
    // MARK: - Create Custom Trigger
    func createCustomTrigger(request: CreateCustomTriggerRequestDTO) async throws -> CreateCustomTriggerDataDTO {
        try await networkManager.requestWrapped(
            TriggersRequest.createCustomTrigger(request),
            responseType: CreateCustomTriggerDataDTO.self
        )
    }
    
    // MARK: - Delete Custom Trigger
    func deleteCustomTrigger(id: String) async throws -> DeleteCustomTriggerDataDTO {
        try await networkManager.requestWrapped(
            TriggersRequest.deleteCustomTrigger(id: id),
            responseType: DeleteCustomTriggerDataDTO.self
        )
    }
}
