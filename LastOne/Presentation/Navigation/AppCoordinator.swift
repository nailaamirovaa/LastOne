//
//  AppCoordinator.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//

import Foundation
import Combine


@MainActor
final class AppCoordinator: ObservableObject {

    @Published var route: Route = .onboarding

    enum Route {
        case login
        case register
        case onboarding
        case main
    }
}
