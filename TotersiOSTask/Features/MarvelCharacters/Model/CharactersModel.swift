//
//  CharactersModel.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation
import Alamofire

enum CharactersList {
    
    //MARK: -Request
    
    struct Request: URLRequestBuilder {
        var path: String = CONST_API.API_URL.CHARACTERS
        var method: HTTPMethod = .get
        var paramaters: [String:Any]? {
            return createGetParameters()
        }
    }
    
    //MARK: -Response
    struct Response: APIResponse {
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
    
    //MARK: -View model
    struct ViewModel {
        let id: Int
        let thumbnail: String
        
        init(character: Character) {
            id = character.id ?? 0
            thumbnail = (character.thumbnail?.path ?? "") + "." + (character.thumbnail?.thumbnailExtension ?? "")
        }
    }
}





