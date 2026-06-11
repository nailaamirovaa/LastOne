//
//  TodaysLogDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

extension TodaysLogsDataDTO {

    func toEntity() -> TodayLogs {

        TodayLogs(
            logs: (logs ?? []).map { $0.toEntity() },
            count: count ?? 0,
            dailyGoal: dailyGoal ?? 0,
            remaining: remaining ?? 0,
            exceeded: exceeded ?? false
        )
    }
}
