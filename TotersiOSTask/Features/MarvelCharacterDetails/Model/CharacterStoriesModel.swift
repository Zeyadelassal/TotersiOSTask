//
//  CharacterStoriesModel.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

enum CharacterStories {
    
    //MARK: -Request
    
    struct Request: URLRequestBuilder {
        let id: Int
        var method: HTTPMethod = .getMethod
        var path: String {
            return CONST_API.API_URL.CHARACTER_STORIES.replacingOccurrences(of: "$$", with: String(id))
        }
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
        let thumbnail: Thumbnail?
        
        enum CodingKeys: String, CodingKey {
            case id
            case title
            case desc      = "description"
            case thumbnail
        }
    }

    //MARK: -View model
    struct ViewModel: ViewModelProtocol {
        var title: String
        var desc: String
        var thumbnail: String
        var extra: String
        
        init(story: CharacterStories.Story) {
            title = story.title ?? "N/A"
            desc = story.desc ?? ""
            thumbnail = (story.thumbnail?.path ?? "") + "." + (story.thumbnail?.thumbnailExtension ?? "")
            extra = ""
        }
    }
}
