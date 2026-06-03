//
//  NetworkError.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case serverError(Int)
    case decodingError
    case apiError(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:           return "URL düzgün deyil"
        case .invalidResponse:      return "Cavab alınmadı"
        case .serverError(let code): return "Server xətası: \(code)"
        case .decodingError:        return "Məlumat oxunmadı"
        case .apiError(let msg):    return msg
        }
    }
}
