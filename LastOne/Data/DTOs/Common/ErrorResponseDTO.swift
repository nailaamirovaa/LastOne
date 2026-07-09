//
//  ErrorResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


struct ErrorResponseDTO: Decodable {

    let success: Bool?
    let error: String?
    let code: String?
}
