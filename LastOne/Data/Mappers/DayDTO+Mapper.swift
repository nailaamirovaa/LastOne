//
//  DayDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension DayDTO {

    func toEntity() -> StatsDay {

        StatsDay(
            date: date ?? "",
            count: count ?? 0,
            goal: goal ?? 0
        )
    }
}
