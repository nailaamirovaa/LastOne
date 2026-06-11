//
//  TriggersEndpoint.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

enum TriggersRequest: APIRequest {
    
    case listTriggers
    case createCustomTrigger(CreateCustomTriggerRequestDTO)
    case deleteCustomTrigger(id: String)
    
    var path: String {
        
        switch self {
        case .listTriggers, .createCustomTrigger:
            return "/triggers"
        case .deleteCustomTrigger(let id):
            return "/triggers/\(id)"
        }
    }
    
    var method: HTTPMethod {
        
        switch self {
        case .listTriggers:
            return .get
        case .createCustomTrigger:
            return .post
        case .deleteCustomTrigger:
            return .delete
        }
    }
    
    var body: Data? {
        switch self {
        case .createCustomTrigger(let request):
            return try? JSONEncoder().encode(request)
        case .deleteCustomTrigger , .listTriggers:
            return nil
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
}

