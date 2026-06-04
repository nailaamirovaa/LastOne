//
//  OverviewDataDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension OverviewDataDTO {

    func toEntity() -> OverviewStats {

        OverviewStats(
            totalCigarettesSmoked: totalCigarettesSmoked,
            daysActive: daysActive,
            averagePerDay: averagePerDay,
            reductionPercent: reductionPercent,
            currentStreak: currentStreak,
            longestStreak: longestStreak,
            dailyGoalStart: dailyGoalStart,
            dailyGoalCurrent: dailyGoalCurrent,
            dailyGoalFinal: dailyGoalFinal
        )
    }
}
