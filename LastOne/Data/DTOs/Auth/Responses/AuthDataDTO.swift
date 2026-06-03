//
//  AuthDataDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

struct AuthDataDTO: Decodable {

    let accessToken: String
    let refreshToken: String
    let user: UserDTO
}