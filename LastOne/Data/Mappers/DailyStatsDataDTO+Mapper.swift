//
//  DailyStatsDataDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension DailyStatsDataDTO {

    func toEntity() -> DailyStats {

        DailyStats(
            date: date,
            count: count,
            dailyGoal: dailyGoal,
            logs: logs.map { $0.toEntity() }
        )
    }
}
