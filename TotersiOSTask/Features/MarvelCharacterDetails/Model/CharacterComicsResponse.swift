//
//  CharacterComicsResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

struct CharacterComicsResponse: APIResponse {
    var code: Int
    var message: String?
    var data: CharacterComicsData?
}


struct CharacterComicsData: Codable {
    let count: Int?
    let total: Int?
    let comics: [Comic]?
    
    enum CodingKeys: String, CodingKey {
        case count
        case total
        case comics = "results"
    }
}

struct Comic: Codable {
    let id: Int?
    let title: String?
    let desc: String?
    let thumbnail: Thumbnail?
    let pageCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case desc      = "description"
        case thumbnail
        case pageCount
    }
}

