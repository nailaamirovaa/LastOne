//
//  DeleteTriggerUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol DeleteTriggerUseCase {

    func execute(id: String) async throws
}

final class DeleteTriggerUseCaseImpl: DeleteTriggerUseCase {

    private let repository: TriggerRepository

    init(repository: TriggerRepository) {
        self.repository = repository
    }

    func execute(id: String) async throws {

        try await repository.deleteTrigger(id: id)
    }
}
