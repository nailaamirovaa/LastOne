//
//  ExportCSVUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//

import Foundation

protocol ExportCSVUseCase {
    func execute() async throws -> Data
}

final class ExportCSVUseCaseImpl: ExportCSVUseCase {

    private let repository: StatsRepository

    init(repository: StatsRepository) {
        self.repository = repository
    }

    func execute() async throws -> Data {
        try await repository.exportCSV()
    }
}
