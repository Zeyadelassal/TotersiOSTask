//
//  CharactersRouter.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation
import Alamofire

enum CharactersRouter: URLRequestBuilder {

    case getCharacters
    case getCharacterDetails(id: Int)
    case getCharacterComics(id:Int)
    case getCharacterEvents(id:Int)
    case getCharacterSeries(id:Int)
    case getCharacterStories(id:Int)
    
    var path: String {
        switch self {
        case .getCharacters:
            return CONST_API.CHARACTERS
        case .getCharacterDetails(let id):
            return CONST_API.CHARACTER_DETAILS.replacingOccurrences(of: "$$", with: String(id))
        case .getCharacterComics(let id):
            return CONST_API.CHARACTER_COMICS.replacingOccurrences(of: "$$", with: String(id))
        case .getCharacterEvents(let id):
            return CONST_API.CHARACTER_EVENTS.replacingOccurrences(of: "$$", with: String(id))
        case .getCharacterSeries(let id):
            return CONST_API.CHARACTER_SERIES.replacingOccurrences(of: "$$", with: String(id))
        case .getCharacterStories(let id):
            return CONST_API.CHARACTER_STORIES.replacingOccurrences(of: "$$", with: String(id))
        }
    }

    var paramaters: Parameters? {
        
    }
    
    
    var method: Alamofire.HTTPMethod

}
