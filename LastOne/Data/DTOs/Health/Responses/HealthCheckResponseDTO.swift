//
//  HealthCheckResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

//MARK: - Data
struct HealthCheckDataDTO: Decodable {
    let status: String?
    let timestamp: String?
}
