//
//  TodayViewModel.swift
//  LastOne
//
//  Created by Naila Amirova on 12.06.26.
//


import Foundation
import Combine

@MainActor
final class TodayViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var userProfile: UserProfile?

    @Published var todayLogs: [CigaretteLog] = []

    @Published var todayCount = 0
    @Published var dailyGoal = 0
    @Published var remaining = 0

    @Published var currentStreak = 0
    @Published var longestStreak = 0

    @Published var isLoading = false
    @Published var errorMessage: String?

    // MARK: - Dependencies

    private let getProfileUseCase: GetProfileUseCase
    private let getTodayLogsUseCase: GetTodaysLogsUseCase
    private let getStreakUseCase: GetStreakUseCase

    // MARK: - Init

    init(
        getProfileUseCase: GetProfileUseCase,
        getTodayLogsUseCase: GetTodaysLogsUseCase,
        getStreakUseCase: GetStreakUseCase
    ) {

        self.getProfileUseCase = getProfileUseCase
        self.getTodayLogsUseCase = getTodayLogsUseCase
        self.getStreakUseCase = getStreakUseCase
    }

    // MARK: - Actions

    func load() {

        Task {

            isLoading = true
            errorMessage = nil

            defer {
                isLoading = false
            }

            do {

                async let profile = getProfileUseCase.execute()
                async let logs = getTodayLogsUseCase.execute()
                async let streak = getStreakUseCase.execute()

                let profileResult = try await profile
                let logsResult = try await logs
                let streakResult = try await streak

                userProfile = profileResult

                todayLogs = logsResult.logs
                todayCount = logsResult.count
                dailyGoal = logsResult.dailyGoal
                remaining = logsResult.remaining

                currentStreak = streakResult.currentStreak
                longestStreak = streakResult.longestStreak

            } catch {

                errorMessage = error.localizedDescription
            }
        }
    }
}
