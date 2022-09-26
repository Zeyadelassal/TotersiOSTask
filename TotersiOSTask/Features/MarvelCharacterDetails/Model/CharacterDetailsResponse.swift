//
//  CharacterDetailsResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

enum CharacterDetails {
    
    //MARK: -Request
    
    struct Request: URLRequestBuilder {
        var path: String = CONST_API.API_URL.CHARACTER_DETAILS
        var method: HTTPMethod = .getMethod
        var paramaters: [String:Any]? {
            return createGetParameters()
        }
    }
    
    //MARK: -Response
    struct Response: APIResponse {
        var code: Int
        var message: String?
        var data: CharacterDetailsData?
    }
    
    struct CharacterDetailsData: Codable {
        let count: Int?
        let total: Int?
        let characters: [CharactersList.Character]?
        
        enum CodingKeys: String, CodingKey {
            case count
            case total
            case characters = "results"
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
