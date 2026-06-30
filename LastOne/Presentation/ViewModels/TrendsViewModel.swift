import SwiftUI
import Combine

@MainActor
final class TrendsViewModel: ObservableObject {

    @Published var selectedRange: TrendRange = .week {
        didSet {
            load()
        }
    }

    @Published private(set) var weeklyStats: WeeklyStats?
    @Published private(set) var monthlyStats: MonthlyStats?
    @Published private(set) var overallStats: OverviewStats?

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

    // MARK: - Formatted Properties

    var summaryTitle: LocalizedStringKey {
        switch selectedRange {
        case .week: return "Avg / day this week"
        case .month: return "Total this month"
        case .year: return "Total smoked"
        }
    }

    var summaryValue: String {
        switch selectedRange {
        case .week:
            guard let stats = weeklyStats else { return "0" }
            return String(format: "%.1f", stats.dailyAverage)
        case .month:
            guard let stats = monthlyStats else { return "0" }
            return "\(stats.total)"
        case .year:
            guard let stats = overallStats else { return "0" }
            return "\(stats.totalCigarettesSmoked)"
        }
    }

    var tile1: (title: LocalizedStringKey, value: String)? {
        switch selectedRange {
        case .week:
            let val = weeklyStats?.total ?? 0
            return ("total", "\(val)")
        case .month:
            let val = monthlyStats?.total ?? 0
            return ( "total", "\(val)")
        case .year:
            let val = overallStats?.totalCigarettesSmoked ?? 0
            return ("total", "\(val)")
        }
    }
    
    var tile2: (title: LocalizedStringKey, value: String)? {
        switch selectedRange {
        case .week:
            let val = weeklyStats?.dailyAverage ?? 0
            return ("avg_day",String(format: "%.1f", val))

        case .month:
            let val = monthlyStats?.days.count ?? 0
            return ("days", "\(val)")

        case .year:
            let val = overallStats?.currentStreak ?? 0
            return ("streak", "\(val)")
        }
    }

    var tile3: (title: LocalizedStringKey, value: String)? {
        if selectedRange == .year {
            let val = overallStats?.reductionPercent ?? 0
            return ("reduction", "\(val)%")
        }
        return nil
    }

    var showChart: Bool {
        switch selectedRange {
        case .week:
            return weeklyStats != nil
        case .month:
            return monthlyStats != nil
        case .year:
            return false
        }
    }

    struct ChartBar: Identifiable {
        let id = UUID()
        let value: Int
        let label: String
    }

    var chartData: [ChartBar] {
        switch selectedRange {
        case .week:
            return weeklyStats?.days.map { day in
                ChartBar(value: day.count, label: day.date.toWeekday())
            } ?? []
        case .month:
            return monthlyStats?.days.map { day in
                ChartBar(value: day.count, label: day.date.toDayNumber())
            } ?? []
        case .year:
            return []
        }
    }

    var hasData: Bool {
        if overallStats != nil { return true }
        
        switch selectedRange {
        case .week: return weeklyStats != nil
        case .month: return monthlyStats != nil
        case .year: return overallStats != nil
        }
    }

    func load() {
        Task {
            isLoading = true
            errorMessage = nil
            defer { isLoading = false }

            do {
                
                overallStats = try await getOverallStatsUseCase.execute()
                
                // Fetch specific range stats
                switch selectedRange {
                case .week:
                    let stats = try await getWeeklyStatsUseCase.execute(week:currentWeek)


                    weeklyStats = stats
                case .month:
                    monthlyStats = try await getMonthlyStatsUseCase.execute(month: currentMonth)
                case .year:
                    break
                }
            } catch {
                let errorMsg = error.localizedDescription
        
                if errorMsg.contains("Premium") || errorMsg.contains("subscription") {
                    print("Handled backend premium restriction: \(errorMsg)")
                    
                } else if !hasData {
                    errorMessage = errorMsg
                }
            }
        }
    }

    // MARK: - Private Helpers

    private var currentWeek: String {
        let calendar = Calendar.current
        let week = calendar.component(.weekOfYear, from: Date())
        let year = calendar.component(.yearForWeekOfYear, from: Date())
        return String(format: "%04d-W%02d", year, week)
    }

    private var currentMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        return formatter.string(from: Date())
    }
}

extension String {
    func toWeekday() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: self) else { return "" }
        formatter.dateFormat = "EE"
        return String(formatter.string(from: date).prefix(1))
    }

    func toDayNumber() -> String {
        let components = self.split(separator: "-")
        guard components.count == 3, let last = components.last else { return "" }
        let day = String(last)
       
        if let dayInt = Int(day), dayInt % 5 == 0 || dayInt == 1 {
            return day
        }
        return ""
    }
}
