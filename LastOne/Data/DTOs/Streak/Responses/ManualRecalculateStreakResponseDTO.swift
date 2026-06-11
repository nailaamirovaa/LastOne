//
//  ManualRecalculateStreakResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - DataClass
struct ManualRecalculateStreakDataDTO: Decodable {
    let streak: StreakDTO?
    let message: String?
}
