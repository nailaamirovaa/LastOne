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
    case apiError(message:String,code:String?)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:            return "Invalid URL"
        case .invalidResponse:       return "No response"
        case .serverError(let code): return "Server error: \(code)"
        case .decodingError:         return "Failed to decode response."
        case .apiError(let msg, _):     return msg
        }
    }
}
