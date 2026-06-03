//
//  AuthResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

struct AuthResponseDTO: Decodable {

    let success: Bool
    let data: AuthDataDTO
}