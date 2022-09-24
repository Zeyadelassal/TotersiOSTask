//
//  CharacterStoriesResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

struct CharacterStoriesResponse: APIResponse {
    var code: Int
    var message: String?
    var data: CharacterStoriessData?
}


struct CharacterStoriessData: Codable {
    let count: Int?
    let total: Int?
    let stories: [Story]?
    
    enum CodingKeys: String, CodingKey {
        case count
        case total
        case stories = "results"
    }
}

struct Story: Codable {
    let id: Int?
    let title: String?
    let desc: String?
    let thumbnail: Thumbnail?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case desc      = "description"
        case thumbnail
    }
}
