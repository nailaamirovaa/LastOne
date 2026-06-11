//
//  GetProfileResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

// MARK: - Data
struct GetProfileDataDTO: Decodable {
    let user: UserDTO?
    let profile: ProfileDTO?
}
