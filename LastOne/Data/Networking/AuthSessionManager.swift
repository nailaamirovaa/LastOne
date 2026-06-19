import Foundation
import Combine

/// Manages the authentication session, including token storage and validity.
final class AuthSessionManager: ObservableObject {
    
    static let shared = AuthSessionManager()
    
    @Published private(set) var isAuthenticated = false
    
    private let accessTokenKey = "com.lastone.accessToken"
    private let refreshTokenKey = "com.lastone.refreshToken"
    
    private init() {
        // Initial check for session existence
        self.isAuthenticated = accessToken != nil
    }
    
    // MARK: - Token Access
    
    var accessToken: String? {
        get { UserDefaults.standard.string(forKey: accessTokenKey) }
        set { 
            UserDefaults.standard.set(newValue, forKey: accessTokenKey)
            updateAuthState()
        }
    }
    
    var refreshToken: String? {
        get { UserDefaults.standard.string(forKey: refreshTokenKey) }
        set { UserDefaults.standard.set(newValue, forKey: refreshTokenKey) }
    }
    
    // MARK: - Session Management
    
    /// Validates the current session and attempts refresh if needed.
    func restoreSession() async -> Bool {
        guard let token = accessToken, let _ = refreshToken else {
            return false
        }
        
        if isTokenExpired(token) {
            return await refreshSession()
        }
        
        return true
    }
    
    func saveSession(accessToken: String, refreshToken: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
    
    func refreshSession() async -> Bool {
        guard let refreshToken = refreshToken else {
            logout()
            return false
        }
        
        do {
            // Using a specialized service/repository to refresh
            let repository = AuthRepositoryImpl(service: AuthService())
            let response = try await repository.refresh(token: refreshToken)
            
            saveSession(accessToken: response.accessToken ?? "", 
                        refreshToken: response.refreshToken ?? "")
            return true
        } catch {
            print("Refresh failed: \(error)")
            logout()
            return false
        }
    }
    
    func logout() {
        accessToken = nil
        refreshToken = nil
        UserDefaults.standard.removeObject(forKey: accessTokenKey)
        UserDefaults.standard.removeObject(forKey: refreshTokenKey)
        isAuthenticated = false
    }
    
    // MARK: - Helpers
    
    private func updateAuthState() {
        isAuthenticated = accessToken != nil
    }
    
    private func isTokenExpired(_ token: String) -> Bool {
        let parts = token.components(separatedBy: ".")
        guard parts.count == 3 else { return true }
        
        let base64 = parts[1]
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        
        let padded = base64.padding(toLength: ((base64.count + 3) / 4) * 4,
                                     withPad: "=",
                                     startingAt: 0)
        
        guard let data = Data(base64Encoded: padded),
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let exp = json["exp"] as? TimeInterval else {
            return true
        }
        
        let expiryDate = Date(timeIntervalSince1970: exp)
        // Refresh 1 minute before expiry for safety
        return expiryDate < Date().addingTimeInterval(60)
    }
}
