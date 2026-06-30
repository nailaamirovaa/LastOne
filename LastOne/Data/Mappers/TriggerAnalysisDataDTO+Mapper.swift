//
//  TriggerAnalysisDataDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension TriggerAnalysisDataDTO {

    func toEntity() -> TriggerAnalysis {

        TriggerAnalysis(
            triggers: (triggers ?? []).map {
                $0.toEntity()
            },
            recommendation: recommendation.map {_ in 
                Recommendation(
                    title: recommendation?.title ?? "",
                    message: recommendation?.message ?? ""
                )
            }
        )
    }
}
