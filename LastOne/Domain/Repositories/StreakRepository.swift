//
//  StreakRepository.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol StreakRepository {

    func getStreak() async throws -> Streak

    func recalculateStreak() async throws -> Streak
}