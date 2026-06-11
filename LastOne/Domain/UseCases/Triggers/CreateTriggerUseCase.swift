//
//  CreateTriggerUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol CreateTriggerUseCase {

    func execute(name: String) async throws -> Trigger
}

final class CreateTriggerUseCaseImpl: CreateTriggerUseCase {

    private let repository: TriggerRepository

    init(repository: TriggerRepository) {
        self.repository = repository
    }

    func execute(name: String) async throws -> Trigger {

        try await repository.createTrigger(name: name)
    }
}
