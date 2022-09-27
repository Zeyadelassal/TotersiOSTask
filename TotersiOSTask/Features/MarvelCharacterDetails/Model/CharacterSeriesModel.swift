//
//  CharacterSeriesModel.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import Foundation

enum CharacterSeries {
    
    //MARK: -Request
    
    struct Request: URLRequestBuilder {
        let id: Int
        var method: HTTPMethod = .getMethod
        var path: String {
            return CONST_API.API_URL.CHARACTER_SERIES.replacingOccurrences(of: "$$", with: String(id))
        }
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
    struct ViewModel: ViewModelProtocol {
        var title: String
        var desc: String
        var thumbnail: String
        var extra: String

        init(series: CharacterSeries.Series) {
            title = series.title ?? "N/A"
            desc = series.desc ?? "N/A"
            thumbnail = (series.thumbnail?.path ?? "") + "." + (series.thumbnail?.thumbnailExtension ?? "")
            if let rating = series.rating {
                extra = "Rating: \(rating)"
            } else {
                extra = ""
            }
        }
    }
}




