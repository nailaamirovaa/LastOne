//
//  UserRepositoryImpl.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


final class UserRepositoryImpl: UserRepository {

    private let service: ProfileService

    init(service: ProfileService) {
        self.service = service
    }

    // MARK: - Setup Profile
    func setupProfile(dailyGoalStart: Int,dailyGoalFinal: Int,reductionPaceWeeks: Int,timezone: String) async throws -> Profile {

        let dto = try await service.setupProfile(
            request: SetupProfileRequestDTO(
                dailyGoalStart: dailyGoalStart,
                dailyGoalFinal: dailyGoalFinal,
                reductionPaceWeeks: reductionPaceWeeks,
                timezone: timezone
            )
        )

        guard let profile = dto.profile else {
            throw NetworkError.invalidResponse
        }

        return profile.toEntity()
    }

    // MARK: - Get Profile
    func getProfile() async throws -> UserProfile {

        let dto = try await service.getProfile()

        return dto.toEntity()
    }

    // MARK: - Update Profile
    func updateProfile(dailyGoalFinal: Int, reductionPaceWeeks: Int, timezone: String) async throws -> Profile {

        let dto = try await service.updateProfile(
            request: UpdateProfileRequestDTO(
                dailyGoalFinal: dailyGoalFinal,
                reductionPaceWeeks: reductionPaceWeeks,
                timezone: timezone
            )
        )

        guard let profile = dto.profile else {
            throw NetworkError.invalidResponse
        }

        return profile.toEntity()
    }
}
