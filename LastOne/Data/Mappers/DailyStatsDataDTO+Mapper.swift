//
//  DailyStatsDataDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension DailyStatsDataDTO {

    func toEntity() -> DailyStats {

        DailyStats(
            date: date ?? "",
            count: count ?? 0,
            dailyGoal: dailyGoal ?? 0,
            logs: (logs ?? []).map { $0.toEntity() }
        )
    }
}
