//
//  MonthlyStatsDataDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension MonthlyStatsDataDTO {

    func toEntity() -> MonthlyStats {

        MonthlyStats(
            month: month,
            total: total,
            days: days.map { $0.toEntity() }
        )
    }
}
