//
//  UserRepository.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol UserRepository {

    func setupProfile( dailyGoalStart: Int, dailyGoalFinal: Int, reductionPaceWeeks: Int, timezone: String) async throws -> Profile

    func getProfile() async throws -> UserProfile

    func updateProfile(dailyGoalFinal: Int, reductionPaceWeeks: Int, timezone: String) async throws -> Profile
}
