//
//  CharacterDetailsModel.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

enum CharacterDetails {
    
    //MARK: -Request
    
    struct Request: URLRequestBuilder {
        let id: Int
        var method: HTTPMethod = .getMethod
        var path: String{
            return CONST_API.API_URL.CHARACTER_DETAILS.replacingOccurrences(of: "$$", with: String(id))
        }
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
        let characters: [Character]?
        
        enum CodingKeys: String, CodingKey {
            case count
            case total
            case characters = "results"
        }
    }
    
    //MARK: -View model
    struct ViewModel {
        let name: String
        let desc: String
        let thumbnail: String
        
        init(character: Character) {
            name = character.name ?? ""
            desc = character.desc ?? ""
            thumbnail = (character.thumbnail?.path ?? "") + "." + (character.thumbnail?.thumbnailExtension ?? "")
        }
    }
}
