//
//  TrendsView.swift
//  LastOne
//
//  Created by Naila Amirova on 09.06.26.
//

import SwiftUI

struct TrendsView: View {
    
    @StateObject private var viewModel: TrendsViewModel
    
    init(
        getDailyStatsUseCase: GetDailyStatsUseCase,
        getWeeklyStatsUseCase: GetWeeklyStatsUseCase,
        getMonthlyStatsUseCase: GetMonthlyStatsUseCase,
        getOverallStatsUseCase: GetOverviewUseCase
    ) {
        
        _viewModel = StateObject(
            wrappedValue: TrendsViewModel(
                getDailyStatsUseCase: getDailyStatsUseCase,
                getWeeklyStatsUseCase: getWeeklyStatsUseCase,
                getMonthlyStatsUseCase: getMonthlyStatsUseCase,
                getOverallStatsUseCase: getOverallStatsUseCase
            )
        )
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
    
                Text("Trends")
                    .font(.display)
                    .foregroundStyle(.primaryText)
                
                rangePicker
                
                weeklySummaryCard
                
                miniStats
                
                paceCard

                Spacer(minLength: 96)
            }
            .padding(.horizontal, 24)
            .padding(.top, 30)
        }
        .onAppear {
            viewModel.load()
        }
        .background(Color.appBackground.ignoresSafeArea())
    }
}

private extension TrendsView {
    
    var rangePicker: some View {
        HStack(spacing: 0) {
            ForEach(TrendRange.allCases, id: \.self) { range in
                Button {
                    viewModel.selectedRange = range
                    viewModel.load()
                } label: {
                    Text(range.title)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(viewModel.selectedRange == range ? Color.primaryText : Color.secondaryText)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background {
                            if viewModel.selectedRange == range {
                                Capsule()
                                    .fill(Color.surface)
                                    .shadow(color: .black.opacity(0.14), radius: 8, y: 4)
                            }
                        }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(4)
        .background(Color.secondarySurface)
        .clipShape(Capsule())
    }

    var weeklySummaryCard: some View {
        VStack(alignment: .leading, spacing: 28) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(summaryTitle)
                        .font(.callout)
                        .foregroundStyle(.secondaryText)

                    Text(summaryValue)
                        .font(.custom("Newsreader-Medium", size: 56))
                        .foregroundStyle(.primaryText)
                }

                Spacer()

                Text("-18%")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundStyle(.primaryAccent)
                    .padding(.horizontal, 24)
                    .frame(height: 44)
                    .background(Color.primaryAccent.opacity(0.12))
                    .clipShape(Capsule())
            }

            WeeklyBarChart(days: chartDays)
        }
        .padding(24)
        .background(Color.surface)
        .cornerRadius(AppRadius.xl)
    }

    var miniStats: some View {

        HStack(spacing: 14) {

            switch viewModel.selectedRange {

            case .week:

                StatTile(
                    title: "Total",
                    value: "\(viewModel.weeklyStats?.total ?? 0)",
                    valueColor: .success
                )

                StatTile(
                    title: "Avg / day",
                    value: String(
                        format: "%.1f",
                        viewModel.weeklyStats?.dailyAverage ?? 0
                    ),
                    valueColor: .primaryText
                )

            case .month:

                StatTile(
                    title: "Total",
                    value: "\(viewModel.monthlyStats?.total ?? 0)",
                    valueColor: .success
                )

                StatTile(
                    title: "Days",
                    value: "\(viewModel.monthlyStats?.days.count ?? 0)",
                    valueColor: .primaryText
                )

            case .year:

                StatTile(
                    title: "Streak",
                    value: "\(viewModel.overallStats?.currentStreak ?? 0)",
                    valueColor: .success
                )

                StatTile(
                    title: "Reduction",
                    value: "\(viewModel.overallStats?.reductionPercent ?? 0)%",
                    valueColor: .primaryText
                )
            }
        }
    }

    var paceCard: some View {
        HStack(spacing: 22) {
            Image(systemName: "bolt.fill")
                .font(.system(size: 42, weight: .bold))
                .foregroundStyle(.primaryAccent)

            VStack(alignment: .leading, spacing: 2) {
                Text("At this pace you'll reach")
                    .font(.callout)
                    .foregroundStyle(.secondaryText)

                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text("9/day")
                        .font(.headline)
                        .foregroundStyle(.primaryText)

                    Text("in about 4 weeks.")
                        .font(.callout)
                        .foregroundStyle(.secondaryText)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(24)
        .background(Color.primaryAccent.opacity(0.10))
        .cornerRadius(AppRadius.xl)
        .overlay {
            RoundedRectangle(cornerRadius: AppRadius.xl)
                .stroke(Color.primaryAccent.opacity(0.45), lineWidth: 1)
        }
    }
    
    private var summaryTitle: String {

        switch viewModel.selectedRange {

        case .week:
            return "Avg / day this week"

        case .month:
            return "Total this month"

        case .year:
            return "Total smoked"
        }
    }
    
    private var summaryValue: String {

        switch viewModel.selectedRange {

        case .week:

            return String(
                format: "%.1f",
                viewModel.weeklyStats?.dailyAverage ?? 0
            )

        case .month:

            return "\(viewModel.monthlyStats?.total ?? 0)"

        case .year:

            return "\(viewModel.overallStats?.totalCigarettesSmoked ?? 0)"
        }
    }
    
    private var chartDays: [Int] {

        switch viewModel.selectedRange {

        case .week:

            return viewModel.weeklyStats?.days.map {
                $0.count
            } ?? []

        case .month:

            return viewModel.monthlyStats?.days.map {
                $0.count
            } ?? []

        case .year:

            return []
        }
    }
}

enum TrendRange: CaseIterable {
    case week, month, year
    var title: String {
        switch self {
        case .week: return "Week"
        case .month: return "Month"
        case .year: return "Year"
        }
    }
}

struct WeeklyBarChart: View {

    let days: [Int]

    var body: some View {

        HStack(alignment: .bottom, spacing: 16) {

            ForEach(days.indices, id: \.self) { index in

                Capsule()
                    .fill(Color.primaryAccent)
                    .frame(
                        width: 24,
                        height: CGFloat(days[index] * 8)
                    )
            }
        }
        .frame(height: 160)
        .frame(maxWidth: .infinity)
    }
}
