//
//  TodayView.swift
//  LastOne
//
//  Created by Naila Amirova on 09.06.26.
//

import SwiftUI

struct TodayView: View {
    
    @StateObject private var viewModel: TodayViewModel
    
    @State private var showAllLogs = false
    
    init(getProfileUseCase: GetProfileUseCase,
        getTodayLogsUseCase: GetTodaysLogsUseCase,
        getStreakUseCase: GetStreakUseCase,
        recalculateStreakUseCase: RecalculateStreakUseCase
    ) {

        _viewModel = StateObject(
            wrappedValue: TodayViewModel(
                getProfileUseCase: getProfileUseCase,
                getTodayLogsUseCase: getTodayLogsUseCase,
                getStreakUseCase: getStreakUseCase,
                recalculateStreakUseCase: recalculateStreakUseCase
            )
        )
    }
    
    private var todayText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE • MMM d"
        return formatter.string(from: Date())
    }

    var body: some View {
        
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            
            
            if viewModel.isLoading {
                LoadingView()
            } else if let error = viewModel.errorMessage {
                ErrorView(message: error){
                    viewModel.load()
                }
            } else {
                contentView
            }
        }
        .sheet(isPresented: $showAllLogs) {

            TodaysLogsView(
                logs: viewModel.todayLogs
            )
        }
        .onAppear() {
            Task {
                viewModel.load()
            }
        }
    }
    
}

// MARK: - HEADER
private extension TodayView {
    
    var contentView: some View {
        
        ScrollView {
            VStack(spacing: AppSpacing.xl) {
                
                header
                
                progressSection
                
                streakCard
                
                logSection
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            .padding(.bottom, 120)
        }
    }

    var header: some View {

        HStack(alignment: .top) {

            VStack(alignment: .leading, spacing: 4) {

                Text(todayText)
                    .font(.subhead)
                    .foregroundStyle(.secondaryText)

                Text("Good evening")
                    .font(.headline)
                    .foregroundStyle(.primaryText)
            }

            Spacer()

            Button {

            } label: {

                Image(systemName: "gearshape")
                    .font(.headline)
                    .foregroundStyle(.secondaryText)
                    .frame(width: 56, height: 56)
                    .background(Color.surface)
                    .clipShape(Circle())
            }
        }
    }
}

// MARK: - PROGRESS SECTION
private extension TodayView {

    var progressSection: some View {

        VStack(spacing: AppSpacing.lg) {

            ProgressRingView(
                current: viewModel.todayCount,
                target: viewModel.dailyGoal
            )

            Text("\(viewModel.remaining) left — you're pacing well")
                .font(.title3)
                .foregroundStyle(.primaryAccent)
        }
    }
}

// MARK: - STREAK CARD
private extension TodayView {

    var streakCard: some View {

        HStack(spacing: AppSpacing.md) {

            Image(systemName: "flame.fill")
                .font(.title)
                .foregroundStyle(.primaryAccent)
                .frame(width: 64, height: 64)
                .background(
                    Color.primaryAccent.opacity(0.15)
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 20)
                )

            VStack(
                alignment: .leading,
                spacing: 4
            ) {

                Text("\(viewModel.currentStreak)-day streak")
                    .foregroundStyle(.primaryText)
                    .font(.headline)

                Text("under budget")
                    .font(.bodyText)
                    .foregroundStyle(.secondaryText)
            }

            Spacer()

            Text("\(viewModel.currentStreak)")
                .font(.system(size: 48))
                .foregroundStyle(.primaryAccent)
        }
        .padding(24)
        .background(Color.surface)
        .clipShape(
            RoundedRectangle(
                cornerRadius: AppRadius.lg
            )
        )
        .overlay {
            RoundedRectangle(
                cornerRadius: AppRadius.lg
            )
            .stroke(Color.hairline)
        }
    }
}

// MARK: - LOG SECTION
private extension TodayView {

    var logSection: some View {

        VStack(
            alignment: .leading,
            spacing: AppSpacing.md
        ) {

            HStack {

                Text("TODAY'S LOG")
                    .font(.caption)
                    .tracking(2)
                    .foregroundStyle(.secondaryText)

                Spacer()
                
                Button("See all") {
                    showAllLogs = true
                }
                .font(.bodyText)
                .foregroundStyle(.primaryAccent)
            }
            
            VStack(spacing: AppSpacing.md) {
                
                ForEach(viewModel.todayLogs) { log in
                    
                    LogRowView(
                        time: logTime(from: log.smokedAt),
                        trigger: log.trigger?.name
                    )
                }
            }
            
        }
    }
    
    func logTime(from createdAt: String) -> String {

        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [
            .withInternetDateTime,
            .withFractionalSeconds
        ]

        guard let date = isoFormatter.date(from: createdAt) else {
            return "--:--"
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"

        return formatter.string(from: date)
    }
}

// MARK: - LOG ROW
struct LogRowView: View {

    let time: String
    let trigger: String?

    var body: some View {

        HStack(spacing: AppSpacing.md) {

            Circle()
                .fill(Color.primaryAccent)
                .frame(width: 12, height: 12)

            VStack(
                alignment: .leading,
                spacing: 4
            ) {

                Text(time)
                    .font(.subhead.bold())
                    .foregroundStyle(.primaryText)

                Text(trigger ?? "No trigger")
                    .font(.footnote)
                    .foregroundStyle(.secondaryText)
            }

            Spacer()

            Image(systemName: "flame.fill")
                .foregroundStyle(.secondaryText)
        }
        .padding(12)
        .background(Color.surface)
        .clipShape(
            RoundedRectangle(
                cornerRadius: AppRadius.md
            )
        )
        .overlay {
            RoundedRectangle(
                cornerRadius: AppRadius.md
            )
            .stroke(Color.hairline)
        }
    }
}
