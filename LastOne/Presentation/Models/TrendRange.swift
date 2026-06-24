//
//  TrendRange.swift
//  LastOne
//
//  Created by Naila Amirova on 23.06.26.
//

import SwiftUI


enum TrendRange: CaseIterable {
    case week, month, year

    var title: LocalizedStringKey {
        switch self {
        case .week:
            return "week"
        case .month:
            return "month"
        case .year:
            return "year"
        }
    }
}
