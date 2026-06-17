//
//  UserDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension UserDTO {

    func toEntity() -> User {

        User(
            id: id ?? "",
            email: email ?? "",
            isOnboardingComplete: isOnboardingComplete ?? false,
            subscriptionStatus: subscriptionStatus,
        )
    }
}
