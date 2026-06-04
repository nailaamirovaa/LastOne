//
//  TriggerDTO+Mapper.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

extension TriggerDTO {

    func toEntity() -> Trigger {

        Trigger(
            id: id,
            name: name,
            isDefault: isDefault
        )
    }
}
