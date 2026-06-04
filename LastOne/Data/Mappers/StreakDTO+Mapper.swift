//
//  StreakDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension StreakDTO {

    func toEntity() -> Streak {

        Streak(
            currentStreak: currentStreak,
            longestStreak: longestStreak,
            lastUpdatedDate: lastUpdatedDate
        )
    }
}
