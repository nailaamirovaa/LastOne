//
//  LogRepositoryImpl.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


final class LogRepositoryImpl: LogRepository {

    private let service: CigaretteLogsService

    init(service: CigaretteLogsService) {
        self.service = service
    }

    // MARK: - Log Cigarette
    func logCigarette(smokedAt: String, note: String, triggerID: String) async throws -> CigaretteLog {

        let dto = try await service.logCigarette(
            request: LogCigaretteRequestDTO(
                smokedAt: smokedAt,
                note: note,
                triggerId: triggerID
            )
        )

        guard let log = dto.log else {
            throw NetworkError.invalidResponse
        }

        return log.toEntity()
    }

    // MARK: - Todays Logs
    func getTodaysLogs() async throws -> TodayLogs {

        let dto = try await service.todaysLogs()

        return dto.toEntity()
    }

    // MARK: - Week Logs
    func getWeekLogs() async throws -> WeekLogs {

        let dto = try await service.weekLogs()

        return dto.toEntity()
    }

    // MARK: - Delete Log
    func deleteLog(id: String) async throws {

        try await service.deleteLog(id: id)
    }
}
