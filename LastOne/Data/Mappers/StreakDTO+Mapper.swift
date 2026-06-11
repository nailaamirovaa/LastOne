//
//  StreakDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension StreakDTO {

    func toEntity() -> Streak {

        Streak(
            currentStreak: currentStreak ?? 0,
            longestStreak: longestStreak ?? 0,
            lastUpdatedDate: lastUpdatedDate ?? ""
        )
    }
}
