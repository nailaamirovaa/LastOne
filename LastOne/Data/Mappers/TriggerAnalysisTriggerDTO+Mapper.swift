//
//  TriggerAnalysisTriggerDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension TriggerAnalysisTriggerDTO {

    func toEntity() -> TriggerStat {

        TriggerStat(
            triggerID: triggerID,
            triggerName: triggerName,
            count: count
        )
    }
}
