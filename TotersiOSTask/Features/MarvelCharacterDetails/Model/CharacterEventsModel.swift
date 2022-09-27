//
//  CharacterEventsModel.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

enum CharacterEvents {
    
    //MARK: -Request
    
    struct Request: URLRequestBuilder {
        let id: Int
        var method: HTTPMethod = .getMethod
        var path: String{
            return CONST_API.API_URL.CHARACTER_EVENTS.replacingOccurrences(of: "$$", with: String(id))
        }
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
        let thumbnail: Thumbnail?
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
    struct ViewModel: ViewModelProtocol {
        var title: String
        var desc: String
        var thumbnail: String
        var extra: String
        
        init(event: CharacterEvents.Event) {
            title = event.title ?? "N/A"
            desc = event.desc ?? ""
            thumbnail = (event.thumbnail?.path ?? "") + "." + (event.thumbnail?.thumbnailExtension ?? "")
            if let startDate = event.startDate {
                extra = "Date: " + startDate
                if let endDate = event.endDate {
                    extra = extra + " --> " + endDate
                }
            } else {
                extra = ""
            }
        }
    }
}
