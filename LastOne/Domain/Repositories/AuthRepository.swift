protocol AuthRepository {

    func register(email: String, password: String) async throws -> RegisterResponse

    func login(email: String, password: String) async throws -> User

    func refresh(token: String) async throws -> RefreshTokenDataDTO

    func logout(request: TokenRequestDTO) async throws
    
    func forgotPassword(email: String) async throws
    
    func resetPassword(token: String, password: String) async throws
}
