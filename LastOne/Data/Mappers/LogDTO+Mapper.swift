//
//  LogDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

import Foundation

extension LogDTO {

    func toEntity() -> CigaretteLog {

        CigaretteLog(
            id: id,
            userID: userId,
            smokedAt: smokedAt,
            note: note,
            triggerID: triggerId,
            trigger: trigger.toEntity(),
            createdAt: createdAt
        )
    }
}
