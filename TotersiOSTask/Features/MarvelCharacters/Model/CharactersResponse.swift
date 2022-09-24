//
//  CharactersResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

struct CharactersResponse: APIResponse {
    var code: Int
    var message: String?
    var data: CharactersResponseData?
}

struct CharactersResponseData: Codable {
    let count: Int?
    let total: Int?
    let characters: [Character]?
    
    enum CodingKeys: String, CodingKey {
        case count
        case total
        case characters = "results"
    }
}

struct Character: Codable {
    let id: Int?
    let name: String?
    let thumbnail: Thumbnail?
}

struct Thumbnail: Codable {
    let path: String?
    let thumbnailExtension: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

