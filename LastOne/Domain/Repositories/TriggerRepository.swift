//
//  TriggerRepository.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol TriggerRepository {

    func getTriggers() async throws -> [Trigger]

    func createTrigger(name: String) async throws -> Trigger

    func deleteTrigger(id: String) async throws
}
