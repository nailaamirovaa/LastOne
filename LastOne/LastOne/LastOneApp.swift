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
    @StateObject private var languageManager = LanguageManager.shared

    var body: some Scene {

        WindowGroup {

            RootView()
                .environmentObject(coordinator)
                .environmentObject(languageManager)
                .environment(
                    \.locale,
                     Locale(identifier: languageManager.currentLanguage)
                )
                .id(languageManager.currentLanguage)
                .onOpenURL { url in
                    
                    guard url.scheme == "lastone" else {
                        return
                    }
                    
                    guard url.host == "reset-password" else {
                        return
                    }
                    
                    let token =  URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.first(where: {
                            $0.name == "token"
                        })?
                        .value ?? ""
                    
                    coordinator.route = .resetPassword(token: token)
                }
        }
        
    }
}
