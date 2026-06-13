//
//  LastOneApp.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import SwiftUI

@main
struct LastOneApp: App {

    @StateObject private var coordinator = AppCoordinator()

    var body: some Scene {

        WindowGroup {

            RootView()
                .environmentObject(coordinator)
        }
    }
}
