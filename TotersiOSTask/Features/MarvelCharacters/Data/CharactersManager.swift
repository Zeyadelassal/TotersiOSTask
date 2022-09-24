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
    
    func getAllCharacters() {
        CharactersRouter.getCharacters.send(CharactersResponse.self) { response in
            switch response {
            case .success(let value):
                print("VALUE_MARVEL", value)
            case .failure(let error):
                print("ERROR_MARVEL", error)
            }
        }
    }
    
    func getCharacterDetails(for id: Int) {
        CharactersRouter.getCharacterDetails(id: id).send(CharactersResponse.self) { response in
            switch response {
            case .success(let value):
                print("VALUE_MARVEL", value)
            case .failure(let error):
                print("ERROR_MARVEL", error)
            }
        }
    }

    func getCharacterComics(for id: Int) {
        CharactersRouter.getCharacterComics(id: id).send(CharactersResponse.self) { response in
            switch response {
            case .success(let value):
                print("VALUE_MARVEL", value)
            case .failure(let error):
                print("ERROR_MARVEL", error)
            }
        }
    }

    
    func getCharacterEvents(for id: Int) {
        CharactersRouter.getCharacterEvents(id: id).send(CharactersResponse.self) { response in
            switch response {
            case .success(let value):
                print("VALUE_MARVEL", value)
            case .failure(let error):
                print("ERROR_MARVEL", error)
            }
        }
    }
    
    func getCharacterSeries(for id: Int) {
        CharactersRouter.getCharacterSeries(id: id).send(CharactersResponse.self) { response in
            switch response {
            case .success(let value):
                print("VALUE_MARVEL", value)
            case .failure(let error):
                print("ERROR_MARVEL", error)
            }
        }
    }
    
    func getCharacterStories(for id: Int) {
        CharactersRouter.getCharacterStories(id: id).send(CharactersResponse.self) { response in
            switch response {
            case .success(let value):
                print("VALUE_MARVEL", value)
            case .failure(let error):
                print("ERROR_MARVEL", error)
            }
        }
    }

}
