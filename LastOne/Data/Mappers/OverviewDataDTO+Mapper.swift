//
//  OverviewDataDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension OverviewDataDTO {

    func toEntity() -> OverviewStats {

        OverviewStats(
            totalCigarettesSmoked: totalCigarettesSmoked ?? 0,
            daysActive: daysActive ?? 0,
            averagePerDay: averagePerDay ?? 0,
            reductionPercent: reductionPercent ?? 0,
            currentStreak: currentStreak ?? 0,
            longestStreak: longestStreak ?? 0,
            dailyGoalStart: dailyGoalStart ?? 0,
            dailyGoalCurrent: dailyGoalCurrent ?? 0,
            dailyGoalFinal: dailyGoalFinal ?? 0
        )
    }
}
