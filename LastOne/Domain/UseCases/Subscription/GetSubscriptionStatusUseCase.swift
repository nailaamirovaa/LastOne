//
//  GetSubscriptionStatusUseCase.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol GetSubscriptionStatusUseCase {

    func execute() async throws -> Subscription
}

final class GetSubscriptionStatusUseCaseImpl: GetSubscriptionStatusUseCase {

    private let repository: SubscriptionRepository

    init(repository: SubscriptionRepository) {
        self.repository = repository
    }

    func execute() async throws -> Subscription {

        try await repository.getSubscriptionStatus()
    }
}
