//
//  WeekLogsResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

struct WeekLogsResponseDTO: Decodable {

    let success: Bool
    let data: WeekLogsDataDTO
}

struct WeekLogsDataDTO: Decodable {

    let logs: [Log]
    let count: Int
    let from: String
    let to: String
}
