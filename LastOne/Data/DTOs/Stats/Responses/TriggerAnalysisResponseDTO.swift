//
//  TriggerAnalysisResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Response
struct TriggerAnalysisResponseDTO: Decodable {
    let success: Bool
    let data: TriggerAnalysisDataDTO
}

// MARK: - DataClass
struct TriggerAnalysisDataDTO: Decodable {
    let triggers: [TriggerAnalysisTriggerDTO]
}

// MARK: - Trigger
struct TriggerAnalysisTriggerDTO: Decodable {
    let triggerID, triggerName: String
    let count: Int

    enum CodingKeys: String, CodingKey {
        case triggerID = "triggerId"
        case triggerName, count
    }
}
