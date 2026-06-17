//
//  TrendsViewModel.swift
//  LastOne
//
//  Created by Naila Amirova on 15.06.26.
//


import Foundation
import Combine

@MainActor
final class TrendsViewModel: ObservableObject {

    @Published var selectedRange: TrendRange = .week {
        didSet {
            load()
        }
    }

    @Published var dailyStats: DailyStats?
    @Published var weeklyStats: WeeklyStats?
    @Published var monthlyStats: MonthlyStats?
    @Published var overallStats: OverviewStats?

    @Published var isLoading = false
    @Published var errorMessage: String?

    private let getDailyStatsUseCase: GetDailyStatsUseCase
    private let getWeeklyStatsUseCase: GetWeeklyStatsUseCase
    private let getMonthlyStatsUseCase: GetMonthlyStatsUseCase
    private let getOverallStatsUseCase: GetOverviewUseCase

    init(
        getDailyStatsUseCase: GetDailyStatsUseCase,
        getWeeklyStatsUseCase: GetWeeklyStatsUseCase,
        getMonthlyStatsUseCase: GetMonthlyStatsUseCase,
        getOverallStatsUseCase: GetOverviewUseCase
    ) {
        self.getDailyStatsUseCase = getDailyStatsUseCase
        self.getWeeklyStatsUseCase = getWeeklyStatsUseCase
        self.getMonthlyStatsUseCase = getMonthlyStatsUseCase
        self.getOverallStatsUseCase = getOverallStatsUseCase
    }
    
    private var currentWeek: String {

        let calendar = Calendar.current

        let week = calendar.component(
            .weekOfYear,
            from: Date()
        )

        let year = calendar.component(
            .yearForWeekOfYear,
            from: Date()
        )

        return String(
            format: "%04d-W%02d",
            year,
            week
        )
    }
    
    private var currentMonth: String {

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"

        return formatter.string(
            from: Date()
        )
    }

    func load() {

        Task {

            isLoading = true
            errorMessage = nil

            defer {
                isLoading = false
            }

            do {

                overallStats = try await getOverallStatsUseCase.execute()

                switch selectedRange {

                case .week:

                    weeklyStats =
                    try await getWeeklyStatsUseCase.execute(week: currentWeek)

                case .month:

                    monthlyStats =
                    try await getMonthlyStatsUseCase.execute(month: currentMonth)

                case .year:

                    monthlyStats =
                    try await getMonthlyStatsUseCase.execute(month: currentMonth)
                }

            } catch {

                errorMessage = error.localizedDescription
            }
        }
    }

    func selectRange(_ range: TrendRange) {

        selectedRange = range

        load()
    }
}
