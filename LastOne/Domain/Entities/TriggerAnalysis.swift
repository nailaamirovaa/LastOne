//
//  TriggerAnalysis.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

struct TriggerAnalysis {
    let triggers: [TriggerStat]
    let recommendation: Recommendation?
}

struct Recommendation {
    let title: String
    let message: String
}
