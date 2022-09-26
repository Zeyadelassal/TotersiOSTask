//
//  CharacterComicsResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

enum CharacterComics {
    
    //MARK: -Request
    
    struct Request: URLRequestBuilder {
        var path: String = CONST_API.API_URL.CHARACTER_COMICS
        var method: HTTPMethod = .getMethod
        var paramaters: [String:Any]? {
            return createGetParameters()
        }
    }
    
    //MARK: -Response
    struct Response: APIResponse {
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
