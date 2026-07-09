//
//  MockLoginUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 09.07.26.
//

@testable import LastOne

final class MockLoginUseCase: LoginUseCase {

    // Test zamanı idarə edəcəyimiz dəyişənlər
    var shouldSucceed = true

    var returnedUser = User(
        id: "1",
        email: "test@test.com",
        isOnboardingComplete: true,
        subscriptionStatus: "premium"
    )

    var returnedError: Error = NetworkError.invalidResponse

    func execute(email: String, password: String) async throws -> User {

        if shouldSucceed {
            return returnedUser
        } else {
            throw returnedError
        }
    }
}
