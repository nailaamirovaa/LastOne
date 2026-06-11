//
//  StreakEndpoint.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

enum StreakRequest: APIRequest {
    
    case getStreak
    case manualRecalculateStreak
    
    var path: String {
        
        switch self {
        case .getStreak:
            return "/streak"
        case .manualRecalculateStreak:
            return "/streak/recalculate"
        }
    }
    
    var method: HTTPMethod {
        
        switch self {
        case .getStreak:
            return .get
        case .manualRecalculateStreak:
            return .post
        }
    }
    
    var body: Data? {
        nil
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
}
