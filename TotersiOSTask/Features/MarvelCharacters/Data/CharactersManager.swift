//
//  CharactersManager.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation


class CharactersManager {
    
    private init(){}
    
    class func sharedInstance() -> CharactersManager {
        struct Singleton{
            static var shared = CharactersManager()
        }
        return Singleton.shared
    }
    
    func getAllCharacters(completion: @escaping(Result<CharactersResponseData,ResponseError>) -> Void) {
        CharactersRouter.getCharacters.send(CharactersResponse.self) { response in
            switch response {
            case .success(let value):
                if let charactersData = value.data {
                    completion(.success(charactersData))
                } else {
                    completion(.failure(value.error))
                }
            case .failure(let error):
                completion(.failure((error)))
            }
        }
    }
    
    func getCharacterDetails(for id: Int) {
        CharactersRouter.getCharacterDetails(id: id).send(CharacterDetailsResponse.self) { response in
            switch response {
            case .success(let value):
                print("VALUE_MARVEL", value)
            case .failure(let error):
                print("ERROR_MARVEL", error)
            }
        }
    }

    func getCharacterComics(for id: Int) {
        CharactersRouter.getCharacterComics(id: id).send(CharacterComicsResponse.self) { response in
            switch response {
            case .success(let value):
                print("VALUE_MARVEL", value)
            case .failure(let error):
                print("ERROR_MARVEL", error)
            }
        }
    }

    
    func getCharacterEvents(for id: Int) {
        CharactersRouter.getCharacterEvents(id: id).send(CharacterEventsResponse.self) { response in
            switch response {
            case .success(let value):
                print("VALUE_MARVEL", value)
            case .failure(let error):
                print("ERROR_MARVEL", error)
            }
        }
    }
    
    func getCharacterSeries(for id: Int) {
        CharactersRouter.getCharacterSeries(id: id).send(CharacterSeriesResponse.self) { response in
            switch response {
            case .success(let value):
                print("VALUE_MARVEL", value)
            case .failure(let error):
                print("ERROR_MARVEL", error)
            }
        }
    }
    
    func getCharacterStories(for id: Int) {
        CharactersRouter.getCharacterStories(id: id).send(CharacterStoriesResponse.self) { response in
            switch response {
            case .success(let value):
                print("VALUE_MARVEL", value)
            case .failure(let error):
                print("ERROR_MARVEL", error)
            }
        }
    }

}
