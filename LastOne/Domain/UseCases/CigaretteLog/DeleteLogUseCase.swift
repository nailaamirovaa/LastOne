//
//  DeleteLogUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol DeleteLogUseCase {

    func execute(id: String) async throws
}

final class DeleteLogUseCaseImpl: DeleteLogUseCase {

    private let repository: LogRepository

    init(repository: LogRepository) {
        self.repository = repository
    }

    func execute(id: String) async throws {

        try await repository.deleteLog(id: id)
    }
}
