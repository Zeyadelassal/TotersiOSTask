//
//  CharacterSeriesResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import Foundation

struct CharacterSeriesResponse: APIResponse {
    var code: Int
    var message: String?
    var data: CharacterSeriesData?
}


struct CharacterSeriesData: Codable {
    let count: Int?
    let total: Int?
    let series: [Series]?
    
    enum CodingKeys: String, CodingKey {
        case count
        case total
        case series = "results"
    }
}

struct Series: Codable {
    let id: Int?
    let title: String?
    let desc: String?
    let thumbnail: Thumbnail?
    let rating: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case desc      = "description"
        case thumbnail
        case rating
    }
}
