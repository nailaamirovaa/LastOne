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

    @Published var route: Route

    init() {

        let hasToken = UserDefaults.standard.string(forKey: "accessToken") != nil

        route = hasToken ? .main : .login
    }

    enum Route {
        case login
        case register
        case onboarding
        case main
    }
}
