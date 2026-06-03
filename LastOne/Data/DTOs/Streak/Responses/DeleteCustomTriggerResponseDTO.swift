//
//  DeleteCustomTriggerResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

struct DeleteCustomTriggerResponseDTO: Decodable {
    let success: Bool
    let data: DeleteCustomTriggerDataDTO
}

struct DeleteCustomTriggerDataDTO: Decodable {
    let message: String
}
