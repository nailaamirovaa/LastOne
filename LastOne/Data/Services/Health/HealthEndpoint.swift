//
//  HealthEndpoint.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

enum HealthEndpoint: Endpoint {
    
    case healthCheck
    
    var path: String {
        return "/health"
    }
    
    var method: HTTPMethod {
        return .get
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

