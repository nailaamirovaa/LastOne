//
//  ProfileDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension ProfileDTO {

    func toEntity() -> Profile {

        Profile(
            dailyGoalStart: dailyGoalStart ?? 0,
            dailyGoalCurrent: dailyGoalCurrent ?? 0,
            dailyGoalFinal: dailyGoalFinal ?? 0,
            reductionPaceWeeks: reductionPaceWeeks ?? 0,
            timezone: timezone ?? ""
        )
    }
}
