//
//  DayDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension DayDTO {

    func toEntity() -> StatsDay {

        StatsDay(
            date: date,
            count: count,
            goal: goal
        )
    }
}
