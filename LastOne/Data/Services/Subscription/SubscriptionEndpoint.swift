//
//  SubscriptionEndpoint.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

enum SubscriptionEndpoint: Endpoint {
    
    case verifySubscription(VerifySubscriptionRequestDTO)
    
    case subscriptionStatus
    
    var path: String {
        
        switch self {
            
        case .verifySubscription:
            return "/subscription/verify"
            
        case .subscriptionStatus:
            return "/subscription/status"
        }
    }
    
    var method: HTTPMethod {
        
        switch self {
            
        case .verifySubscription:
            return .post
            
        case .subscriptionStatus:
            return .get
        }
    }
    
    var body: Data? {
        switch self {
        case .verifySubscription(let request):
            return try? JSONEncoder()
                .encode(request)
        case .subscriptionStatus:
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
