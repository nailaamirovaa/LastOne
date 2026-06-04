//
//  TodaysLogDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

extension TodaysLogsData {

    func toEntity() -> TodayLogs {

        TodayLogs(
            logs: logs.map { $0.toEntity() },
            count: count,
            dailyGoal: dailyGoal,
            remaining: remaining,
            exceeded: exceeded
        )
    }
}
