//
//  OnboardingViewModel.swift
//  LastOne
//
//  Created by Naila Amirova on 12.06.26.
//

import Foundation
import Combine

@MainActor
final class OnboardingViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var dailyGoalStart = 20
    @Published var dailyGoalFinal: Int = 0
    @Published var reductionPaceWeeks: Int = 4
    @Published var step: Int = 1

    @Published var isLoading = false
    @Published var errorMessage: String?

    @Published var isCompleted = false

    // MARK: - Dependencies

    private let setupProfileUseCase: SetupProfileUseCase

    // MARK: - Init

    init(setupProfileUseCase: SetupProfileUseCase) {
        self.setupProfileUseCase = setupProfileUseCase
    }

    // MARK: - Computed

    var recommendedPerDay: Int {
        max(dailyGoalStart - 2, 1)
    }

    // MARK: - Actions

    func decrease() {

        if dailyGoalStart > 1 {
            dailyGoalStart -= 1
        }
    }

    func increase() {

        dailyGoalStart += 1
    }

    func setupProfile() {

        Task {

            isLoading = true
            errorMessage = nil

            defer {
                isLoading = false
            }

            do {

                _ = try await setupProfileUseCase.execute(
                    dailyGoalStart: dailyGoalStart,
                    dailyGoalFinal: dailyGoalFinal,
                    reductionPaceWeeks: reductionPaceWeeks,
                    timezone: TimeZone.current.identifier
                )

                isCompleted = true

            } catch {

                errorMessage = error.localizedDescription
            }
        }
    }
}
