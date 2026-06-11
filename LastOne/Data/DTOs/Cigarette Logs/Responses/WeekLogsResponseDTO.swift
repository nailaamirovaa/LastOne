//
//  WeekLogsResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

struct WeekLogsDataDTO: Decodable {

    let logs: [LogDTO]?
    let count: Int?
    let from: String?
    let to: String?
}
