//
//  CharacterSeriesResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import Foundation

enum CharacterSeries {
    
    //MARK: -Request
    
    struct Request: URLRequestBuilder {
        var path: String = CONST_API.API_URL.CHARACTER_SERIES
        var method: HTTPMethod = .getMethod
        var paramaters: [String:Any]? {
            return createGetParameters()
        }
    }
    
    //MARK: -Response
    struct Response: APIResponse {
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




