//
//  WeeklyStatsDataDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension WeeklyStatsDataDTO {

    func toEntity() -> WeeklyStats {

        WeeklyStats(
            week: week ?? "",
            total: total ?? 0,
            dailyAverage: dailyAverage ?? 0,
            days: (days ?? []).map { $0.toEntity() }
        )
    }
}
