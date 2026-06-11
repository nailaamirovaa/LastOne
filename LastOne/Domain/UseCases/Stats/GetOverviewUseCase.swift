//
//  GetOverviewUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//



protocol GetOverviewUseCase {
    func execute() async throws -> OverviewStats
}

final class GetOverviewUseCaseImpl: GetOverviewUseCase {

    private let repository: StatsRepository

    init(repository: StatsRepository) {
        self.repository = repository
    }

    func execute() async throws -> OverviewStats {
        try await repository.getOverview()
    }
}
