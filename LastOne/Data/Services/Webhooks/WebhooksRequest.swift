//
//  WebhooksEndpoint.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

enum WebhooksRequest: APIRequest {
    
    case revenueCatWebhook(RevenueCatWebhookRequestDTO)
    
    var path: String {
        return "/webhooks/revenuecat"
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var body: Data? {
        switch self {
        case .revenueCatWebhook(let request):
            return try? JSONEncoder().encode(request)
        }
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
}

