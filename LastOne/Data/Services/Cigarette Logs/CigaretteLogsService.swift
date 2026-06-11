//
//  CigaretteLogsService.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

public final class CigaretteLogsService {
    
    private let networkManager = NetworkManager.shared
    
    // MARK: - Log A Cigarette
    func logCigarette( request: LogCigaretteRequestDTO) async throws -> LogCigaretteDataDTO {
        
        try await networkManager.requestWrapped(
            CigaretteLogsRequest.logCigarette(request),
            responseType:LogCigaretteDataDTO.self
        )
    }
    
    //MARK: - Today's Logs
    func todaysLogs() async throws -> TodaysLogsDataDTO {
        
        try await networkManager.requestWrapped(
            CigaretteLogsRequest.todaysLogs,
            responseType: TodaysLogsDataDTO.self
        )
    }
    
    //MARK: - Week Logs
    func weekLogs() async throws -> WeekLogsDataDTO {
        
        try await networkManager.requestWrapped(
            CigaretteLogsRequest.weekLogs,
            responseType:WeekLogsDataDTO.self
        )
    }
    
    //MARK: - Delete Log
    func deleteLog(id: String) async throws -> DeleteLogDataDTO {
        
        try await networkManager.requestWrapped(
            CigaretteLogsRequest.deleteLog(id: id),
            responseType:DeleteLogDataDTO.self
        )
    }
}
