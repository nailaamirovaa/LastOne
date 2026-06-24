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
                .onOpenURL { url in
                    
                    print("DEEP LINK RECEIVED:", url.absoluteString)
                    
                    guard url.scheme == "lastone" else {
                        print("WRONG SCHEME")
                        return
                    }
                    
                    guard url.host == "reset-password" else {
                        print("WRONG HOST:", url.host ?? "nil")
                        return
                    }
                    
                    let token =  URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.first(where: {
                            $0.name == "token"
                        })?
                        .value ?? ""
                    
                    print("TOKEN:", token)
                    
                    coordinator.route = .resetPassword(token: token)
                }
        }
        
    }
}
