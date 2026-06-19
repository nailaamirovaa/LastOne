import SwiftUI

struct TrendsView: View {
    
    @StateObject private var viewModel: TrendsViewModel
    
    @State private var showPaywall = false
    
    init(
        getDailyStatsUseCase: GetDailyStatsUseCase,
        getWeeklyStatsUseCase: GetWeeklyStatsUseCase,
        getMonthlyStatsUseCase: GetMonthlyStatsUseCase,
        getOverallStatsUseCase: GetOverviewUseCase,
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
                
                if viewModel.isLoading {
                    loadingView
                } else if let error = viewModel.errorMessage {
                    errorView(error)
                } else if !viewModel.hasData {
                    emptyView
                } else {
                    contentView
                }

                Spacer(minLength: 96)
            }
            .padding(.horizontal, 24)
            .padding(.top, 30)
        }
        .onAppear {
            viewModel.load()
            if UserDefaults.standard.object(forKey: "subscription") as! String == "FREE" {
                withAnimation {
                    showPaywall = true
                }
            }
        }
        .sheet(isPresented: $showPaywall, content: {
            PaywallView()
                .presentationDetents([.height(520)])
                .frame(maxWidth: .infinity ,)
                .presentationDragIndicator(.visible)
                
        })
        .overlay {
            if UserDefaults.standard.object(forKey: "subscription") as! String == "FREE" {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .foregroundStyle(.hairline)
                    .ignoresSafeArea()
            }
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

    var loadingView: some View {
        VStack {
            Spacer()
            ProgressView()
                .tint(.primaryAccent)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 300)
    }

    var emptyView: some View {
        VStack(spacing: 12) {
            Spacer()
            Image(systemName: "chart.bar.xaxis")
                .font(.system(size: 48))
                .foregroundStyle(.secondaryText)
            Text("No data available")
                .font(.headline)
                .foregroundStyle(.secondaryText)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 300)
    }

    func errorView(_ message: String) -> some View {
        VStack(spacing: 12) {
            Spacer()
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 48))
                .foregroundStyle(.primaryAccent)
            Text(message)
                .font(.headline)
                .foregroundStyle(.primaryText)
                .multilineTextAlignment(.center)
            Button("Try Again") {
                viewModel.load()
            }
            .buttonStyle(.borderedProminent)
            .tint(.primaryAccent)
            Spacer()
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .frame(height: 300)
    }

    var contentView: some View {
        VStack(alignment: .leading, spacing: 24) {
            summaryCard
            miniStats
        }
    }

    var summaryCard: some View {
        VStack(alignment: .leading, spacing: 28) {
            VStack(alignment: .leading, spacing: 2) {
                Text(viewModel.summaryTitle)
                    .font(.callout)
                    .foregroundStyle(.secondaryText)

                Text(viewModel.summaryValue)
                    .font(.custom("Newsreader-Medium", size: 56))
                    .foregroundStyle(.primaryText)
            }

            if viewModel.showChart {
                TrendBarChart(data: viewModel.chartData)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.surface)
        .cornerRadius(AppRadius.xl)
    }

    var miniStats: some View {
        HStack(spacing: 14) {
            if let tile1 = viewModel.tile1 {
                StatTile(
                    title: tile1.title,
                    value: tile1.value,
                    valueColor: .success
                )
            }

            if let tile2 = viewModel.tile2 {
                StatTile(
                    title: tile2.title,
                    value: tile2.value,
                    valueColor: .primaryText
                )
            }

            if let tile3 = viewModel.tile3 {
                StatTile(
                    title: tile3.title,
                    value: tile3.value,
                    valueColor: .primaryText
                )
            }
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

struct TrendBarChart: View {
    let data: [TrendsViewModel.ChartBar]

    var body: some View {
        VStack(spacing: 12) {
            HStack(alignment: .bottom, spacing: chartSpacing) {
                let maxVal = Swift.max(data.map { $0.value }.max() ?? 1, 1)
                
                ForEach(data) { bar in
                    
                    VStack(spacing: 8) {
                        Capsule()
                            .fill(Color.primaryAccent)
                            .frame(width: barWidth, height: calculateHeight(value: bar.value, maxValue: maxVal))
                        
                        Text(bar.label)
                            .font(.system(size: 10, weight: .medium))
                            .foregroundStyle(.secondaryText)
                            .fixedSize()
                    }
                }
            }
            .frame(height: 180)
            .frame(maxWidth: .infinity)
        }
    }

    private var barWidth: CGFloat {
        data.count > 8 ? 4 : 24
    }

    private var chartSpacing: CGFloat {
        data.count > 8 ? 4 : 12
    }

    private func calculateHeight(value: Int, maxValue: Int) -> CGFloat {
        let minHeight: CGFloat = 4
        let maxHeight: CGFloat = 140
        return max(minHeight, CGFloat(value) / CGFloat(maxValue) * maxHeight)
    }
}
