//
//  TodaysLogsResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Response
struct TodaysLogsResponseDTO: Decodable {
    let success: Bool
    let data: TodaysLogsData
}

// MARK: - DataClass
struct TodaysLogsData: Decodable {
    let logs: [TodaysLogsLog]
    let count, dailyGoal, remaining: Int
    let exceeded: Bool
}

// MARK: - Log
struct TodaysLogsLog: Decodable {
    let id, smokedAt, note: String
    let trigger: TodaysLogsTrigger
}

// MARK: - Trigger
struct TodaysLogsTrigger: Decodable {
    let name: String
}
