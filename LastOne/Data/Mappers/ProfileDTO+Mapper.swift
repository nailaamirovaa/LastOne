//
//  ProfileDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension ProfileDTO {

    func toEntity() -> Profile {

        Profile(
            dailyGoalStart: dailyGoalStart,
            dailyGoalCurrent: dailyGoalCurrent,
            dailyGoalFinal: dailyGoalFinal,
            reductionPaceWeeks: reductionPaceWeeks,
            timezone: timezone
        )
    }
}
