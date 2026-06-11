//
//  TriggerAnalysisTriggerDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension TriggerAnalysisTriggerDTO {

    func toEntity() -> TriggerStat {

        TriggerStat(
            triggerID: triggerId  ?? "",
            triggerName: triggerName ?? "",
            count: count ?? 0
        )
    }
}
