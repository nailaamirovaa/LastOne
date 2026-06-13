//
//  APIResponse.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


struct APIResponse<T: Decodable>: Decodable {
    let success: Bool
    let data: T?
}

struct APIError: Decodable {
    let success: Bool
    let error: String?
    let code: String?
}
