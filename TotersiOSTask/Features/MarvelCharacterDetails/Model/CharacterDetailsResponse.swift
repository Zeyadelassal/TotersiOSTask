//
//  CharacterDetailsResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

struct CharacterDetailsResponse: APIResponse {
    var code: Int
    var message: String?
    var data: CharacterDetailsData?
}


struct CharacterDetailsData: Codable {
    let count: Int?
    let total: Int?
    let characters: [Character]?
    
    enum CodingKeys: String, CodingKey {
        case count
        case total
        case characters = "results"
    }
}
