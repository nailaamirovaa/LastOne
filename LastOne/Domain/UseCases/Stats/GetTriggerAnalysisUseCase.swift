//
//  GetTriggerAnalysisUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol GetTriggerAnalysisUseCase {
    func execute() async throws -> TriggerAnalysis
}

final class GetTriggerAnalysisUseCaseImpl: GetTriggerAnalysisUseCase {

    private let repository: StatsRepository

    init(repository: StatsRepository) {
        self.repository = repository
    }

    func execute() async throws -> TriggerAnalysis {
        try await repository.getTriggerAnalysis()
    }
}
