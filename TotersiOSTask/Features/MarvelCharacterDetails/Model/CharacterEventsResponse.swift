//
//  CharacterEventsResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

struct CharacterEventsResponse: APIResponse {
    var code: Int
    var message: String?
    var data: CharacterEventsData?
}


struct CharacterEventsData: Codable {
    let count: Int?
    let total: Int?
    let events: [Event]?
    
    enum CodingKeys: String, CodingKey {
        case count
        case total
        case events = "results"
    }
}

struct Event: Codable {
    let id: Int?
    let title: String?
    let desc: String?
    let thumbnail: Thumbnail?
    let startDate: String?
    let endDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case desc      = "description"
        case thumbnail
        case startDate = "start"
        case endDate   = "end"
    }
}
