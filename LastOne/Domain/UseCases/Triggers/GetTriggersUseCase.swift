//
//  GetTriggersUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol GetTriggersUseCase {

    func execute() async throws -> [Trigger]
}

final class GetTriggersUseCaseImpl: GetTriggersUseCase {

    private let repository: TriggerRepository

    init(repository: TriggerRepository) {
        self.repository = repository
    }

    func execute() async throws -> [Trigger] {

        try await repository.getTriggers()
    }
}
