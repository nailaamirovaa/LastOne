//
//  TriggerRepositoryImpl.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


final class TriggerRepositoryImpl: TriggerRepository {

    private let service: TriggersService

    init(service: TriggersService) {
        self.service = service
    }

    // MARK: - Get Triggers
    func getTriggers() async throws -> [Trigger] {

        let dto = try await service.listTriggers()

        guard let triggers = dto.triggers else {
            throw NetworkError.invalidResponse
        }

        return triggers.map {
            $0.toEntity()
        }
    }

    // MARK: - Create Trigger
    func createTrigger(
        name: String
    ) async throws -> Trigger {

        let dto = try await service.createCustomTrigger(request: CreateCustomTriggerRequestDTO(name: name))

        guard let trigger = dto.trigger else {
            throw NetworkError.invalidResponse
        }

        return trigger.toEntity()
    }

    // MARK: - Delete Trigger
    func deleteTrigger(id: String) async throws {

        try await service.deleteCustomTrigger(id: id)
    }
}
