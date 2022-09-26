//
//  CharacterEventsResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

enum CharacterEvents {
    
    //MARK: -Request
    
    struct Request: URLRequestBuilder {
        var path: String = CONST_API.API_URL.CHARACTER_EVENTS
        var method: HTTPMethod = .getMethod
        var paramaters: [String:Any]? {
            return createGetParameters()
        }
    }
    
    //MARK: -Response
    struct Response: APIResponse {
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
        let thumbnail: CharactersList.Thumbnail?
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

    //MARK: -View model
    struct ViewModel {
        let id: Int
        let thumbnail: String
        
        init(character: CharactersList.Character) {
            id = character.id ?? 0
            thumbnail = (character.thumbnail?.path ?? "") + "." + (character.thumbnail?.thumbnailExtension ?? "")
        }
    }
}
