//
//  HealthCheckResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

struct HealthCheckResponseDTO: Decodable {
    let succes: Bool
    let data: HealthCheckDataDTO
}

struct HealthCheckDataDTO: Decodable {
    let status: String
    let timestamp: String
}
