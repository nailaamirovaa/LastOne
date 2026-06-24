import Foundation
import SwiftUI
import Combine

class LanguageManager: ObservableObject {
    static let shared = LanguageManager()
    
    @Published var currentLanguage: String {
        didSet {
            UserDefaults.standard.set(currentLanguage, forKey: "appLanguage")
        }
    }
    
    private init() {
        if let savedLanguage = UserDefaults.standard.string(forKey: "appLanguage") {
            self.currentLanguage = savedLanguage
        } else {
            // Default to device locale if not previously set, fallback to "en"
            let preferred = Locale.preferredLanguages.first ?? "en"
            if preferred.hasPrefix("az") {
                self.currentLanguage = "az"
            } else {
                self.currentLanguage = "en"
            }
        }
    }
    
    func toggle() {
        if currentLanguage == "az" {
            currentLanguage = "en"
        } else {
            currentLanguage = "az"
        }
    }
}
