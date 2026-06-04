//
//  TriggerAnalysisDataDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension TriggerAnalysisDataDTO {

    func toEntity() -> TriggerAnalysis {

        TriggerAnalysis(
            triggers: triggers.map {
                $0.toEntity()
            }
        )
    }
}
