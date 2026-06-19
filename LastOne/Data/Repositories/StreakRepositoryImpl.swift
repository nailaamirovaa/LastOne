//
//  StreakRepositoryImpl.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


final class StreakRepositoryImpl: StreakRepository {

    private let service: StreakService

    init(service: StreakService) {
        self.service = service
    }

    // MARK: - Get Streak
    func getStreak() async throws -> Streak {

        
        let dto = try await service.getStreak()

        return dto.toEntity()
    }

    // MARK: - Recalculate Streak
    func recalculateStreak() async throws -> Streak {

        let dto = try await service.manualRecalculateStreak()

        guard let streak = dto.streak else {
            throw NetworkError.invalidResponse
        }

        return streak.toEntity()
    }
}
