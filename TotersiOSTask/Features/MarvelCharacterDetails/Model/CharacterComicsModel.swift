//
//  CharacterComicsModel.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

enum CharacterComics {
    
    //MARK: -Request
    
    struct Request: URLRequestBuilder {
        let id: Int
        var method: HTTPMethod = .getMethod
        var path: String {
            CONST_API.API_URL.CHARACTER_COMICS.replacingOccurrences(of: "$$", with: String(id))
        }
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
    struct ViewModel: ViewModelProtocol {
        var title: String
        var desc: String
        var thumbnail: String
        var extra: String
        
        init(comic: CharacterComics.Comic) {
            title = comic.title ?? "N/A"
            desc = comic.desc ?? ""
            thumbnail = (comic.thumbnail?.path ?? "") + "." + (comic.thumbnail?.thumbnailExtension ?? "")
            if let pageCount = comic.pageCount {
                extra = "Number of pages: \(pageCount)"
            } else {
                extra = ""
            }
        }
    }
}
