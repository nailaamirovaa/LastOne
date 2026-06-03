//
//  UpdateProfileRequestDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

struct UpdateProfileRequestDTO: Encodable {
    let dailyGoalFinal, reductionPaceWeeks: Int
    let timezone: String
}
