//
//  SetupProfileRequestDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation


struct SetupProfileRequestDTO: Encodable {
    let dailyGoalStart, dailyGoalFinal, reductionPaceWeeks: Int
    let timezone: String
}
