//
//  InsightsViewModel.swift
//  LastOne
//
//  Created by Naila Amirova on 19.06.26.
//

import Foundation
import Combine

@MainActor
final class InsightsViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var triggerStats: [TriggerStat] = []

    @Published var isLoading = false
    @Published var errorMessage: String?
    
    @Published var hasData: Bool = false

    // MARK: - Dependencies

    private let getTriggerAnalysisUseCase: GetTriggerAnalysisUseCase

    // MARK: - Init

    init(
        getTriggerAnalysisUseCase: GetTriggerAnalysisUseCase
    ) {
        self.getTriggerAnalysisUseCase = getTriggerAnalysisUseCase
    }

    // MARK: - Load
    

    func load() {

        Task {

            isLoading = true
            errorMessage = nil

            defer {
                isLoading = false
            }

            do {

                let triggers = try await getTriggerAnalysisUseCase.execute()

                let totalCount = triggers.triggers.reduce(0) { $0 + $1.count}

                let mappedTriggers: [TriggerStat] = triggers.triggers.map { trigger in

                    let percentage = totalCount > 0 ? Int(Double(trigger.count) / Double(totalCount) * 100) : 0

                    return TriggerStat(
                        triggerID: trigger.triggerID,
                        triggerName: trigger.triggerName,
                        count: trigger.count,
                        percentage: percentage
                    )
                }

                triggerStats = mappedTriggers.sorted { lhs, rhs in
                    lhs.count > rhs.count
                }
                
                if !triggerStats.isEmpty  { hasData =  true }
                else { hasData =  false }

            } catch {

                errorMessage =
                    error.localizedDescription
            }
        }
    }
}
