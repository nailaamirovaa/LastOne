//
//  StreakService.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//


import Foundation

public final class StreakService {
    
    private let networkManager =
        NetworkManager.shared
    
    // MARK: - Get Streak
    
    func getStreak()
    async throws -> GetStreakResponseDTO {

        try await networkManager.request(

            StreakEndpoint.getStreak,

            responseType:
                GetStreakResponseDTO.self
        )
    }
    
    // MARK: - Manual Recalculate Streak
    
    func manualRecalculateStreak()
    async throws -> ManualRecalculateStreakResponseDTO {

        try await networkManager.request(

            StreakEndpoint.manualRecalculateStreak,

            responseType:
                ManualRecalculateStreakResponseDTO.self
        )
    }
}
