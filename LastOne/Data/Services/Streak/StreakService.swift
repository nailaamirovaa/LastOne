//
//  StreakService.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//


import Foundation

public final class StreakService {
    
    private let networkManager = NetworkManager.shared
    
    // MARK: - Get Streak
    func getStreak() async throws -> GetStreakDataDTO {
        try await networkManager.request(
            StreakRequest.getStreak,
            responseType:GetStreakDataDTO.self
        )
    }
    
    // MARK: - Manual Recalculate Streak
    func manualRecalculateStreak() async throws -> ManualRecalculateStreakDataDTO {
        try await networkManager.request(
            StreakRequest.manualRecalculateStreak,
            responseType: ManualRecalculateStreakDataDTO.self
        )
    }
}
