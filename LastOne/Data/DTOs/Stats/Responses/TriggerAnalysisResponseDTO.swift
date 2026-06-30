//
//  TriggerAnalysisResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - DataClass
struct TriggerAnalysisDataDTO: Decodable {
    let triggers: [TriggerAnalysisTriggerDTO]?
    let recommendation: RecommendationDTO?
}

// MARK: - Trigger
struct TriggerAnalysisTriggerDTO: Decodable {
    let triggerId, triggerName: String?
    let count: Int?
}
