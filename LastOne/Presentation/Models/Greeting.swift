//
//  Greeting.swift
//  LastOne
//
//  Created by Naila Amirova on 30.06.26.
//


import Foundation
import SwiftUI

enum Greeting {

    static var text: LocalizedStringKey {

        let hour = Calendar.current.component(.hour, from: Date())

        switch hour {
        case 5..<12:
            return  "good_morning"
        case 12..<17:
            return "good_afternoon"
        case 17..<22:
            return "good_evening"
        default:
            return "good_night"
        }
    }
}
