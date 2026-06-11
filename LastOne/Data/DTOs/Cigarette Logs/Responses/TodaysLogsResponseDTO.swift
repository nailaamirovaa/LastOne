//
//  TodaysLogsResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - DataClass
struct TodaysLogsDataDTO: Decodable {
    let logs: [LogDTO]?
    let count, dailyGoal, remaining: Int?
    let exceeded: Bool?
}
