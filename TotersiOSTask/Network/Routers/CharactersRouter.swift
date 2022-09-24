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
            return CONST_API.API_URL.CHARACTERS
        case .getCharacterDetails(let id):
            return CONST_API.API_URL.CHARACTER_DETAILS.replacingOccurrences(of: "$$", with: String(id))
        case .getCharacterComics(let id):
            return CONST_API.API_URL.CHARACTER_COMICS.replacingOccurrences(of: "$$", with: String(id))
        case .getCharacterEvents(let id):
            return CONST_API.API_URL.CHARACTER_EVENTS.replacingOccurrences(of: "$$", with: String(id))
        case .getCharacterSeries(let id):
            return CONST_API.API_URL.CHARACTER_SERIES.replacingOccurrences(of: "$$", with: String(id))
        case .getCharacterStories(let id):
            return CONST_API.API_URL.CHARACTER_STORIES.replacingOccurrences(of: "$$", with: String(id))
        }
    }

    var paramaters: Parameters? {
        let timeStamp = getTimeStamp()
        var parameters: Parameters = [:]
        parameters[CONST_API.PARAMETER_KEY.API_KEY]    = CONST_API.PARAMETER_VALUE.PUBLIC_API_KEY
        parameters[CONST_API.PARAMETER_KEY.TIME_STAMP] = timeStamp
        parameters[CONST_API.PARAMETER_KEY.HASH]       = getMD5Hash(for: timeStamp)
        return parameters
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    private func getTimeStamp() -> Int {
        let since1970 = Date().timeIntervalSince1970
        let time = Int(since1970 * 1000)
        return time
    }

    private func getMD5Hash(for timeStamp: Int) -> String {
        let stringMD5 = "\(timeStamp)" + CONST_API.PARAMETER_VALUE.PRIVATE_API_KEY + CONST_API.PARAMETER_VALUE.PUBLIC_API_KEY
        return stringMD5.MD5
    }
}
