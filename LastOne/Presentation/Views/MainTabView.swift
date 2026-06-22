//
//  MainTabView.swift
//  LastOne
//
//  Created by Naila Amirova on 09.06.26.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator

    var body: some View {
        ZStack(alignment: .bottom) {
            
            activeContent

            CustomTabBar(selected: $coordinator.selectedTab)

        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }

    private var activeContent: some View {
        ZStack {
            
            switch coordinator.selectedTab {
            case .today:
                TodayView(getProfileUseCase: GetProfileUseCaseImpl(repository: UserRepositoryImpl(service: ProfileService())),
                          getTodayLogsUseCase: GetTodaysLogsUseCaseImpl(repository: LogRepositoryImpl(service: CigaretteLogsService())),
                          getStreakUseCase: GetStreakUseCaseImpl(repository: StreakRepositoryImpl(service: StreakService())),
                          recalculateStreakUseCase: RecalculateStreakUseCaseImpl(repository: StreakRepositoryImpl(service: StreakService())))

            case .trends:
                TrendsView(
                    getDailyStatsUseCase: GetDailyStatsUseCaseImpl(repository: StatsRepositoryImpl(service: StatsService())),
                    getWeeklyStatsUseCase: GetWeeklyStatsUseCaseImpl(repository: StatsRepositoryImpl(service: StatsService())),
                    getMonthlyStatsUseCase: GetMonthlyStatsUseCaseImpl(repository: StatsRepositoryImpl(service: StatsService())),
                    getOverallStatsUseCase: GetOverviewUseCaseImpl(repository: StatsRepositoryImpl(service: StatsService()))
                    )

            case .add:
                LogView(getTriggersUseCase: GetTriggersUseCaseImpl(repository: TriggerRepositoryImpl(service: TriggersService())),
                        getTodayLogsUseCase: GetTodaysLogsUseCaseImpl(repository: LogRepositoryImpl(service: CigaretteLogsService())),
                        logCigaretteUseCase: LogCigaretteUseCaseImpl(repository: LogRepositoryImpl(service: CigaretteLogsService())))

            case .insights:
                InsightsView(getTriggerAnalysisUseCase: GetTriggerAnalysisUseCaseImpl(repository: StatsRepositoryImpl(service: StatsService())))

            case .you:
                ProfileView(getProfileUseCase: GetProfileUseCaseImpl(repository: UserRepositoryImpl(service: ProfileService())),
                            updateProfileUseCase: UpdateProfileUseCaseImpl(repository: UserRepositoryImpl(service: ProfileService())),
                            logoutUseCase: LogoutUseCaseImpl(repository: AuthRepositoryImpl(service: AuthService())))
            }
    
        }
    }
}


    
