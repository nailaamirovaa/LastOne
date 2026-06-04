//
//  WeeksLogaDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

extension WeekLogsDataDTO {

    func toEntity() -> WeekLogs {

        WeekLogs(
            logs: logs.map { $0.toEntity() },
            count: count,
            from: from,
            to: to
        )
    }
}
