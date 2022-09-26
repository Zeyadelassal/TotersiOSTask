//
//  CharacterStoriesResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

enum CharacterStories {
    
    //MARK: -Request
    
    struct Request: URLRequestBuilder {
        var path: String = CONST_API.API_URL.CHARACTER_STORIES
        var method: HTTPMethod = .getMethod
        var paramaters: [String:Any]? {
            return createGetParameters()
        }
    }
    
    //MARK: -Response
    struct Response: APIResponse {
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
        let thumbnail: CharactersList.Thumbnail?
        
        enum CodingKeys: String, CodingKey {
            case id
            case title
            case desc      = "description"
            case thumbnail
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
