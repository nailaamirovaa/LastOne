//
//  StatsEndpoint.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

enum StatsEndpoint: Endpoint {

    case dailyStats(date: String?)

    case weeklyStats(week: String?)

    case monthlyStats(month: String?)
    
    case overview
    
    case triggerAnalysis
    
    case exportCSV
    
    var path: String {

        switch self {

        case .dailyStats:
            return "/stats/daily"

        case .weeklyStats:
            return "/stats/weekly"

        case .monthlyStats:
            return "/stats/monthly"
            
        case .exportCSV:
            return "/stats/export"
            
        case .overview:
            return "/stats/overview"
            
        case .triggerAnalysis:
            return "/stats/triggers"
        }
    }
    
    var method: HTTPMethod {

        switch self {

        case .dailyStats, .weeklyStats, .monthlyStats, .overview , .triggerAnalysis, .exportCSV:
            return .get
        }
    }
    
    var body: Data? {
        nil
    }
    
    var headers: [String : String]? {
        nil
    }

    var queryItems: [URLQueryItem]? {

        switch self {

        case .dailyStats(let date):

            guard let date else {
                return nil
            }

            return [
                URLQueryItem(
                    name: "date",
                    value: date
                )
            ]
            
        case .weeklyStats(let week):
            
            guard let week else {
                return nil
            }
            
            return [
                URLQueryItem(
                    name: "week",
                    value: week
                )
            ]
            
        case .monthlyStats(let month):
            
            guard let month else {
                return nil
            }
            
            return [
                URLQueryItem(
                    name: "month",
                    value: month
                )
            ]
            
        case .exportCSV, .overview , .triggerAnalysis:
            return nil
        }
        
    
    }
}
