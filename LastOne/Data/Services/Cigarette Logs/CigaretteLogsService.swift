//
//  CigaretteLogsService.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

public final class CigaretteLogsService {
    
    private let networkManager =
    NetworkManager.shared
    
    // MARK: - Log A Cigarette
    
    func logCigarette(
        request: LogCigaretteRequestDTO
    ) async throws -> LogCigaretteResponseDTO {
        
        try await networkManager.request(
            
            CigaretteLogsEndpoint.logCigarette(request),
            
            responseType:
                LogCigaretteResponseDTO.self
        )
    }
    
    //MARK: - Today's Logs
    
    func todaysLogs()
    async throws -> TodaysLogsResponseDTO {
        
        try await networkManager.request(
            
            CigaretteLogsEndpoint.todaysLogs,
            
            responseType:
                TodaysLogsResponseDTO.self
        )
    }
    
    //MARK: - Week Logs
    
    func weekLogs()
    async throws -> WeekLogsResponseDTO {
        
        try await networkManager.request(
            
            CigaretteLogsEndpoint.weekLogs,
            
            responseType:
                WeekLogsResponseDTO.self
        )
    }
    
    //MARK: - Delete Log
    
    func deleteLog(
        id: String
    ) async throws -> DeleteLogResponseDTO {
        
        try await networkManager.request(
            
            CigaretteLogsEndpoint.deleteLog(id: id),
            
            responseType:
                DeleteLogResponseDTO.self
        )
    }
}
