//
//  LogViewModel.swift
//  LastOne
//
//  Created by Naila Amirova on 15.06.26.
//


import Foundation
import Combine

@MainActor
final class LogViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var triggers : [Trigger] = []

    @Published var todayCount = 0
    @Published var remaining = 0

    @Published var selectedTrigger: Trigger?
    @Published var note = ""

    @Published var isLoading = false
    @Published var isSaving = false
    @Published var errorMessage: String?
    @Published var lastLogDate: Date?

    @Published var didSaveLog = false

    // MARK: - Dependencies

    private let getTriggersUseCase: GetTriggersUseCase
    private let getTodayLogsUseCase: GetTodaysLogsUseCase
    private let logCigaretteUseCase: LogCigaretteUseCase

    // MARK: - Init

    init(
        getTriggersUseCase: GetTriggersUseCase,
        getTodayLogsUseCase: GetTodaysLogsUseCase,
        logCigaretteUseCase: LogCigaretteUseCase
    ) {
        self.getTriggersUseCase = getTriggersUseCase
        self.getTodayLogsUseCase = getTodayLogsUseCase
        self.logCigaretteUseCase = logCigaretteUseCase
    }
    
    var lastLogText: String {
        
        guard let lastLogDate else {
            
            return "No logs"
        }

        let interval = Int(Date().timeIntervalSince(lastLogDate))

        let hours = interval / 3600
        let minutes = (interval % 3600) / 60

        if hours > 0 {
            return "\(hours)h \(minutes)m ago"
        } else {
            return "\(minutes)m ago"
        }
    }

    // MARK: - Load Screen

    func load() {

        Task {

            isLoading = true
            errorMessage = nil

            defer {
                isLoading = false
            }

            do {

                async let triggersResult = getTriggersUseCase.execute()

                async let todayResult = getTodayLogsUseCase.execute()

                triggers = try await triggersResult

                let today = try await todayResult

                if let lastLog = today.logs.max(by: {
                    $0.createdAt < $1.createdAt
                }) {

                    let formatter = ISO8601DateFormatter()
                    formatter.formatOptions = [
                        .withInternetDateTime,
                        .withFractionalSeconds
                    ]

                    if let date = formatter.date(from: lastLog.createdAt) {
                        lastLogDate = date
                    }
                }
                
                todayCount = today.count
                remaining = today.remaining

            } catch {

                errorMessage = error.localizedDescription
            }
        }
    }

    // MARK: - Log Cigarette

    func logCigarette() {

        Task {

            isSaving = true
            errorMessage = nil

            defer {
                isSaving = false
            }

            do {

                _ = try await logCigaretteUseCase.execute(
                    smokedAt: Date(),
                    note: note.isEmpty ? "" : note,
                    triggerID: selectedTrigger?.id
                )

                didSaveLog = true

                lastLogDate = Date()

                note = ""
                selectedTrigger = nil

                let today =
                    try await getTodayLogsUseCase.execute()

                todayCount = today.count
                remaining = today.remaining

            } catch {

                errorMessage = error.localizedDescription
            }
        }
    }
}
