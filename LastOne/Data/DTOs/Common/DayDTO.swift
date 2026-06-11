//
//  Day.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Day
struct DayDTO: Decodable {
    let date: String?
    let count, goal: Int?
}
